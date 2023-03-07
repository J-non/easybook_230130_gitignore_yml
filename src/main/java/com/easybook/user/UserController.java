package com.easybook.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	
	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/sign_in_view")
	public String signInView(
			Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}
	
	/**
	 * 회원가입 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/sign_up_view")
	public String signUpView(
			Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("userNickName");
		session.removeAttribute("userPostCode");
		session.removeAttribute("userAddress");
		session.removeAttribute("passwordCheck");
		return "redirect:/main/home";
	}
	
	/**
	 * 아이디 찾기 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/find_login_id_view")
	public String findLoginIdView(Model model) {
		model.addAttribute("viewName", "user/findLoginId");
		return "template/layout";
	}
	
	/**
	 * 비밀번호 찾기 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/find_password_view")
	public String findPasswordView(Model model) {
		model.addAttribute("viewName", "user/findPassword");
		return "template/layout";
	}
	
}
