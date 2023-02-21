package com.easybook.non_member.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.non_member.dao.NonMemberDAO;
import com.easybook.non_member.model.NonMember;

@Service
public class NonMemberBO {
	
	@Autowired
	private NonMemberDAO nonMemberDAO;
	
	public boolean existEmail(String email) {
		return nonMemberDAO.existEmail(email);
	}
	
	public int addNonMember(String email, String name, String password) {
		return nonMemberDAO.addNonMember(email, name, password);
	}
	
	public NonMember selectNonMemberByEmailPassword(String email, String password) {
		return nonMemberDAO.selectNonMemberByEmailPassword(email, password);
	}
	
}
