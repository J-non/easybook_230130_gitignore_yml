package com.easybook.admin.model;

import java.util.List;

import com.easybook.non_member.model.NonMember;
import com.easybook.order.model.Order;
import com.easybook.order.model.OrderGroup;
import com.easybook.product.model.Product;
import com.easybook.user.model.User;

public class AdminSalesView {
	
	private OrderGroup orderGroup;
	private List<Order> orderList;
	private List<Product> productList;
	private User user;
	private NonMember nonMember;
	
	
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public NonMember getNonMember() {
		return nonMember;
	}
	public void setNonMember(NonMember nonMember) {
		this.nonMember = nonMember;
	}
	
	
	
}
