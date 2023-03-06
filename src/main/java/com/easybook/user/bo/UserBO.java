package com.easybook.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.user.dao.UserDAO;
import com.easybook.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean existLoginId(String loginId) {
		return userDAO.exsitLoginId(loginId);
	}
	
	public boolean existEmail(String email) {
		return userDAO.exsitEmail(email);
	}
	
	public int addUser(
			String name, String loginId, String password,
			String email, String phoneNumber, String postCode,
			String address) {
		return userDAO.insertUser(name, loginId, password, email, phoneNumber, postCode, address);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
	public User getUserByNameEmail(String name, String email) {
		return userDAO.selectUserByNameEmail(name, email);
	}
	
	public boolean checkPasswordByLoginIdPassword(String loginId, String password) {
		return userDAO.checkPasswordByLoginIdPassword(loginId, password);
	}
	
	public int updateUserByloginId(String loginId, String nickname, String postCode, String address, String phoneNumber,
			String newPassword) {
		return userDAO.updateUserByloginId(loginId, nickname, postCode, address, phoneNumber, newPassword);
	}
	
	public User getUserByLoginIdNamePhoneNumber(String loginId, String name, String phoneNumber) {
		return userDAO.selectUserByLoginIdNamePhoneNumber(loginId, name, phoneNumber);
	}
	
	public int updateUserById(int userId, String password) {
		return userDAO.updateUserById(userId, password);
	}
}
