package vn.com.devpro.jw25.configurer;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy(); //�?i�?u hướng request

	@Override //Chuyển đến request thich hop voi role khi xac thuc thanh cong
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		handle(request, response, authentication);
		clearAuthenticationAttributes(request);		
	}
	
	//Dua vao role cua user de xac dinh request chuyen den (redirect) 
	protected void handle(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) {
			return;
		}
//		System.out.println("targetUrl: " + targetUrl);
		redirectStrategy.sendRedirect(request, response, targetUrl); //đi�?u hướng targer URL
	}
	
	//Lay role cua user va tra ve Url (action) tuong ung voi authentication
	protected String determineTargetUrl(final Authentication authentication) throws IllegalStateException  {
		
		Map<String, String> roleTargetUrlMap = new HashMap<String, String>(); //key: Role - value: URL
		//Key la role name, value la Url (action)
		roleTargetUrlMap.put("ADMIN", "/manager/home-admin");
//		roleTargetUrlMap.put("STAFF", "/staff/list-product");
		roleTargetUrlMap.put("CUSTOMER", "/home");
		
		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); //Lay danh sach cac roles
		System.out.println("Size of authorities : " + authorities.size());
		
		
		for (final GrantedAuthority grantedAuthority : authorities) {
			String authorityName = grantedAuthority.getAuthority(); //role name
			System.out.println("Authority name : " + authorityName);
			
			if (roleTargetUrlMap.containsKey(authorityName)) {
//				System.out.println("authorityName: " + authorityName);
//				System.out.println("role url map: " + roleTargetUrlMap.get(authorityName).toString());
				return roleTargetUrlMap.get(authorityName);  //Trả v�? target url của user đăng nhập
			}
		}
		throw new IllegalStateException();
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}
