package vn.com.devpro.jw25.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.devpro.jw25.dto.Cart;
import vn.com.devpro.jw25.dto.CartProduct;
import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.model.Sale_Order;
import vn.com.devpro.jw25.model.Sale_Order_Product;
import vn.com.devpro.jw25.model.User;
import vn.com.devpro.jw25.service.ProductService;
import vn.com.devpro.jw25.service.SaleOrderService;

@Controller
public class Cart_2_Controller {
	@Autowired
	SaleOrderService saleOrderService;
	
	@Autowired
	ProductService productService;
	
	// hiển thị giỏ hàng 
	@RequestMapping(value="/cart-view" , method = RequestMethod.GET)
	public String card_view(
			final HttpServletRequest request ,
			final HttpServletResponse response ,
			final Model model
			) {
		
		// lấy giỏ hàng 
		HttpSession session = request.getSession();
		BigDecimal totalCartPrice = BigDecimal.ZERO;
		
		Cart cart = null;
		
		String errorMessage = null;
		String message = null; 
		
		if(session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
			totalCartPrice = cart.totalCartPrice();
			model.addAttribute("totalCartPrice" , totalCartPrice);
//				model.addAttribute("cartProducts", cart.getDs_cartproduct());
			
			message = "Có " + cart.totalCartProducts() + " sản phẩm";
		}else {
			// trường hợp: chưa có trong giỏ hàng 
			errorMessage = "Không có sản phẩm nào trong giỏ hàng ";
		}
	
//			model.addAttribute("totalCartPrice", totalCartPrice);
//			model.addAttribute("cartProducts", cart.getDs_cartproduct());

		model.addAttribute("errorMessage", errorMessage);
		model.addAttribute("message", message);
		
		
		
		return "user/cart_view";
	}
	
