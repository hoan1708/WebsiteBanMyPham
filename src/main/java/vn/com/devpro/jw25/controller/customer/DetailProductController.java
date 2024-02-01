package vn.com.devpro.jw25.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.service.ProductService;

@Controller
public class DetailProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/detaitProduct/{productId}", method = RequestMethod.GET)
	public String listCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int id
			) throws IOException {
		
		Product product = productService.getById(id);
		
		model.addAttribute("product",product);
		
		return "customer/detail";
	}

}
