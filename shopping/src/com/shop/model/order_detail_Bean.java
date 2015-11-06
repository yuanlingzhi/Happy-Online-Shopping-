package com.shop.model;

public class order_detail_Bean 
{
//	private long ordersID;
//	public long getOrdersID() {
//		return ordersID;
//	}
//	public void setOrdersID(long ordersID) {
//		this.ordersID = ordersID;
//	}
//	public String getGoodsID() {
//		return goodsID;
//	}
//	public void setGoodsID(String goodsID) {
//		this.goodsID = goodsID;
//	}
//	public int getNums() {
//		return nums;
//	}
//	public void setNums(int nums) {
//		this.nums = nums;
//	}
//	private  String goodsID;
//	private int nums;	
	private long orderID;
	public long getOrderID() {
		return orderID;
	}
	public void setOrderID(long orderID) {
		this.orderID = orderID;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	private String consignee;
	private String emailAddress;
	private String phone;
	private String grade;
	private String totalPrice;
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
}
