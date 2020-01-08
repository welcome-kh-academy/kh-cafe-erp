package com.KHCafeErp.www.dto;

public class OrderBase {
	private Integer orderNo;
	private Integer cusNo;
	private Integer shopNo;
	private String orderDate;
	private String cusReq;
	private Integer orderStatus;
	
	private String shopName;
	private String startDate;
	private String endDate;

	@Override
	public String toString() {
		return "OrderBase [orderNo=" + orderNo + ", cusNo=" + cusNo + ", shopNo=" + shopNo + ", orderDate="
				+ orderDate + ", cusReq=" + cusReq + ", orderStatus=" + orderStatus + ", shopName=" + shopName
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getCusNo() {
		return cusNo;
	}
	public void setCusNo(Integer cusNo) {
		this.cusNo = cusNo;
	}
	public Integer getShopNo() {
		return shopNo;
	}
	public void setShopNo(Integer shopNo) {
		this.shopNo = shopNo;
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
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public final String getshopName() {
		return shopName;
	}
	public final void setshopName(String prdShopName) {
		this.shopName = prdShopName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}
