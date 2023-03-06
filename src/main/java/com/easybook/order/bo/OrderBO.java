package com.easybook.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.order.dao.OrderDAO;
import com.easybook.order.model.Order;

@Service
public class OrderBO {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public int addOrder(Integer userId, Integer nonMemberId, int orderGroupId, int productId, int amount, int totalPrice) {
		return orderDAO.insertOrder(userId, nonMemberId, orderGroupId, productId, amount, totalPrice);
	}
	
	public List<Order> getOrderListByOrderGroupId(int orderGroupId) {
		return orderDAO.selectOrderListByOrderGroupId(orderGroupId);
	}
	
	public Order getOrderById(int orderid) {
		return orderDAO.selectOrderById(orderid);
	}

	public int updateOrderById(int orderId, String deliveryStatus) {
		return orderDAO.updateOrderById(orderId, deliveryStatus);
	}
	
	
}
