package com.easybook.order.model;

import java.util.Date;

public class Order {
	
	private int id;
	private int userid;
	private int nonMemberId;
	private int orderGroupId;
	private int productId;
	private int amount;
	private int totalPrice;
	private String buyerRequest;
	private Date createdAt;
	private Date updatedAt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getNonMemberId() {
		return nonMemberId;
	}
	public void setNonMemberId(int nonMemberId) {
		this.nonMemberId = nonMemberId;
	}
	public int getOrderGroupId() {
		return orderGroupId;
	}
	public void setOrderGroupId(int orderGroupId) {
		this.orderGroupId = orderGroupId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getBuyerRequest() {
		return buyerRequest;
	}
	public void setBuyerRequest(String buyerRequest) {
		this.buyerRequest = buyerRequest;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
}
