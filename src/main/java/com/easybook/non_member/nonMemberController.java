package com.easybook.non_member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/non_member")
@Controller
public class nonMemberController {
	
	/**
	 * 비회원 로그인, 회원가입 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/sign_up_view")
	public String signUpView(
			Model model) {
		model.addAttribute("viewName", "/nonMember/signInUp");
		return "template/layout";
	}
	
	/**
	 * 비회원 로그아웃
	 * @param session
	 * @return
	 */
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("nonMemberId");
		session.removeAttribute("nonMemberEmail");
		session.removeAttribute("nonMemberName");
		return "redirect:/main/home";
	}
	
}
