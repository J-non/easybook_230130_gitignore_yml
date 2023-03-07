package com.easybook.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.common.EncryptUtils;
import com.easybook.common.MakePassword;
import com.easybook.user.bo.UserBO;
import com.easybook.user.bo.UserServiceBO;
import com.easybook.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	@Autowired
	private UserServiceBO userServiceBO;
	
	/**
	 * 아이디 중복확인 API
	 * @param loginId
	 * @return
	 */
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
	
	/**
	 * 이메일 중복확인 API
	 * @param emailAddress
	 * @return
	 */
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
	
	/**
	 * 회원가입 API
	 * @param name
	 * @param loginId
	 * @param password
	 * @param email
	 * @param domain
	 * @param phoneNumber
	 * @param postCode
	 * @param address
	 * @param detailAddress
	 * @return
	 */
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
	
	/**
	 * 회원 로그인 API
	 * @param loginId
	 * @param password
	 * @param session
	 * @return
	 */
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
	
	/**
	 * 아이디 찾기 API
	 * @param name
	 * @param email
	 * @return
	 */
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
	
	/**
	 * 비밀번호 재확인 API
	 * @param loginId
	 * @param password
	 * @param session
	 * @return
	 */
	@PostMapping("/password_check")
	public Map<String, Object> passwordCheck(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session) {
		String hashedPassword = EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		boolean checkPassword = userBO.checkPasswordByLoginIdPassword(loginId, hashedPassword);
		
		if (checkPassword) {
			result.put("code", 1);
			session.setAttribute("passwordCheck", "비밀번호 확인 성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "비밀번호가 일치하지 않습니다.");
		}
		
		return result;
	}
	
	/**
	 * 개인정보 수정 API
	 * @param nickname
	 * @param postCode
	 * @param address
	 * @param phoneNumber
	 * @param passwordCheck
	 * @param newPassword
	 * @param session
	 * @return
	 */
	@PostMapping("/update")
	public Map<String, Object> updateUser(
			@RequestParam(value="nickname", required=false) String nickname
			, @RequestParam(value="postCode", required=false) String postCode
			, @RequestParam(value="address", required=false) String address
			, @RequestParam(value="phoneNumber", required=false) String phoneNumber
			, @RequestParam(value="passwordCheck", required=false) String passwordCheck
			, @RequestParam(value="newPassword", required=false) String newPassword
			, HttpSession session) {
		String hashedPasswordCheck = null;
		String hashedPassword = null;
		if (passwordCheck != null) {
			hashedPasswordCheck = EncryptUtils.md5(passwordCheck);
		}
		if (newPassword != null) {
			hashedPassword = EncryptUtils.md5(newPassword);
		}
		String loginId = (String)session.getAttribute("userLoginId");
		Map<String, Object> result = new HashMap<>();
		int row = userServiceBO.updateUserById(loginId, nickname, postCode, address, phoneNumber, hashedPasswordCheck, hashedPassword);
		if (row == 500) {
			result.put("code", 500);
			result.put("errorMessage", "기존 비밀번호와 같지 않습니다.");
		} else if (row == 1) {
			result.put("code", 1);
			result.put("result", "변경이 완료되었습니다.");
		} else if (row < 1) {
			result.put("code", 500);
			result.put("errorMessage", "개인정보 수정에 실패했습니다. 관리자에게 문의해 주세요.");
		}
		
		return result;
	}
	
	/**
	 * 회원 비밀번호 찾기 API
	 * @param loginId
	 * @param name
	 * @param phoneNumber
	 * @return
	 */
	@PostMapping("/find_password")
	public Map<String, Object> findPassword(
			@RequestParam("loginId") String loginId
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		Map<String, Object> result = new HashMap<>();
		User user = userBO.getUserByLoginIdNamePhoneNumber(loginId, name, phoneNumber);
		if (user != null) {
			String tempPassword = MakePassword.randomPassword(9);
			int row = userBO.updateUserById(user.getId(), EncryptUtils.md5(tempPassword));
			if (row > 0) {
				result.put("code", 1);
				result.put("userName", user.getName());
				result.put("tempPassword", tempPassword);
			} else {
				result.put("code", 500);
				result.put("errorMessage", "임시 비밀번호 생성에 실패했 습니다.");
			}
		} else {
			result.put("code", 500);
			result.put("errorMessage", "가입되어 있지 않은 정보입니다.");
		}
		return result;
	}
}
