package com.easybook.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.order.model.Order;

@Repository
public interface OrderDAO {
	
	public int insertOrder(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("orderGroupId") int orderGroupId,
			@Param("productId") int productId,
			@Param("amount") int amount,
			@Param("totalPrice") int totalPrice);
	
	public List<Order> selectOrderListByOrderGroupId(int orderGroupId);
	
	public Order selectOrderById(int orderid);

	public int updateOrderById(
			@Param("orderId") int orderId, 
			@Param("deliveryStatus") String deliveryStatus);
	
}
