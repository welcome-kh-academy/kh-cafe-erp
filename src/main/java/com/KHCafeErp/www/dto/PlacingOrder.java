package com.KHCafeErp.www.dto;

public class PlacingOrder {

	private Integer placingOrderNo; //기본키
	private int shopNo; //외래키
	private String placingOrderDate; //발주일
	private int placingOrderStatus; //발주상태
	private int inStockStatus; //입고상태
	
	private String startDate; //시작일
	private String endDate; //종료일
	private String shopName; //지점명
	
	@Override
	public String toString() {
		return "PlacingOrder [placingOrderNo=" + placingOrderNo + ", shopNo=" + shopNo + ", placingOrderDate="
				+ placingOrderDate + ", placingOrderStatus=" + placingOrderStatus + ", inStockStatus=" + inStockStatus
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", shopName=" + shopName + "]";
	}
	
	public Integer getPlacingOrderNo() {
		return placingOrderNo;
	}

	public void setPlacingOrderNo(Integer placingOrderNo) {
		this.placingOrderNo = placingOrderNo;
	}

	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getPlacingOrderDate() {
		return placingOrderDate;
	}
	public void setPlacingOrderDate(String placingOrderDate) {
		this.placingOrderDate = placingOrderDate;
	}
	public int getPlacingOrderStatus() {
		return placingOrderStatus;
	}
	public void setPlacingOrderStatus(int placingOrderStatus) {
		this.placingOrderStatus = placingOrderStatus;
	}
	public int getInStockStatus() {
		return inStockStatus;
	}
	public void setInStockStatus(int inStockStatus) {
		this.inStockStatus = inStockStatus;
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
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

}
