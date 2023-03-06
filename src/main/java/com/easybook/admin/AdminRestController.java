package com.easybook.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.admin.bo.AdminBO;
import com.easybook.admin.model.Admin;
import com.easybook.common.EncryptUtils;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin")
@RestController
public class AdminRestController {
	
	@Autowired
	private AdminBO adminBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session) {
		
		String hashedPassword = EncryptUtils.md5(password);
		Admin admin = adminBO.getAdminByLoginIdPassword(loginId, hashedPassword);
		Map<String, Object> result = new HashMap<>();
		if (admin != null) {
			result.put("code", 1);
			result.put("result", "성공");
			
			session.setAttribute("adminId", admin.getId());
			session.setAttribute("adminLoginId", admin.getLoginId());
			session.setAttribute("adminManagerName", admin.getManagerName());
			session.setAttribute("adminAuthority", admin.getAuthority());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return result;
	}
	
	@PostMapping("/update")
	public Map<String, Object> updateAdmin(
			@RequestParam("adminId") int adminId
			, @RequestParam("authority") String authority) {
		Map<String, Object> result = new HashMap<>();
		int row = adminBO.updateAdminById(adminId, authority);
		if (row > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "권한 수정 실패.");
		}
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> deleteAdmin(
			@RequestParam("adminId") int adminId) {
		Map<String, Object> result = new HashMap<>();
		int row = adminBO.deleteAdminById(adminId);
		if (row > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "어드민 계정 삭제 실패.");
		}
		return result;
	}
	
	@GetMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		boolean isDuplicated = adminBO.existLoginId(loginId);
		
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
	
	@PostMapping("/add_admin")
	public Map<String, Object> addUser(
			@RequestParam("managerName") String managerName
			, @RequestParam("loginId") String loginId
			, @RequestParam("password") String password) {
		String hashedPassword = EncryptUtils.md5(password);
		int row = adminBO.addUser(managerName, loginId, hashedPassword);
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "어드민 계정 추가 실패");
		}
		return result;
	}
}
