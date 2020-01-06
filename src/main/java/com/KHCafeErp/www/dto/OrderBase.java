package com.KHCafeErp.www.dto;

public class OrderBase {
	private int orderNo;
	private int cusNo;
	private int prdShopNo;
	private String orderDate;
	private String cusReq;
	private int orderStatus;
	@Override
	public String toString() {
		return "OrderBase [orderNo=" + orderNo + ", cusNo=" + cusNo + ", prdShopNo=" + prdShopNo + ", orderDate="
				+ orderDate + ", cusReq=" + cusReq + ", orderStatus=" + orderStatus + "]";
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
	public String getCusReq() {
		return cusReq;
	}
	public void setCusReq(String cusReq) {
		this.cusReq = cusReq;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	

	
}
