package com.easybook.order.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.order.model.OrderGroup;

@Repository
public interface OrderGroupDAO {
	
	public int insertOrderGroup(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("consigneeName") String consigneeName,
			@Param("consigneePhoneNumber") String consigneePhoneNumber,
			@Param("postCode") String postCode,
			@Param("address") String address,
			@Param("totalPrice") int totalPrice);
	
	public OrderGroup selectOrderGroupByUserIdNonMemberId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId);
	
}
