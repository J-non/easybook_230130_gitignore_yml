package com.easybook.order.model;

import java.util.Date;

public class OrderGroup {
	
	private int id;
	private int userid;
	private int nonMemberId;
	private String consigneeName;
	private String consigneePhoneNumber;
	private String postCode;
	private String address;
	private String deliveryStatus;
	private int totalPrice;
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
	public String getConsigneeName() {
		return consigneeName;
	}
	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}
	public String getConsigneePhoneNumber() {
		return consigneePhoneNumber;
	}
	public void setConsigneePhoneNumber(String consigneePhoneNumber) {
		this.consigneePhoneNumber = consigneePhoneNumber;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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
