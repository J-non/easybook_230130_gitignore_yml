package com.easybook.account.model;

import java.util.List;

import com.easybook.order.model.Order;
import com.easybook.order.model.OrderGroup;
import com.easybook.product.model.Product;

public class OrderHistoryView {
	
	private OrderGroup orderGroup;
	private List<Order> orderList;
	private List<Product> productList;
	
	
	public OrderGroup getOrderGroup() {
		return orderGroup;
	}
	public void setOrderGroup(OrderGroup orderGroup) {
		this.orderGroup = orderGroup;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	
}
