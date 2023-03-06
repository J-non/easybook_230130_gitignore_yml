package com.easybook.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.user.model.User;

@Repository
public interface UserDAO {
	
	public boolean exsitLoginId(String loginId);
	
	public boolean exsitEmail(String email);
	
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
	
	public User selectUserByNameEmail(
			@Param("name") String name,
			@Param("email") String email);
	
	public boolean checkPasswordByLoginIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public int updateUserByloginId(
			@Param("loginId") String loginId,
			@Param("nickname") String nickname,
			@Param("postCode") String postCode,
			@Param("address") String address,
			@Param("phoneNumber") String phoneNumber,
			@Param("newPassword") String newPassword);
	
	public User selectUserByLoginIdNamePhoneNumber(
			@Param("loginId") String loginId,
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
	
	public int updateUserById(
			@Param("userId") int userId,
			@Param("password") String password);
}
