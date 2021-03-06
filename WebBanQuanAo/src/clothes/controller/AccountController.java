package clothes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import clothes.bean.AccountBean;
import clothes.bean.AdminMailer;
import clothes.dao.AccountDAO;
import clothes.entity.Account;
import clothes.utils.Constants;

import java.util.Base64;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private AdminMailer mailer;
	
	@Autowired
	HttpServletRequest request;
	
	public Cookie create(String name, String value, int days) {
		String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodedValue);
		cookie.setMaxAge(days * 24 * 60 * 60);
		cookie.setPath("/");
		return cookie;
	}
	public Cookie read(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					String decodedvalue = new String(Base64.getDecoder().decode(cookie.getValue()));
					cookie.setValue(decodedvalue);
					return cookie;
				}
			}
		}
		return null;
	}
	public void delete(String name) {
		this.create(name, "", 0);
	}
	@RequestMapping(value = "signin", method = RequestMethod.GET)
	public String signin(ModelMap model, HttpServletRequest request) {
		Cookie ckemail = this.read(request, "email");
		Cookie ckpw = this.read(request, "pass");
		if (ckemail != null) {
			String uemail = ckemail.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("email", uemail);
			model.addAttribute("pwd", pwd);
		}
		return "account/signin";
	}
	@RequestMapping(value = "signin", method = RequestMethod.POST)
	public String signin(ModelMap model, HttpServletResponse response, HttpSession session,
			@RequestParam("email") String email, @RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {

		boolean isEmail = false;
		if (email.contains("@"))
			isEmail = true;

		Account user = null;

		if (isEmail) {
			user = accountDAO.findByEmail(email);
		} else {
			user = accountDAO.findByPhone(email);
		}

		if (user == null) {
			model.addAttribute("message", "Email/S??T kh??ng ch??nh x??c!");
		} else if (user.getStatus() == 1) {
			model.addAttribute("message", "T??i kho???n ???? b??? kho??, vui l??ng li??n h??? admin ????? m??? kho??");
		} else if (!Constants.md5(pw).equals(user.getPassword())) {
			model.addAttribute("message", "M???t kh???u kh??ng h???p l???!!");
		} else {
			session.setAttribute("account", user);
			if (rm == true) {
				Cookie ckemail = this.create("email", user.getEmail(), 30);
				Cookie ckpass = this.create("pass", pw, 30);

				response.addCookie(ckemail);
				response.addCookie(ckpass);

			} else {
				this.delete("email");
				this.delete("pass");
			}
			return "redirect:/home.htm";
		}
		return "account/signin";
	}
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String signup(ModelMap model, HttpSession session) {

		AccountBean aBean = new AccountBean();
		model.addAttribute("user", aBean);
		return "account/register";
	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String signup1(ModelMap model, RedirectAttributes reAttributes, HttpSession session,
			@Validated @ModelAttribute("user") AccountBean aBean, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("user", aBean);
			return "account/register";
		}
		Account exists = accountDAO.findByEmail(aBean.getEmail());
		if (exists != null) {
			errors.rejectValue("email", "user", "Email n??y ???? ???????c ????ng k??!");
			return "account/register";
		}
		exists = accountDAO.findByPhone(aBean.getPhone());
		if (exists != null) {
			errors.rejectValue("phone", "user", "S??T n??y ???? ???????c ????ng k??!");
			return "account/register";
		}
		Account user = new Account();
		user.setFullname(aBean.getFullname());
		user.setEmail(aBean.getEmail());
		user.setPhone(aBean.getPhone());
		user.setAddress(aBean.getAddress());
		user.setPassword(Constants.md5(aBean.getPassword()));
		user.setNgaytao(new Date());
		user.setStatus(0);
		user.setType("normal");

		boolean add = accountDAO.insert(user);
		System.out.println(add ? "OK" : "Ko");
		if (add) {
			model.addAttribute("message", "????ng k?? th??nh c??ng!");
			return "account/register";
		} else {
			model.addAttribute("message", "????ng k?? th???t b???i");
		}
		model.addAttribute("accountBean", aBean);
		return "account/register";
	}
	@RequestMapping(value = "forgot", method = RequestMethod.GET)
	public String forgot(ModelMap model) {
		return "account/forgot";
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "forgot", method = RequestMethod.POST)
	public String forgot(ModelMap model, RedirectAttributes reAttributes, @RequestParam("email") String email,
			HttpServletRequest request, HttpServletResponse response, HttpSession ss) {
		String captcha = ss.getAttribute("captcha_security").toString();
		String verifyCaptcha = request.getParameter("captcha");

		boolean verify = false;
		if (captcha.equals(verifyCaptcha)) {
			verify = true;
		} else {
			verify = false;
		}
		if (!verify) {
			model.addAttribute("message", "Vui l??ng nh???p Captcha");
			return "account/forgot";
		} else {
			Account user = accountDAO.findByEmail(email);
			if (user == null) {
				model.addAttribute("message", "Email ch??a ????ng k??");
			} else {

				String code = Constants.randomCode(6);

				ss.setAttribute(email, code);

				String from = "quangtuong64@gmail.com";
				String to = email;
				String subject = "Qu??n m???t kh???u";
				String body = "M?? kh??i ph???c c???a b???n l??:  " + code;

				mailer.sendmailer(from, to, subject, body);
				model.addAttribute("message", "M?? x??c nh???n ???? ???????c g???i ?????n h???p th?? c???a b???n");

				model.addAttribute("email", email);
				return "account/code";
			}
		}
		return "account/forgot";
	}
	@RequestMapping(value = "change", method = RequestMethod.GET)
	public String change(ModelMap model) {
		return "account/change";
	}
	@RequestMapping(value = "change", method = RequestMethod.POST)
	public String change(ModelMap model, @RequestParam("email") String email, @RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1, @RequestParam("pw2") String pw2) {
		System.out.println(pw);
		if (pw.equals("")) {
			model.addAttribute("message", "M???t kh???u r???ng!!");
			return "account/change";
		}
		Account user = accountDAO.findByEmail(email);
		if (user == null) {
			model.addAttribute("message", "Vui l??ng nh???p Email h???p l???!");
		} 
		else if (Constants.md5(pw1).equals(user.getPassword())) {
			model.addAttribute("message", "M???t kh???u kh??ng ????ng!");
		} else {
			if (!pw1.equals(pw2)) {
				model.addAttribute("message", "X??c nh???n m???t kh???u kh??ng kh???p!");
			} else {
				user.setPassword(Constants.md5(pw1));
				accountDAO.update(user);
				String url = request.getServletContext().getContextPath() + "/";
				model.addAttribute("message",
						"?????i m???t kh???u th??nh c??ng! <br/>" + "<a href='" + url + "'>Quay v??? trang ch???</a>");
			}
		}
		return "account/change";
	}
	@RequestMapping(value = "change_forgot", method = RequestMethod.GET)
	public String changeForgot(ModelMap model) {
		return "account/change_forgot";
	}

	@RequestMapping("code")
	public String code(ModelMap model) {
		return "account/code";
	}
	@RequestMapping(value = "code", method = RequestMethod.POST)
	public String code(ModelMap model, RedirectAttributes reAttributes, HttpSession session,
			@RequestParam("email") String email, @RequestParam("code") String code) {
		String ranCode = (String) session.getAttribute(email);
		if (ranCode == null || ranCode.length() == 0) {
			System.out.println("random code kh??ng t???n t???i!");
			return "redirect:/home.htm";
		}
		System.out.println(ranCode + " - " + code);
		if (ranCode.equals(code)) {
			model.addAttribute("email", email);
			return "account/change_forgot";
		}

		model.addAttribute("email", email);
		model.addAttribute("message", "M?? code kh??ng ch??nh x??c!");
		return "account/code";
	}
	@RequestMapping(value = "change_forgot", method = RequestMethod.POST)
	public String changeForgot(ModelMap model, @RequestParam("email") String email, @RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2) {

		Account user = accountDAO.findByEmail(email);
		if (user == null) {
			model.addAttribute("message", "Vui l??ng nh???p Email h???p l???!");
		} else {
			if (!pw1.equals(pw2)) {
				model.addAttribute("message", "X??c nh???n m???t kh???u kh??ng kh???p!");
			} else {
				user.setPassword(Constants.md5(pw1));
				accountDAO.update(user);
				String url = request.getServletContext().getContextPath() + "/account/signin.htm";
				model.addAttribute("message",
						"?????i m???t kh???u th??nh c??ng. " + "Click <a href='" + url + "'>v??o ????y</a> ????? ????ng nh???p");
			}
		}
		model.addAttribute("email", email);
		return "account/change_forgot";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("account");
		return "redirect:/home.htm";
	}
}
