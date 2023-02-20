package com.easybook.non_member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/non_member")
@Controller
public class nonMemberController {
	
	@GetMapping("/sign_up_view")
	public String signUpView(
			Model model) {
		model.addAttribute("viewName", "/nonMember/signInUp");
		return "template/layout";
	}
	
}
