package clothes.controller;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import clothes.dao.CartDAO;
import clothes.dao.OrderDAO;
import clothes.entity.Account;
import clothes.entity.Carts;
import clothes.entity.Order;
import clothes.entity.OrderDetail;
import clothes.entity.OrderDetailKey;

@Controller
@RequestMapping("/cart/")
public class CartController {
	@Autowired
	SessionFactory factory;

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private OrderDAO orderDAO;

	@RequestMapping(value = "index")
	public String cart(ModelMap model, HttpSession session) {
		float total = 0;
		Account user = (Account) session.getAttribute("account");
		List<Carts> list = cartDAO.getCarts(user.getEmail());
		for (Carts c : list) {
			total += c.getQuantity() * (c.getProduct().getPrice()-(c.getProduct().getPrice()*c.getProduct().getDiscount()/100));
		}
		model.addAttribute("cart", list);
		model.addAttribute("total", total);
		return "cart/index";
	}
	@RequestMapping(value = "sl/plus", params = { "id_product", "sl" })
	public String qtyPlus(ModelMap model, @RequestParam("id_product") int id, @RequestParam("sl") int sl) {
		cartDAO.updateSL(id, sl + 1);

		return "redirect:/cart/index.htm";
	}

	@RequestMapping(value = "sl/minus", params = { "id_product", "sl" })
	public String qtyMinus(ModelMap model, @RequestParam("id_product") int id, @RequestParam("sl") int sl) {
		cartDAO.updateSL(id, sl - 1);
		return "redirect:/cart/index.htm";
	}
	
	@RequestMapping(value = "delete/{id}.htm", method = RequestMethod.GET)
	public String delete(ModelMap model, HttpSession session, @PathVariable("id") int id) {
		Account user = (Account) session.getAttribute("account");
		cartDAO.deleteCart(id,user.getEmail());
		List<Carts> list = cartDAO.getCarts(user.getEmail());

		model.addAttribute("cart", list);

		return "redirect:/cart/index.htm";
	}
	

	@RequestMapping(value = "checkout")
	public String checkout(ModelMap model, HttpSession session) {
		Account user = (Account) session.getAttribute("account");
		List<Carts> list = cartDAO.getCarts(user.getEmail());
		Order order = new Order();	
		
		order.setAccount(user);

		Calendar c1 = Calendar.getInstance();
		Date in = new Date();
		LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
		Date out = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
		order.setOrderTime(out);

		c1.setTime(out);
		c1.add(Calendar.MINUTE, 30);
		order.setDeliveryTime(c1.getTime());
		order.setStatus(0);
		orderDAO.insertOrder(order);
		for (Carts c : list) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderDetailId(new OrderDetailKey(order.getOrdersId(), c.getProduct().getProductId()));
			orderDetail.setProduct(c.getProduct());
			orderDetail.setOrder(order);
			orderDetail.setQuantity(c.getQuantity());
			orderDetail.setPrice(c.getProduct().getPrice());		
			orderDAO.insertOrderDetail(orderDetail);
		}
		cartDAO.deleteALLCart(user.getEmail());

		return "redirect:/order/index.htm";
	}
}

