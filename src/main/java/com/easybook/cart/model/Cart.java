package com.easybook.cart.model;

import java.util.Date;

public class Cart {
	
	private int id;
	private int userId;
	private int nonMemberId;
	private int porductId;
	private int productCount;
	private Date createdAt;
	private Date updatedAt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getNonMemberId() {
		return nonMemberId;
	}
	public void setNonMemberId(int nonMemberId) {
		this.nonMemberId = nonMemberId;
	}
	public int getPorductId() {
		return porductId;
	}
	public void setPorductId(int porductId) {
		this.porductId = porductId;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
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
