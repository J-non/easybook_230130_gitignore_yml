package com.easybook.order.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDAO {
	
	public int insertOrder(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("orderGroupId") int orderGroupId,
			@Param("productId") int productId,
			@Param("amount") int amount,
			@Param("totalPrice") int totalPrice);
	
}
