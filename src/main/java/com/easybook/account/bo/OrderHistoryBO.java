package com.easybook.account.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.account.model.OrderHistoryView;
import com.easybook.order.bo.OrderBO;
import com.easybook.order.bo.OrderGroupBO;
import com.easybook.order.model.Order;
import com.easybook.order.model.OrderGroup;
import com.easybook.product.bo.ProductBO;
import com.easybook.product.model.Product;

@Service
public class OrderHistoryBO {
	
	@Autowired
	private OrderGroupBO orderGroupBO;
	@Autowired
	private OrderBO orderBO;
	@Autowired
	private ProductBO productBO;
	
	
	public List<OrderHistoryView> generateOrderHistoryView(Integer userId, Integer nonMemberId) {
		List<OrderHistoryView> orderHistoryViewList = new ArrayList<>();
		List<OrderGroup> orderGroupList = orderGroupBO.getOrderGroupListByUserIdNonMemberId(userId, nonMemberId);
		
		for (OrderGroup orderGroup : orderGroupList) {
			OrderHistoryView orderHistoryView = new OrderHistoryView();
			orderHistoryView.setOrderGroup(orderGroup);
			
			List<Order> orderList = orderBO.getOrderListByOrderGroupId(orderGroup.getId());
			orderHistoryView.setOrderList(orderList);
			
			List<Product> productList = new ArrayList<>();
			for (Order order : orderList) {
				Product product = productBO.getProductById(order.getProductId());
				productList.add(product);
			}
			orderHistoryView.setProductList(productList);
			
			orderHistoryViewList.add(orderHistoryView);
		}
		return orderHistoryViewList;
	}
	
}
