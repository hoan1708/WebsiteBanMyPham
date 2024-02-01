package vn.com.devpro.jw25.configurer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import vn.com.devpro.jw25.controller.Constants;


@Configuration
public class McvConfigurer implements WebMvcConfigurer, Constants {
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	
	
	//Dang ky thu muc chua resource file
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/admin/**").addResourceLocations("classpath:/admin/");
		registry.addResourceHandler("/customer/**").addResourceLocations("classpath:/customer/");
		registry.addResourceHandler("/FileUpload/**").addResourceLocations("file:" + FOLDER_UPLOAD);
//		
		WebMvcConfigurer.super.addResourceHandlers(registry);
		
	}
}
