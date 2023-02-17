package com.easybook.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.user.model.User;

@Repository
public interface UserDAO {
	
	public boolean exsitLoginId(String loginId);
	
	public int insertUser(
			@Param("name") String name,
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("email") String email,
			@Param("phoneNumber") String phoneNumber,
			@Param("postCode") String postCode,
			@Param("address") String address);
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public User selectUserById(int id);
}
