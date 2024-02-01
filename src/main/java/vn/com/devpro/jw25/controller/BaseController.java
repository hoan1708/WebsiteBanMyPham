package vn.com.devpro.jw25.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.com.devpro.jw25.model.User;


public class BaseController {
	
	@ModelAttribute("totalCartProducts")
	public BigInteger getTotalCartProducts(
				final HttpServletRequest request 
			) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("totalCartProducts")!=null) {
			return (BigInteger) session.getAttribute("totalCartProducts");
		}
		
		return BigInteger.ZERO;
	}
	
	
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (userLogined != null && userLogined instanceof UserDetails) {

			User user = (User) userLogined;
			System.out.println("user : " + user.getUsername());
			System.out.println("user email: " + user.getEmail());
			return user;
		}
		return new User();
	}
	
}
