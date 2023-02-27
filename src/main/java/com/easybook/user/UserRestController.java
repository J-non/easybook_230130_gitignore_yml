package com.easybook.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.common.EncryptUtils;
import com.easybook.user.bo.UserBO;
import com.easybook.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		boolean isDuplicated = userBO.existLoginId(loginId);
		
		Map<String, Object> result = new HashMap<>();
		
		if (isDuplicated) {
			result.put("code", 1);
			result.put("result", true);
		} else {
			result.put("code", 1);
			result.put("result", false);
		}
		return result;
	}
	
	@GetMapping("/is_duplicated_email")
	public Map<String, Object> isDuplicatedEmail(
			@RequestParam("emailAddress") String emailAddress) {
		
		boolean isDuplicated = userBO.existEmail(emailAddress);
		
		Map<String, Object> result = new HashMap<>();
		
		if (isDuplicated) {
			result.put("code", 1);
			result.put("result", true);
		} else {
			result.put("code", 1);
			result.put("result", false);
		}
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> addUser(
			@RequestParam("name") String name
			, @RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("email") String email
			, @RequestParam("domain") String domain
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("postCode") String postCode
			, @RequestParam("address") String address
			, @RequestParam("detailAddress") String detailAddress) {
		String emailAddress = email + "@" + domain;
		String address1 = address + " " + detailAddress;
		String hashedPassword = EncryptUtils.md5(password);
		
		int row = userBO.addUser(name, loginId, hashedPassword, emailAddress, phoneNumber, postCode, address1);
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원 추가 실패");
		}
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session) {
		
		String hashedPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("code", 1);
			result.put("result", "성공");
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userNickName", user.getNickname());
			session.setAttribute("userPostCode", user.getPostCode());
			session.setAttribute("userAddress", user.getAddress());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return result;
	}
	
	@PostMapping("/find_login_id")
	public Map<String, Object> findLoginId(
			@RequestParam("name") String name
			, @RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();
		User user = userBO.getUserByNameEmail(name, email);
		if (user != null) {
			result.put("code", 1);
			result.put("loginId", user.getLoginId());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자 입니다.");
		}
		return result;
	}
	
}
