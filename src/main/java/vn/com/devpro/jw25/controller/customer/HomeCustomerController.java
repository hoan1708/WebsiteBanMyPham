package vn.com.devpro.jw25.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.devpro.jw25.controller.Constants;
import vn.com.devpro.jw25.dto.ProductShowViewUser;
import vn.com.devpro.jw25.model.Category;
import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.model.Product_image;
import vn.com.devpro.jw25.service.CategoryService;
import vn.com.devpro.jw25.service.ProductImageService;
import vn.com.devpro.jw25.service.ProductService;

@Controller
public class HomeCustomerController implements Constants {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService; 
	
	@Autowired
	private ProductImageService productImageService;
	
	@RequestMapping(value = "/detail/{idSanPham}", method = RequestMethod.GET)
	public String listCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response
			,@PathVariable("idSanPham") int idSanPham
			) throws IOException {
		
		List<Category> listCategory = categoryService.findAllActive();
		model.addAttribute("listCategory", listCategory);
		
		Product product = productService.getById(idSanPham);
		int idLoaiSP = product.getCategory().getId();
		
		// lay danh sach san pham co loai san pham = idLoaiSP 
		List<Product> listCategoryTheoLoaiSP = productService.getListProductByIdCategory_min4Product(idLoaiSP);
		model.addAttribute("listProductByCategory_min8Product", listCategoryTheoLoaiSP);
		
		// hien thi thong tin chi tiet sp co idsanpham duoc truyen vao
		model.addAttribute("sanPhamChiTiet", product);
		
		// lay danh sach url cua san pham chi tiet
		List<Product_image> listProductImage = productImageService.getListURLProductByID(idSanPham);
		model.addAttribute("listUrlOfProductDetail", listProductImage);
		
		return "customer/detail";
	}
	
	@RequestMapping(value = "/shop/{idCategory}", method = RequestMethod.GET)
	public String showshop(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("idCategory") int idCategory
			) throws IOException {
		
		List<Product> dsProduct = productService.getListProductByIdCategory(idCategory);
		System.out.println("Size of product by id: " + dsProduct.size());
		
		
		// kiểm soát số lượng sản phẩm hiển thị trên 1 trang 
		ProductShowViewUser productShowViewUser = new ProductShowViewUser();
		productShowViewUser.setSizeOfPage(SIZE_OF_PRODUCT_SHOP);
		
		int currentPage = 1;  // thiết lập hiển thị trang hiện tại là trang số mấy 
		if (!org.springframework.util.StringUtils.isEmpty(request.getParameter("page"))) {
			currentPage = Integer.parseInt(request.getParameter("page"));  // nêu giá trị page thay đổi, lấy giá trị mới currentPage
		}
		productShowViewUser.setCurrentPage(currentPage);
		productShowViewUser.setTotalItems(dsProduct.size());   
		
		// phân trang 
		int totalPage = dsProduct.size() / SIZE_OF_PRODUCT_SHOP;
		
		model.addAttribute("productShowViewUser",productShowViewUser);
		
		// thiết lập lại tổng trang page + 1, nếu số lượng lẻ 
		if(totalPage % SIZE_OF_PRODUCT_SHOP > 0) {
			totalPage++;
		}
//		System.out.println("Tổng số trang : " + totalPage);
		model.addAttribute("totalPage", totalPage);
		
		// get list name of category 
		List<Category> categorys = new ArrayList<Category>();
		categorys = categoryService.findAll();
		
		// show list product 
		List<Product> products = productService.searchProductShowUserWithIdCategory( idCategory , productShowViewUser);
		
		model.addAttribute("categorys",categorys);
		model.addAttribute("products",products);
		
		return "customer/shop";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String showHome(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		// get top 5 product loại sản phẩm son môi 
		List<Product> products5sonMois = productService.findTop5ProductTypeOfSonMoi();
		model.addAttribute("products5sonMois",products5sonMois);
		
		// get top 5 product loai sản phẩm kem dưỡng da 
		List<Product> products5kemDuongDa = productService.findTop5ProductTypeOfKemDuongDa();
		
		model.addAttribute("products5kemDuongDa",products5kemDuongDa);
		
		List<Category> listCategory = categoryService.findAllActive();
		model.addAttribute("listCategory", listCategory);
		
		return "customer/home";
	}
	
}
