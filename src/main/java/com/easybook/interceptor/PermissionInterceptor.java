package com.easybook.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws IOException {
		// 요청 url을 가져온다.
		String uri = request.getRequestURI();
		logger.info("[####### preHandle: uri:{}", uri);
		
		// 세션이 있는지 확인 => 있으면 로그인
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		Integer nonMemberId = (Integer)session.getAttribute("nonMemberId");
		String passwordCheck = (String)session.getAttribute("passwordCheck");
		Integer adminId = (Integer)session.getAttribute("adminId");
		
		// 어드민 비로그인 => 어드민 로그인 페이지로 리다이렉트
		if (adminId == null && uri.startsWith("/admin") && uri.startsWith("/admin/sign") == false) {
			response.sendRedirect("/admin/sign_in_view");
			return false;
		}
		// 어드민 로그인 && /admin/sign_in => 어드민 주문관리로 리다이렉트
		if (adminId != null && uri.startsWith("/admin/sign_in_view")) {
			response.sendRedirect("/admin/order_management_view");
			return false;
		}
		
		
		// 비로그인 && /account로 온 경우 => 로그인 페이지로 리다이렉트 return false
		if (userId == null && uri.startsWith("/account") && (nonMemberId == null && uri.startsWith("/account"))) {
			response.sendRedirect("/user/sign_in_view");
			return false;	
		}
		// 비로그인 && /shop으로 온 경우 => 로그인 페이지로 리다이렉트 return false
		if ((userId == null && uri.startsWith("/shop")) && (nonMemberId == null && uri.startsWith("/shop"))) {
			response.sendRedirect("/user/sign_in_view");
			return false;	
		}
		
		
		// 비회원 로그인 && (/account/password_confirm_view || /account/customer_info_view)로 온 경우 => 구매내역 페이지로 리다이렉트 return false
		if (nonMemberId != null && (uri.startsWith("/account/password_confirm_view") || uri.startsWith("/account/customer_info_view"))) {
			response.sendRedirect("/account/order_history_view");
			return false;
		}
		
		// 비밀번호 재확인 성공 && /account/password_confirm_view로 온 경우 => 회원정보 수정 페이지로 리다이렉트
		if (passwordCheck == "비밀번호 확인 성공" && uri.startsWith("/account/password_confirm_view")) {
			response.sendRedirect("/account/customer_info_view");
			return false;
		}
		
		// 로그인 && /user로 온 경우 => 메인 페이지로 리다이렉트 return false
		if (userId != null && uri.startsWith("/user") || nonMemberId != null && uri.startsWith("/user")) {
			response.sendRedirect("/main/home");
			return false;	
		}
		// 로그인 && /non_member로 온 경우 => 메인 페이지로 리다이렉트 return false
		if (userId != null && uri.startsWith("/non_member") || nonMemberId != null && uri.startsWith("/non_member")) {
			response.sendRedirect("/main/home");
			return false;	
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView mav) {
		logger.info("[$$$$$$$$$$$$$$$$$$ postHandle]");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex) {
		logger.info("[@@@@@@@@@@@@@@@@@@ afterCompletion]");
	}
}
	