	// thêm sản phẩm vào giỏ hàng 
	@RequestMapping(value="/add-to-cart" , method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(
			final Model model 
			, final HttpServletRequest request 
			, final HttpServletResponse response
			, @RequestBody CartProduct addProduct 
			) throws IOException{
		
		System.out.println("Chạy vào add-to-cart xử lý : " );
		HttpSession session = request.getSession();  // tạo mới 1 session 
		Cart cart = null; // khởi tạo 1 Object cart = null
		
		if(session.getAttribute("cart")!=null) { 
			cart = (Cart) session.getAttribute("cart"); // nếu cart đang tồn tại giá trị thì gán giá trị đang tồn tại của cart này vào 
		}else { 
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		
		Product dbProduct = productService.getById(addProduct.getProductId());
		
		boolean isExisProduct = false;
		List<CartProduct> ds_cardProducts = cart.getDs_cartproduct();
		
		for(CartProduct cartProduct : ds_cardProducts) {
			if(cartProduct.getProductId() == addProduct.getProductId()) { 
				isExisProduct= true;
				
				cartProduct.setQuantity(cartProduct.getQuantity().add(addProduct.getQuantity()));
			}
		}
		
		if(!isExisProduct) {
			addProduct.setName(dbProduct.getName());
			addProduct.setPrice(dbProduct.getPrice());
			addProduct.setAvatar(dbProduct.getAvartar());
			
			cart.getDs_cartproduct().add(addProduct);
		}
		
		session.setAttribute("cart", cart);
		session.setAttribute("totalCartProducts", cart.totalCartProducts());
		session.setAttribute("totalPriceResult", cart.totalCartPrice());
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "Success");
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		jsonResult.put("totalPriceResult", cart.totalCartPrice());
		
		
		System.out.println("Total price : " + cart.totalCartPrice());
		return ResponseEntity.ok(jsonResult);
	}
	
	
	// delete product khoi cart 
	@RequestMapping(value="/delete-to-cart/{productId}" , method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProductKhoiCart(
			final Model model 
			, final HttpServletRequest request 
			, final HttpServletResponse response
			, @RequestBody CartProduct addProduct 
			, @PathVariable("productId") int productId
			) throws IOException{
		
		System.out.println("Chạy vào delete-to-cart xử lý : " );
		System.out.println("Product id cần xóa : " + productId);
		HttpSession session = request.getSession();  // tạo mới 1 session 
		Cart cart = null; // khởi tạo 1 Object cart = null
		
		if(session.getAttribute("cart")!=null) { 
			cart = (Cart) session.getAttribute("cart"); // nếu cart đang tồn tại giá trị thì gán giá trị đang tồn tại của cart này vào 
		}else { 
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		Product dbProduct = productService.getById(productId);
		
		boolean isExisProduct = false;
		int viTriCanXoa = 0;
		List<CartProduct> ds_cardProducts = cart.getDs_cartproduct();
		
		for(int i=0; i<ds_cardProducts.size();i++) {
			if(ds_cardProducts.get(i).getProductId() == productId) { 
				isExisProduct= true;
				viTriCanXoa = i;
				break;
			}
		}
		ds_cardProducts.remove(viTriCanXoa);
		if(!isExisProduct) {
//			addProduct.setName(dbProduct.getName());
//			addProduct.setPrice(dbProduct.getPrice());
//			addProduct.setAvatar(dbProduct.getAvartar());
//			
//			cart.getDs_cartproduct().add(addProduct);
			cart.getDs_cartproduct().remove(viTriCanXoa);
		}
		
//		for(CartProduct cartProduct : ds_cardProducts) {
//			if(cartProduct.getProductId() == productId) { 
//				isExisProduct= true;
//				
//				cartProduct.setQuantity(cartProduct.getQuantity().add(addProduct.getQuantity()));
//			}
//		}
		
		
		session.setAttribute("cart",cart);
		session.setAttribute("totalCartProducts", cart.totalCartProducts());
		session.setAttribute("totalPriceResult", cart.totalCartPrice());
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "Success");
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		jsonResult.put("totalPriceResult", cart.totalCartPrice());
		
		
//		System.out.println("Total price : " + cart.totalCartPrice());
		return ResponseEntity.ok(jsonResult);
	}
	
	
	// dat hang, luu thong tin san pham khach hang chon vao database 
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public String saveSaleOrderProduct(
			final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			)throws IOException{
		
		HttpSession session = request.getSession();
		
		Cart cart = (Cart) session.getAttribute("cart");
		if(session.getAttribute("cart")!=null && cart.totalCartProducts().intValue() > 0 ) {
			// có giỏ hàng và có sản phẩm trong giỏ hàng 
			// tạo đơn hàng 
			Sale_Order saleOrder = new Sale_Order();
			saleOrder.setCreateBy(1);
			saleOrder.setCustomer_name(request.getParameter("txtName"));
			saleOrder.setCustomer_address(request.getParameter("txtAddress"));
			saleOrder.setCustomer_email(request.getParameter("txtEmail"));
			saleOrder.setCustomer_mobile(request.getParameter("txtPhone"));
			saleOrder.setTotal(cart.totalCartPrice());
			saleOrder.setCode(Long.toString(System.currentTimeMillis()));
			saleOrder.setCreateDate(new Date());
			
			// xét mối quan hệ với user 
			User user = new User();
			user.setId(1);
			saleOrder.setUser(user);
			
			// duyệt danh sách sản phẩm trong giỏ và lưu vào DB 
			for(CartProduct cartProduct : cart.getDs_cartproduct()) {
				Sale_Order_Product saleOrderProduct = new Sale_Order_Product();
				saleOrderProduct.setQuantity(cartProduct.getQuantity().intValue());
				Product product = productService.getById(cartProduct.getProductId());
				saleOrderProduct.setProduct(product);
				saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
				
			}
			
			// lưu đơn hàng vào tbl_sale_order
			saleOrderService.saveSaleOrder(saleOrder);
			
			// xóa giỏ hàng 
			cart = new Cart();
			session.setAttribute("cart", null);
//			session.setAttribute("totalCartProducts", null);
			session.setAttribute("totalCartProducts", 0);
			session.setAttribute("totalPriceResult", 0);
			
		}else {
			//- gợi ý dùng ajax: trả về thông báo là khách hàng lựa chọn hàng vào giỏ 
			
		}
		
		return "redirect:/home";
	}
	
}
