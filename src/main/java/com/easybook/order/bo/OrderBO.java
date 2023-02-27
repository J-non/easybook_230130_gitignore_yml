package com.easybook.order.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.order.dao.OrderDAO;

@Service
public class OrderBO {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public int addOrder(Integer userId, Integer nonMemberId, int orderGroupId, int productId, int amount, int totalPrice) {
		return orderDAO.insertOrder(userId, nonMemberId, orderGroupId, productId, amount, totalPrice);
	}
	
}
