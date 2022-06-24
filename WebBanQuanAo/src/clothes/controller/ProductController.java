package clothes.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import clothes.dao.CartDAO;
import clothes.dao.CategoryDAO;
import clothes.dao.ProductDAO;
import clothes.entity.Account;
import clothes.entity.Carts;
import clothes.entity.Category;
import clothes.entity.Product;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private CartDAO cartDAO;

	
	@RequestMapping("/{id}")
	public String product(ModelMap model, HttpSession session, @PathVariable(value = "id") int id) {
		Product product = productDAO.getProductId(id);
		
		Account user = (Account) session.getAttribute("account");
		
		List<Category> list = categoryDAO.listCategories();

		List<String> images = new ArrayList<String>();
		if (product.getImages() != null && product.getImages().trim().length() > 0) {
			for (String s : product.getImages().split("\\s+")) {
				images.add(s);
			}
		} else {
			images.add("resources/images/blog_3.jpg");
		}
		model.addAttribute("images", images);
		model.addAttribute("categories", list);
		model.addAttribute("product", product);
		
		if (user != null) {

			// Kiêm tra sản phẩm đã có trong giỏ hay chưa
			Carts cart = cartDAO.get(user.getAccountId(), id);
			model.addAttribute("addedToCart", cart != null);
		}
		
		return "product/detail";
	}
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap model, HttpSession session, @RequestParam Map<String, String> params) {
		String keyword = "";

		String title = "Danh sách sản phẩm";
		if (params.containsKey("keyword")) {
			keyword = params.get("keyword");
			if (keyword != null && keyword.trim().length() > 0) {
				title = "Tìm kiếm: " + keyword.trim();
			}
		}

		List<Product> productall = productDAO.listProducts();
		
		List<Product> product = productDAO.filterByKeyword(productall, keyword);
		model.addAttribute("product", product);
		model.addAttribute("keyword", keyword);

		model.addAttribute("title", title);

		model.addAttribute("url",
				String.format("category/index.htm?keyword=", product));
		return "category/index";
	}
	@RequestMapping(value = "cart", params = { "id_product" })
	public String addToCart(ModelMap model, HttpSession session, @RequestParam("id_product") int productId) {
		Account user = (Account) session.getAttribute("account");

		if (user == null) {
			System.out.println("Lỗi không tìm thấy user");

		} else {
			boolean add = cartDAO.addCart(productId, user.getEmail(),1);
			System.out.print(add);
		}
		return "redirect:/product/" + productId + ".htm";
	}
}
