//package vn.com.devpro.jw25.controller.customer;
//
//import java.io.IOException;
//import java.math.BigDecimal;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.catalina.User;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import vn.com.devpro.jw25.controller.BaseController;
//import vn.com.devpro.jw25.dto.Cart;
//import vn.com.devpro.jw25.dto.CartProduct;
//import vn.com.devpro.jw25.model.Product;
//import vn.com.devpro.jw25.model.Sale_Order;
//import vn.com.devpro.jw25.model.Sale_Order_Product;
//import vn.com.devpro.jw25.service.ProductService;
//import vn.com.devpro.jw25.service.SaleOrderService;
//
//
//@Controller
//public class CartController extends BaseController {
//	@Autowired
//	SaleOrderService saleOrderService;
//	
//	@Autowired
//	ProductService productService;
//	
//	@RequestMapping(value="/add-to-cart" , method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> addToCart(
//			final Model model 
//			, final HttpServletRequest request 
//			, final HttpServletResponse response
//			, @RequestBody CartProduct addProduct 
//			) throws IOException{
//		System.out.println("Chạy vào add-to-cart xử lý : " );
//		HttpSession session = request.getSession();
//		Cart cart = null;
//		
//		if(session.getAttribute("cart")!=null) { 
//			cart = (Cart) session.getAttribute("cart");
//		}else { 
//			cart = new Cart();
//			session.setAttribute("cart", cart);
//		}
//		
//		
//		Product dbProduct = productService.getById(addProduct.getProductId());
//		
//		boolean isExisProduct = false;
//		List<CartProduct> ds_cardProducts = cart.getDs_cartproduct();
//		
//		for(CartProduct cartProduct : ds_cardProducts) {
//			if(cartProduct.getProductId() == addProduct.getProductId()) { 
//				isExisProduct= true;
//				
//				cartProduct.setQuantity(cartProduct.getQuantity().add(addProduct.getQuantity()));
//			}
//		}
//		
//		if(!isExisProduct) {
//			addProduct.setName(dbProduct.getName());
//			addProduct.setPrice(dbProduct.getPrice());
//			addProduct.setAvatar(dbProduct.getAvartar());
//			
//			cart.getDs_cartproduct().add(addProduct);
//		}
//		
//		session.setAttribute("cart", cart);
//		session.setAttribute("totalCartProducts", cart.totalCartProducts());
//		
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("status", "Success");
//		jsonResult.put("totalCartProducts", cart.totalCartProducts());
//		
//		
//		return ResponseEntity.ok(jsonResult);
//	}
//	
//	
//	@RequestMapping(value="/cart-view" , method = RequestMethod.GET)
//	public String home(
//			final HttpServletRequest request ,
//			final HttpServletResponse response ,
//			final Model model
//			) {
//		
//		HttpSession session = request.getSession();
//		BigDecimal totalCartPrice = BigDecimal.ZERO;
//		
//		Cart cart = null;
//		
//		String errorMessage = null;
//		String message = null; 
//		
//		if(session.getAttribute("cart") != null) {
//			cart = (Cart) session.getAttribute("cart");
//			totalCartPrice = cart.totalCartPrice();
//			model.addAttribute("totalCartPrice" , totalCartPrice);
//			
//			message = "Tổng tiền : " + cart.totalCartProducts() + " trong giỏ hàng";
//		}else {
//			errorMessage = "Không có sản phẩm nào trong giỏ hàng  ";
//		}
//	
//
//		model.addAttribute("errorMessage", errorMessage);
//		model.addAttribute("message", message);
//		
//		return "user/cart-view";
//	}
//	
//	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
//	public String getDataCustomerFromFormCartView(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response
//			)throws IOException{
//		
//		HttpSession session = request.getSession();
//		
//		Cart cart = (Cart) session.getAttribute("cart");
//		if(session.getAttribute("cart")!=null && cart.totalCartProducts().intValue() > 0 ) {
//			 
//			Sale_Order saleOrder = new Sale_Order();
//			saleOrder.setCreateBy(1);
//			saleOrder.setCustomer_name(request.getParameter("txtName"));
//			saleOrder.setCustomer_address(request.getParameter("txtAddress"));
//			saleOrder.setCustomer_email(request.getParameter("txtEmail"));
//			saleOrder.setCustomer_mobile(request.getParameter("txtPhone"));
//			saleOrder.setTotal(cart.totalCartPrice());
//			saleOrder.setCode(Long.toString(System.currentTimeMillis()));
//			saleOrder.setCreateDate(new Date());
//			
//			vn.com.devpro.jw25.model.User user = new vn.com.devpro.jw25.model.User();
//			user.setId(1);
//			saleOrder.setUser(user);
//			
//			for(CartProduct cartProduct : cart.getDs_cartproduct()) {
//				Sale_Order_Product saleOrderProduct = new Sale_Order_Product();
//				saleOrderProduct.setQuatity(cartProduct.getQuantity().intValue());
//				Product product = productService.getById(cartProduct.getProductId());
//				saleOrderProduct.setProduct(product);
//				saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
//				
//			}
//			
//			saleOrderService.saveSaleOrder(saleOrder);
//			
//			cart = new Cart();
//			session.setAttribute("cart", null);
//			session.setAttribute("totalCartProducts", null);
//			
//			
//		}else {
//			// đưa ra thông báo mỗi khi người dùng add product vào giỏ hàng
//		}
//		
//		return "redirect:/index";
//	}
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
