package vn.com.devpro.jw25.controller.admin;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.com.devpro.jw25.controller.Constants;
import vn.com.devpro.jw25.dto.CategorySearch;
import vn.com.devpro.jw25.model.Category;
import vn.com.devpro.jw25.model.User;
import vn.com.devpro.jw25.service.CategoryService;
import vn.com.devpro.jw25.service.UserService;

@Controller
public class CategoryAdminController implements Constants {
	
	@Autowired 
	CategoryService categoryService ; 
	
	@Autowired
	UserService userService ; 
	
	@RequestMapping(value = "/manager/showCategory", method = RequestMethod.GET)
	public String showListCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		// lấy ra list để hiển thị và thực hiện search 
		int status = 2;
		if (!StringUtils.isEmpty(request.getParameter("status"))) {
			status = Integer.parseInt(request.getParameter("status"));
		}
				
		CategorySearch categorySearch = new CategorySearch();
		categorySearch.setStatus(status);
		categorySearch.setKeyWord(request.getParameter("keyword"));
		
		//Phan trang
		categorySearch.setSizeOfPage(SIZE_OF_PAGE);
		categorySearch.setTotalItems(categoryService.findAll().size());
		
		int currentPage = 1;
		if (!StringUtils.isEmpty(request.getParameter("page"))) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		categorySearch.setCurrentPage(currentPage);
		
		//Het phan trang
		
		
		List<Category> dsCategory = categoryService.searchCategory(categorySearch);
		
		System.out.println("Size of saleOrder : " + dsCategory.size());
				
		model.addAttribute("dsCategory", dsCategory);
		model.addAttribute("categorySearch", categorySearch);
		
		ArrayList<User> users = new ArrayList<User>();
		users = (ArrayList<User>) userService.findAll();
		

		model.addAttribute("users", users);
		
		return "/admin/ad-category";
	}
	
	@RequestMapping(value = "/manager/add-category", method = RequestMethod.GET)
	public String showAddCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		Date currentDate = new Date();
		
		Category category = new Category();
		category.setCreateDate(currentDate);
		category.setUpdateDate(currentDate);
		
		ArrayList<User> users = new ArrayList<User>();
		users = (ArrayList<User>) userService.findAll();
		

		model.addAttribute("users", users);
		model.addAttribute("category", category);
		return "/admin/ad-add-category";
	}
	
	@RequestMapping(value = "/manager/add-category", method = RequestMethod.POST)
	public String addNewCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("category") Category category 
			) throws IOException {
	
		if(category.getId() == null) {
			categoryService.addNewCategory(category);
		}
		return "redirect:/manager/add-category";
	}
	
	@RequestMapping(value = "/manager/edit-category/{categoryID}", method = RequestMethod.GET)
	public String showViewEditCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryID") int id
			) throws IOException {
		
		System.out.println("Get id to edit : " + id);
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		
		List<User> users = userService.findAll();
		
		model.addAttribute("users", users);
		
		// lay product co id la 'productId'
		Category category = new Category();
		category = categoryService.getById(id);
		
		model.addAttribute("category", category);
		
		return "admin/ad-edit-category";
	}
	
	//Luu du lieu khi click submit
	@RequestMapping(value = "/manager/edit-category", method = RequestMethod.POST)
	public String saveEditProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("category") Category category 
			) throws IOException {
		
//		System.out.println("Category lấy được trên form : " + category.toString());
		if(category.getId() != null) {
//			System.out.println("Chạy vào trong hệ thống kiểm tra ... ");
			categoryService.saveOrUpdate(category);
		}
		
		return "redirect:/manager/showCategory";
	}
	
	//xoa product
	@RequestMapping(value = "/manager/delete-category/{categoryID}", method = RequestMethod.GET)
	public String deleteCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryID") int id
			) throws IOException {
		
		Category dbCategory = categoryService.getById(id);
		
		categoryService.deleteCategory(dbCategory);
		
		return "redirect:/manager/showCategory";
	}

}
