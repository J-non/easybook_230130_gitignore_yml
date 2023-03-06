package com.easybook.non_member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.common.EncryptUtils;
import com.easybook.non_member.bo.NonMemberBO;
import com.easybook.non_member.model.NonMember;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/non_member")
@RestController
public class nonMemberRestController {
	
	@Autowired
	private NonMemberBO nonMemberBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, HttpSession session) {
		String hashedPassword = EncryptUtils.md5(password);
		NonMember nonMember = nonMemberBO.selectNonMemberByEmailPassword(email, hashedPassword);
		Map<String, Object> result = new HashMap<>();
		if (nonMember != null) {
			result.put("code", 1);
			result.put("result", "성공");
			
			session.setAttribute("nonMemberId", nonMember.getId());
			session.setAttribute("nonMemberEmail", nonMember.getEmail());
			session.setAttribute("nonMemberName", nonMember.getName());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "이메일 또는 비밀번호가 일치하지 않습니다.");
		}
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("email") String email
			, @RequestParam("domain") String domain
			, @RequestParam("name") String name
			, @RequestParam("password") String password
			, HttpSession session) {
		String emailAddress = email + "@" + domain;
		String hashedPassword = EncryptUtils.md5(password);
		boolean isDuplicatedEmail = nonMemberBO.existEmail(emailAddress);
		Map<String, Object> result = new HashMap<>();
		if (isDuplicatedEmail) {
			result.put("result", true);
			return result;
		} else {
			int row = nonMemberBO.addNonMember(emailAddress, name, hashedPassword);
			if (row > 0) {
				result.put("code", 1);
				
				NonMember nonMember = nonMemberBO.selectNonMemberByEmailPassword(emailAddress, hashedPassword);
				session.setAttribute("nonMemberId", nonMember.getId());
				session.setAttribute("nonMemberEmail", nonMember.getEmail());
				session.setAttribute("nonMemberName", nonMember.getName());
			} else {
				result.put("code", 500);
				result.put("errorMessage", "요청 실패. 관리자에게 문의하세요.");
			}
		}
		return result;
	}
	
}
