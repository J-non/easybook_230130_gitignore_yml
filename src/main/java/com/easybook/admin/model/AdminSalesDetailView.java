package com.easybook.admin.model;

import com.easybook.non_member.model.NonMember;
import com.easybook.order.model.Order;
import com.easybook.order.model.OrderGroup;
import com.easybook.product.model.Product;
import com.easybook.user.model.User;

public class AdminSalesDetailView {
	
	private OrderGroup orderGroup;
	private Order order;
	private Product product;
	private User user;
	private NonMember nonMember;
	
	
	public OrderGroup getOrderGroup() {
		return orderGroup;
	}
	public void setOrderGroup(OrderGroup orderGroup) {
		this.orderGroup = orderGroup;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
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
