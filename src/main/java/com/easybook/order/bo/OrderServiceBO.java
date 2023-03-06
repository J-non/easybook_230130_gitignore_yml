package com.easybook.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.cart.bo.CartBO;
import com.easybook.order.model.OrderGroup;

@Service
public class OrderServiceBO {
	
	@Autowired
	private OrderGroupBO orderGroupBO;
	
	@Autowired
	private OrderBO orderBO;
	
	@Autowired
	private CartBO cartBO;
	
	public int insertOrderGroupOrders(
			Integer userId, Integer nonMemberId
			, List<Integer> productIdList, List<Integer> productCountList, List<Integer> productTotalPriceList
			, String consigneeName, String consigneePhoneNumber, String postCode, String address, int totalPrice) {
		int result = 0;
		int row = orderGroupBO.addOrderGroup(userId, nonMemberId, consigneeName, consigneePhoneNumber, postCode, address, totalPrice);
		int i = 0;
		if (row > 0) {
			OrderGroup orderGroup = orderGroupBO.getOrderGroupByUserIdNonMemberId(userId, nonMemberId);
			for (int productId : productIdList) {
				row = orderBO.addOrder(userId, nonMemberId, orderGroup.getId(), productId, productCountList.get(i), productTotalPriceList.get(i));
				i++;
			}
			if (row > 0) {
				cartBO.deleteCartByUserIdNonMemberId(userId, nonMemberId);
				result = 1;
			} else {
				result = 501;
			}
		} else {
			result = 502;
		}
		return result;
	}
	
	public int updateOrderOrderGroupById(int orderId, String deliveryStatus) {
		Integer result = 500;
		int row = orderBO.updateOrderById(orderId, deliveryStatus);
		if (row > 0) {
			result = 1;
		} else {
			result = 500;
		}
		return result;
	}
}
