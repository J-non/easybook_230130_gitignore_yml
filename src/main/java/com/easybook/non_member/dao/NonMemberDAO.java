package com.easybook.non_member.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.non_member.model.NonMember;

@Repository
public interface NonMemberDAO {
	
	public boolean existEmail(String email);
	
	public int addNonMember(
			@Param("email") String email,
			@Param("name") String name,
			@Param("password") String password);
	
	public NonMember selectNonMemberByEmailPassword(
			@Param("email") String email,
			@Param("password") String password);
	
}
