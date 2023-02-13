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
	
	public int addUser(
			String name, String loginId, String password,
			String email, String phoneNumber, String postCode,
			String address) {
		return userDAO.insertUser(name, loginId, password, email, phoneNumber, postCode, address);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
}
