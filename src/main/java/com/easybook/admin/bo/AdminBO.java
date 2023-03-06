package com.easybook.admin.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.admin.dao.AdminDAO;
import com.easybook.admin.model.Admin;

@Service
public class AdminBO {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public Admin getAdminByLoginIdPassword(String loginId, String password) {
		return adminDAO.selectAdminByLoginIdPassword(loginId, password);
	}
	
	public List<Admin> getAdminList() {
		return adminDAO.selectAdminList();
	}
	
	public int updateAdminById(int adminId, String authority) {
		return adminDAO.updateAdminById(adminId, authority);
	}
	
	public int deleteAdminById(int adminId) {
		return adminDAO.deleteAdminById(adminId);
	}
	
	public boolean existLoginId(String loginId) {
		return adminDAO.exsitLoginId(loginId);
	}
	
	public int addUser(String managerName, String loginId, String password) {
		return adminDAO.insertUser(managerName, loginId, password);
	}
}
