package vn.com.devpro.jw25.controller.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.devpro.jw25.model.User;
import vn.com.devpro.jw25.service.UserService;


@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	// display form login 
	@RequestMapping(value="/login" , method= RequestMethod.GET )
	public String showLogin() {
		return "/common/login/login";
	}
	
	// login success to system 
//	@RequestMapping(value="/login_processing_url" , method= RequestMethod.POST )
//	public String loginSuccess(
//			final Model model, 
//			final HttpServletRequest request,
//			final HttpServletResponse response
//			) {
//		String user = request.getParameter("username");
//		String pass = request.getParameter("password");
//		
//		List<User> ds_User = userService.findAll();
//		
//		String meassage = "";
//		
//		if(user.isEmpty() || pass.isEmpty()) {
//			 meassage = "Bạn không được để trống user và pass";
//			model.addAttribute("message",meassage);
//			return "/customer/login";
//		}else {
//			for(User x : ds_User) {
//				if(x.getUsername().equals(user) && x.getPassword().equals(pass)) {
//					 return "redirect:/index";
//				}
//				
//			}
//		}
//		
//		meassage="Username or Password incorrect !!!";
//		model.addAttribute("message",meassage);
//		System.out.println("message : " + meassage);
//		return "/customer/login";
//	}
	
	// login success to system - và hiển thị thông báo
//		@RequestMapping(value="/login" , method= RequestMethod.POST )
//		public ResponseEntity<Map<String, Object>> loginAndMessageWithAjax(
//				final Model model, 
//				final HttpServletRequest request,
//				final HttpServletResponse response,
//				final User users 
//				) {
//
//			Map<String, Object> jsonResult = new HashMap<String, Object>();
//			
//			String user = request.getParameter("username");
//			String pass = request.getParameter("password");
//			System.out.println("User : " + user);
//			System.out.println("Pass : " + pass);
//			
//			List<User> ds_User = userService.findAll();
//			
//			String meassage = "";
//			
//			if(user==null || pass==null) {
//				 meassage = "Bạn không được để trống user và pass";
//				 jsonResult.put("code","");
//				 jsonResult.put("message", meassage);
//				 System.out.println("User : " + user);
//				 System.out.println("Pass : " + pass);
//			    return ResponseEntity.ok(jsonResult);
//			}
//			
//			for(User x : ds_User) {
//				if(x.getUsername().equals(user) && x.getPassword().equals(pass)) {
//					meassage = "Login success :)";
//					
//					jsonResult.put("code", user);
//					jsonResult.put("message", meassage);
//					
//					return ResponseEntity.ok(jsonResult);
//				}
//				
//			}
//			
//			meassage="Username or Password incorrect !!!";
//			
//			jsonResult.put("code", user);
//			jsonResult.put("message", meassage);
//			
//			return ResponseEntity.ok(jsonResult);
//			
//		}
	
	@RequestMapping(value="/logup" , method= RequestMethod.GET )
	public String showLogup(
			final Model model 
			) {
		User user = new User();
		model.addAttribute("user",user);
		return "/common/login/logout";
	}
	
	@RequestMapping(value="/logup" , method= RequestMethod.POST )
	public String createAccount(
			final @ModelAttribute("user") User user, 
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response 
			) {
		if(!(user.getUsername().isEmpty() && user.getPassword().isEmpty())) {
			userService.saveOrUpdate(user);
		}
		
		return "redirect:/login";
	}
}
