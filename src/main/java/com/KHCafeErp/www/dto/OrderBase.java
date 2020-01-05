package com.KHCafeErp.www.dto;

public class OrderBase {
	private int orderNo;
	private int cusNo;
	private int prdShopNo;
	private String orderDate;
	private String requirement;
	private int orderStatus;
	@Override
	public String toString() {
		return "OrderBase [orderNo=" + orderNo + ", cusNo=" + cusNo + ", prdShopNo=" + prdShopNo + ", orderDate="
				+ orderDate + ", requirement=" + requirement + ", orderStatus=" + orderStatus + "]";
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getCusNo() {
		return cusNo;
	}
	public void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}
	public int getPrdShopNo() {
		return prdShopNo;
	}
	public void setPrdShopNo(int prdShopNo) {
		this.prdShopNo = prdShopNo;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	
}
