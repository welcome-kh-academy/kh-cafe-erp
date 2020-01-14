package com.KHCafeErp.www.dto;

public class PlacingOrder {

	private Integer placingOrderNo; //기본키
	private Integer shopNo; //외래키
	private String placingOrderDate; //발주일
	private Integer placingOrderStatus; //발주상태
	private Integer inStockStatus; //입고상태
	private int placingOrderPrice;	// 발주 금액
	private int placingOrderCnt;	// 발주 수량
	
	private String startDate; //시작일
	private String endDate; //종료일
	private String shopName; //지점명
	
	@Override
	public String toString() {
		return "PlacingOrder [placingOrderNo=" + placingOrderNo + ", shopNo=" + shopNo + ", placingOrderDate="
				+ placingOrderDate + ", placingOrderStatus=" + placingOrderStatus + ", inStockStatus=" + inStockStatus
				+ ", placingOrderPrice=" + placingOrderPrice + ", placingOrderCnt=" + placingOrderCnt + ", startDate="
				+ startDate + ", endDate=" + endDate + ", shopName=" + shopName + "]";
	}

	public Integer getPlacingOrderNo() {
		return placingOrderNo;
	}

	public void setPlacingOrderNo(Integer placingOrderNo) {
		this.placingOrderNo = placingOrderNo;
	}

	public Integer getShopNo() {
		return shopNo;
	}

	public void setShopNo(Integer shopNo) {
		this.shopNo = shopNo;
	}

	public String getPlacingOrderDate() {
		return placingOrderDate;
	}
	public void setPlacingOrderDate(String placingOrderDate) {
		this.placingOrderDate = placingOrderDate;
	}
	public Integer getPlacingOrderStatus() {
		return placingOrderStatus;
	}
	public void setPlacingOrderStatus(Integer placingOrderStatus) {
		this.placingOrderStatus = placingOrderStatus;
	}
	public Integer getInStockStatus() {
		return inStockStatus;
	}
	public void setInStockStatus(Integer inStockStatus) {
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

	public final int getPlacingOrderPrice() {
		return placingOrderPrice;
	}

	public final void setPlacingOrderPrice(int placingOrderPrice) {
		this.placingOrderPrice = placingOrderPrice;
	}

	public final int getPlacingOrderCnt() {
		return placingOrderCnt;
	}

	public final void setPlacingOrderCnt(int placingOrderCnt) {
		this.placingOrderCnt = placingOrderCnt;
	}
	
	
}
