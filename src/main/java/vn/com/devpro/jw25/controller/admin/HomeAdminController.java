 package vn.com.devpro.jw25.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeAdminController {

	@RequestMapping(value = "/manager/home-admin", method = RequestMethod.GET)
	public String showHomeAdmin(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		return "admin/homeAdmin";
	}
	
	
	
	
	
}
