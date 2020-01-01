package com.KHCafeErp.www.dto;

public class Order {
	private int OrderNo;
	private int cusNo;
	private String orderDate;
	private String requirement;
	
	@Override
	public String toString() {
		return "Order [OrderNo=" + OrderNo + ", cusNo=" + cusNo + ", orderDate=" + orderDate + ", requirement="
				+ requirement + "]";
	}

	protected final int getOrderNo() {
		return OrderNo;
	}

	protected final void setOrderNo(int orderNo) {
		OrderNo = orderNo;
	}

	protected final int getCusNo() {
		return cusNo;
	}

	protected final void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}

	protected final String getOrderDate() {
		return orderDate;
	}

	protected final void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	protected final String getRequirement() {
		return requirement;
	}

	protected final void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	
	
	
}
