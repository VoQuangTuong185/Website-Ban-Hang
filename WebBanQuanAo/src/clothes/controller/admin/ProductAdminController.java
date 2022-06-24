package clothes.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import clothes.bean.ProductBean;
import clothes.bean.UploadFile;
import clothes.dao.CategoryDAO;
import clothes.dao.ProductDAO;
import clothes.entity.Product;
import clothes.utils.Constants;

@Controller
@RequestMapping("admin/product")
public class ProductAdminController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	@Qualifier("productFile")
	private UploadFile upFile;

	@Autowired
	@Qualifier("productFile")
	private UploadFile rootFile;
	
	@RequestMapping()
	public String index() {
		return "redirect:/admin/product.htm?page=1";
	}

	@RequestMapping(params = { "page" })
	public String index(ModelMap model, @RequestParam("page") int page) {
		List<Product> product = productDAO.listProductsAll(true);

		int endIndex = Math.min(product.size(), page * Constants.FPP);
		model.addAttribute("product", product.subList((page - 1) * Constants.FPP, endIndex));

		int maxPage = Constants.getMaxPage(product.size(), Constants.FPP);
		model.addAttribute("page", page);
		model.addAttribute("maxPage", maxPage);

		return "admin/product/index";
	}

	@RequestMapping("add")
	public String addProduct(ModelMap model) {
		model.addAttribute("productBean", new ProductBean());
		model.addAttribute("categories", categoryDAO.listCategories());
		return "admin/product/form";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addProduct(ModelMap model, RedirectAttributes reAttributes,
			@Validated @ModelAttribute("productBean") ProductBean productBean, BindingResult errors) {

		if (errors.hasErrors()) {
			model.addAttribute("productBean", productBean);
			model.addAttribute("categories", categoryDAO.listCategories());
			return "admin/product/form";
		}
		Product product = new Product();
		product.setProductname(productBean.getProductname());
		product.setPrice(productBean.getPrice());
		product.setReview(productBean.getReview());
		product.setAvailable(productBean.getAvailable());
		product.setStatus(productBean.getStatus());
		product.setCategory(categoryDAO.getCategory(productBean.getCategory()));
		product.setDiscount(productBean.getDiscount());

		String images = "";
		System.out.println(productBean.getImages());
		for (MultipartFile img : productBean.getImages()) {
			if (!img.isEmpty()) {
				String nameFormat = Constants.getCurrentTime() + "_"
						+ Constants.rewriteFileName(img.getOriginalFilename());

				String logoPath = upFile.getBasePath() + File.separator + nameFormat;
				images += "" + nameFormat + " ";

				try {
					img.transferTo(new File(logoPath));
					Thread.sleep(500);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		product.setImages(images.trim());

		boolean added = productDAO.insert(product);
		if (added) {
			reAttributes.addFlashAttribute("message", "Thêm mới sản phẩm thành công!");
		} else {
			model.addAttribute("msgError", "Thêm mới thất bại!");
			return "admin/product/form";
		}

		return "redirect:/admin/product.htm?page=1";
	}

	@RequestMapping(value = "edit", params = { "id" })
	public String editProduct(ModelMap model, RedirectAttributes reAttributes, @RequestParam("id") int productId) {
		Product product = productDAO.getProductId(productId);

		if (product == null) {
			reAttributes.addFlashAttribute("msgError", "Sản phẩm không tồn tại!");
			return "redirect:/admin/product.htm?page=1";
		}

		ProductBean productBean = new ProductBean();
		productBean.setProductname(product.getProductname());
		productBean.setCategory(product.getCategory().getCategoryId());
		productBean.setPrice(product.getPrice());
		productBean.setReview(product.getReview());
		productBean.setAvailable(product.getAvailable());
		productBean.setStatus(product.getStatus());
		productBean.setDiscount(product.getDiscount());
		
		model.addAttribute("product", product);
		model.addAttribute("productBean", productBean);
		model.addAttribute("categories", categoryDAO.listCategories());

		return "admin/product/form";
	}

	/**
	 * Xử lý Chỉnh sửa sản phẩm
	 */
	@RequestMapping(value = "edit", params = { "id" }, method = RequestMethod.POST)
	public String editCategory(ModelMap model, RedirectAttributes reAttributes, @RequestParam("id") int productId,
			@Validated @ModelAttribute("productBean") ProductBean productBean, BindingResult errors) {

		Product product = productDAO.getProductId(productId);

		if (errors.hasErrors()) {
			model.addAttribute("product", product);
			model.addAttribute("productBean", productBean);
			model.addAttribute("categories", categoryDAO.listCategories());
			return "admin/product/form";
		}

		product.setProductname(productBean.getProductname());
		product.setPrice(productBean.getPrice());
		product.setReview(productBean.getReview());
		product.setAvailable(productBean.getAvailable());
		product.setStatus(productBean.getStatus());
		product.setCategory(categoryDAO.getCategory(productBean.getCategory()));
		product.setDiscount(productBean.getDiscount());
		List<String> listImages = new ArrayList<>();
		String[] imageInDBPath = { "", "", "" };

		if (product.getImages() != null) {
			String[] imageList = product.getImages().trim().split("\\s+");
			for (int i = 0; i < imageList.length; i++) {
				imageInDBPath[i] = imageList[i];
			}
		}

		for (int i = 0; i < productBean.getImages().length; i++) {
			MultipartFile img = productBean.getImages()[i];
			String imagePath = productBean.getImagePath()[i];

			if (img.isEmpty()) {
				// Nếu ko có hình ảnh nào được tải lên
				// Kiểm tra xem trong data có hình ảnh nào khác không
				// Có thì lưu lại vào listImages
				if (imagePath.trim().length() > 0)
					listImages.add(imagePath);
			} else {
				if (imageInDBPath[i].trim().length() > 0) {
					File file = new File(rootFile.getBasePath() + File.separator + imageInDBPath[i]);
					if (file.exists())
						file.delete();
				}
				String nameFormat = Constants.getCurrentTime() + "_"
						+ Constants.rewriteFileName(img.getOriginalFilename());

				String logoPath = upFile.getBasePath() + File.separator + nameFormat;
				listImages.add("resources/images/" + nameFormat);
				try {
					img.transferTo(new File(logoPath));
					Thread.sleep(1000);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		String images = "";
		for (String s : listImages) {
			images += s + " ";
		}

		product.setImages(images.trim());

		boolean added = productDAO.update(product);
		if (added) {
			reAttributes.addFlashAttribute("message",
					"Chỉnh sửa sản phẩm thành công! <a href='product/" + productId + ".htm'>Xem kết quả</a>");
		} else {
			model.addAttribute("msgError", "Chỉnh sửa sản phẩm thất bại!");
			return "admin/product/form";
		}

		return "redirect:/admin/product.htm?page=1";
	}
	@RequestMapping(params = { "delete" })
	public String deleteCategory(RedirectAttributes reAttributes, HttpSession session,
			@RequestParam("delete") int productId) {
		Product product = productDAO.getProductId(productId);

		if (product != null) {
			boolean deleted = productDAO.delete(product);
			if (deleted) {
				if (product.getImages() != null && product.getImages().trim().length() > 0) {
					String[] imageList = product.getImages().split("\\s+");
					for (String fileName : imageList) {
						File file = new File(rootFile.getBasePath() + File.separator + fileName);
						if (file.exists())
							file.delete();
					}
				}

				reAttributes.addFlashAttribute("message", "Xóa thành công!");
			} else
				reAttributes.addFlashAttribute("msgError", "Xóa thất bại!");

		} else {
			reAttributes.addFlashAttribute("msgError", "Không tìm thấy sản phẩm cần xóa!");
		}

		return "redirect:/admin/product.htm?page=1";
	}

}
