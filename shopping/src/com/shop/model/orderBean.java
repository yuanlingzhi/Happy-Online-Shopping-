package com.shop.model;

public class orderBean
{
	public long getOrdersID() {
		return ordersID;
	}
	public void setOrdersID(long ordersID) {
		this.ordersID = ordersID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getOrderDATE() {
		return orderDATE;
	}
	public void setOrderDATE(String orderDATE) {
		this.orderDATE = orderDATE;
	}
	public String getPayMODE() {
		return payMODE;
	}
	public void setPayMODE(String payMODE) {
		this.payMODE = payMODE;
	}
	public String getIsPAYED() {
		return isPAYED;
	}
	public void setIsPAYED(String isPAYED) {
		this.isPAYED = isPAYED;
	}
	public String getTotalPRICE() {
		return totalPRICE;
	}
	public void setTotalPRICE(String totalPRICE) {
		this.totalPRICE = totalPRICE;
	}
	private long ordersID; 
	private String userID;
	private String orderDATE;
	private String payMODE;
	private String isPAYED;
	private String totalPRICE;
}
