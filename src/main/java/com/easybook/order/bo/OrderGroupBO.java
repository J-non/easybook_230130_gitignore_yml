package com.easybook.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.order.dao.OrderGroupDAO;
import com.easybook.order.model.OrderGroup;

@Service
public class OrderGroupBO {
	
	@Autowired
	private OrderGroupDAO orderGroupDAO;
	
	public int addOrderGroup(Integer userId, Integer nonMemberId, String consigneeName, String consigneePhoneNumber
			, String postCode, String address, int totalPrice) {
		return orderGroupDAO.insertOrderGroup(userId, nonMemberId, consigneeName, consigneePhoneNumber, postCode, address, totalPrice);
	}
	
	public OrderGroup getOrderGroupById(int orderGroupId) {
		return orderGroupDAO.selectOrderGroupById(orderGroupId);
	}
	
	public OrderGroup getOrderGroupByUserIdNonMemberId(Integer userId, Integer NonMemberId) {
		return orderGroupDAO.selectOrderGroupByUserIdNonMemberId(userId, NonMemberId);
	}
	
	public List<OrderGroup> getOrderGroupList() {
		return orderGroupDAO.selectOrderGroupList();
	}
	
	public List<OrderGroup> getOrderGroupListByUserIdNonMemberId(Integer userId, Integer nonMemberId) {
		return orderGroupDAO.selectOrderGroupListByUserIdNonMemberId(userId, nonMemberId);
	}
	
}
