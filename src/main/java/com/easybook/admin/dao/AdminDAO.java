package com.easybook.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.admin.model.Admin;

@Repository
public interface AdminDAO {
	
	public Admin selectAdminByLoginIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public List<Admin> selectAdminList();
	
	public int updateAdminById(
			@Param("adminId") int adminId,
			@Param("authority") String authority);
	
	public int deleteAdminById(int adminId);
	
	public boolean exsitLoginId(String loginId);
	
	public int insertUser(
			@Param("managerName") String managerName,
			@Param("loginId") String loginId,
			@Param("password") String password);
}
