package com.easybook.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceBO {
	
	@Autowired
	private UserBO userBO;
	
	public int updateUserById(String loginId, String nickname, String postCode, String address, String phoneNumber,
			String passwordCheck, String newPassword) {
		int row = 0;
		
		if (passwordCheck == null) {
			row = userBO.updateUserByloginId(loginId, nickname, postCode, address, phoneNumber, newPassword);
		} else {
			boolean result = userBO.checkPasswordByLoginIdPassword(loginId, passwordCheck);
			if (result) {
				row = userBO.updateUserByloginId(loginId, nickname, postCode, address, phoneNumber, newPassword);
			} else {
				return 500;
			}
		}
		return row;
	}
	
}
