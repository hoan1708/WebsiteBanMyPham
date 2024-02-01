package vn.com.devpro.jw25.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.util.StringUtils;

import vn.com.devpro.jw25.controller.Constants;
import vn.com.devpro.jw25.dto.ProductSearch;
import vn.com.devpro.jw25.model.Category;
import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.model.Product_image;
import vn.com.devpro.jw25.model.User;
import vn.com.devpro.jw25.service.CategoryService;
import vn.com.devpro.jw25.service.ProductImageService;
import vn.com.devpro.jw25.service.ProductService;
import vn.com.devpro.jw25.service.UserService;

@Controller
public class ProductAdminController implements Constants{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductImageService productImageService;
	 
	@RequestMapping(value = "/manager/list-product", method = RequestMethod.GET)
	public String listProduct(
				final Model model, 
				final HttpServletRequest request,
				final HttpServletResponse response
			) throws IOException {
		
		// lấy ra các thông tin muốn tìm kiếm product 
		String keyword = request.getParameter("keyword");
		int categoryId = 0;
		if(!org.springframework.util.StringUtils.isEmpty(request.getParameter("categoryId"))) {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		
		// truyền các giá trị nhận từ request vào ProductSearch
		ProductSearch productSearch = new ProductSearch();
		productSearch.setCategoryId(categoryId);
		productSearch.setKeyWord(keyword);
		
//		System.out.println("Product search keyword : " + keyword);
	
		// thiết lập các giá trị phân trang 
		// bắt đầu phân trang 
		productSearch.setSizeOfPage(SIZE_OF_PAGE);  // thiết lập số lượng sản phẩm hiển thị trên 1 trang 
		int currentPage = 1;  // thiết lập hiển thị trang hiện tại là trang số mấy 
		if (!org.springframework.util.StringUtils.isEmpty(request.getParameter("page"))) {
			currentPage = Integer.parseInt(request.getParameter("page"));  // nêu giá trị page thay đổi, lấy giá trị mới currentPage
		}
		productSearch.setCurrentPage(currentPage);
		//Het phan trang
		
		// tìm kiếm và hiển thị danh sách sản phẩm 
		List<Product> products = productService.searchProduct(productSearch);  
		
		// set tổng số lượng của sản phẩm 
		productSearch.setTotalItems(productService.findAll().size());   
				
		model.addAttribute("totalProduct",productService.findAll().size());
		model.addAttribute("products", products);
		
		
		// phân trang 
		int totalPage = productService.findAll().size() / SIZE_OF_PAGE;
		
		// thiết lập lại tổng trang page + 1, nếu số lượng lẻ 
		if(totalPage % SIZE_OF_PAGE > 0) {
			totalPage++;
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("productSearch", productSearch);
		
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		
		return "admin/ad-list-product";
	}
	
	@RequestMapping(value = "/manager/add-product", method = RequestMethod.GET)
	public String addProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		Date currentDate = new Date();
		
		Product product = new Product();
		product.setCreateDate(currentDate);
		product.setUpdateDate(currentDate);
		
		model.addAttribute("product", product);
		
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		return "admin/ad-add-product";
	}
	
	//Luu du lieu khi click submit
	@RequestMapping(value = "/manager/add-product", method = RequestMethod.POST)
	public String saveAddProduct(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product ,
			@RequestParam("productAvatar") MultipartFile productAvatar ,
			@RequestParam("productPictures") MultipartFile[] productPictures
			) throws IOException {
		
//		System.out.println("Product pictures : "  + productPictures.length);
		if(product.getId() == null) {
			productService.saveProduct(product, productAvatar, productPictures);
		}
		
		return "redirect:/manager/add-product";
	}
	
	@RequestMapping(value = "/manager/edit-product/{productId}", method = RequestMethod.GET)
	public String editProduct(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int id
			) throws IOException {
		
		System.out.println("Get id to edit : " + id);
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		
		List<User> users = userService.findAll();
		
		model.addAttribute("users", users);
		
		// lay product co id la 'productId'
		Product product = new Product();
		product = productService.getById(id);
		
		model.addAttribute("product", product);
		
		
		return "admin/ad-edit-product";
	}
	
	
	//Luu du lieu khi click submit
	@RequestMapping(value = "/manager/edit-product", method = RequestMethod.POST)
	public String saveEditProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product ,
			@RequestParam("productAvatar") MultipartFile productAvatar ,
			@RequestParam("productPictures") MultipartFile[] productPictures
			) throws IOException {
		
		if(product.getId() != null) {
			productService.editProduct(product, productAvatar, productPictures);
		}
		
		return "redirect:/manager/list-product";
	}


	//xoa product
	@RequestMapping(value = "/manager/delete-product/{productId}", method = RequestMethod.GET)
	public String deleteProduct(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int id
			) throws IOException {
		
		Product dbProduct = productService.getById(id);
		
		List<Product_image> productImages = productImageService.getImageByProductId(id);
		for(Product_image image : productImages) {
			String path = FOLDER_UPLOAD + image.getPath();
			File file = new File(path);
			file.delete();
		}
		
		String path = FOLDER_UPLOAD + dbProduct.getAvartar();
		File file = new File(path);
		file.delete();
		
		productService.deleteProduct(dbProduct);
		
		ArrayList<User> users = new ArrayList<User>();
		users = (ArrayList<User>) userService.findAll();
		model.addAttribute("users", users);
		
		return "redirect:/manager/list-product";
	}
		
}
