package clothes.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import clothes.dao.AccountDAO;
import clothes.dao.CategoryDAO;
import clothes.dao.ProductDAO;
import clothes.entity.Account;
import clothes.entity.Category;
import clothes.entity.Product;
import clothes.utils.Constants;

@Controller
public class HomeController { 
	
	@Autowired 
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "home")
	public String index(ModelMap model, HttpSession session) {     
		 List<Category> list = categoryDAO.listCategories();
		 model.addAttribute("category", list); 
		
		 List<Product> productMen = productDAO.listProductsInCategory(1); 
		 model.addAttribute("men", productMen); 
		
		 List<Product> productWomen = productDAO.listProductsInCategory(2); 
		 model.addAttribute("women", productWomen);			
		 
		 List<Product> productAccessories = productDAO.listProductsInCategory(3); 
		 model.addAttribute("accessories", productAccessories);
		 
		 List<Product> giamGia = productDAO.listProductsGiamGia();
		 model.addAttribute("giamGia",giamGia.subList(0, Math.min(7, giamGia.size())));	 
		 return "index";
		}
}
