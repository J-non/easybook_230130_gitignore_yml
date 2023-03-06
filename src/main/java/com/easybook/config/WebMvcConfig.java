package com.easybook.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.easybook.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")		//	/** 아래 디렉토리까지 확인
		.excludePathPatterns("/favicon.ico", "/error", "/static/**", "/user/sign_out", "/non_member/sign_out",
				"/shop/detail_view", "/user/password_check",
				"/user/update", "/admin/sign_in_view", "/admin/sign_in");
	}
	
}
