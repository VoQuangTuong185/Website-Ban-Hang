package clothes.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import clothes.bean.ProfileBean;
import clothes.dao.AccountDAO;
import clothes.entity.Account;

@Controller
@RequestMapping("/account/")
public class ProfileController {
	
	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping("profile")
	public String profile(ModelMap model, RedirectAttributes reAttributes, HttpSession session) {
		Account user = (Account) session.getAttribute("account");
		
		if(user == null) {
			return "redirect:/home.htm";
		}

		ProfileBean accountBean = new ProfileBean();
		accountBean.setFullname(user.getFullname());
		accountBean.setEmail(user.getEmail());
		accountBean.setPhone(user.getPhone());
		accountBean.setAddress(user.getAddress());

		model.addAttribute("accountBean", accountBean);

		return "account/profile";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String editProfile(ModelMap model, RedirectAttributes reAttributes,
			HttpSession session,
			@Validated @ModelAttribute("accountBean") ProfileBean aBean,
			BindingResult errors) {
		
		if(errors.hasErrors()) {
			model.addAttribute("accountBean", aBean);
			return "account/profile";
		}

		Account user = (Account) session.getAttribute("account");
		
		user.setFullname(aBean.getFullname());
		user.setEmail(aBean.getEmail());
		user.setPhone(aBean.getPhone());
		user.setAddress(aBean.getAddress());
		
		boolean updated = accountDAO.update(user);
		if(updated) {
			System.out.println("OK");
			model.addAttribute("message", "Cập nhật thông tin cá nhân thành công!");
		}else {
			System.out.println("No");
			model.addAttribute("message", "Cập nhật thất bại, xin vui lòng thử lại sau!");
		}	
		model.addAttribute("accountBean", aBean);
		return "account/profile";
	}
}
