package com.KHCafeErp.www.dto;

public class OrderBase {
	private int orderNo;
	private int cusNo;
	private String orderDate;
	private String requirement;
	private int orderStatus;
	private int orderShopNo;

	@Override
	public String toString() {
		return "OrderBase [orderNo=" + orderNo + ", cusNo=" + cusNo + ", orderDate=" + orderDate + ", requirement="
				+ requirement + ", orderStatus=" + orderStatus + ", orderShopNo=" + orderShopNo + "]";
	}

	

	public final int getOrderNo() {
		return orderNo;
	}



	public final void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}



	public final int getCusNo() {
		return cusNo;
	}

	public final void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}

	public final String getOrderDate() {
		return orderDate;
	}

	public final void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public final String getRequirement() {
		return requirement;
	}

	public final void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public final int getOrderStatus() {
		return orderStatus;
	}

	public final void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public final int getOrderShopNo() {
		return orderShopNo;
	}

	public final void setOrderShopNo(int orderShopNo) {
		this.orderShopNo = orderShopNo;
	}

	
	
}
