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
		String email1 = email + "@" + domain;
		String address1 = address + " " + detailAddress;
		String hashedPassword = EncryptUtils.md5(password);
		
		int row = userBO.addUser(name, loginId, hashedPassword, email1, phoneNumber, postCode, address1);
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
	
}
