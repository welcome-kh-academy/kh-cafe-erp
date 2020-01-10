package com.KHCafeErp.www.dto;

public class Release {
	private Integer releaseNo;
	private Integer placingOrderNo;
	private Integer releaseStatus;
	private String releaseDate;
	private String shopName;
	private Integer shopNo;
	private String startDate; //시작일
	private String endDate; //종료일
	private int placingOrderStatus;

	@Override
	public String toString() {
		return "Release [releaseNo=" + releaseNo + ", placingOrderNo=" + placingOrderNo + ", releaseStatus="
				+ releaseStatus + ", releaseDate=" + releaseDate + ", shopName=" + shopName + ", shopNo=" + shopNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", placingOrderStatus=" + placingOrderStatus
				+ "]";
	}

	public final Integer getReleaseNo() {
		return releaseNo;
	}

	public final void setReleaseNo(Integer releaseNo) {
		this.releaseNo = releaseNo;
	}

	public final Integer getPlacingOrderNo() {
		return placingOrderNo;
	}

	public final void setPlacingOrderNo(Integer placingOrderNo) {
		this.placingOrderNo = placingOrderNo;
	}

	public final Integer getReleaseStatus() {
		return releaseStatus;
	}

	public final void setReleaseStatus(Integer releaseStatus) {
		this.releaseStatus = releaseStatus;
	}

	public final String getReleaseDate() {
		return releaseDate;
	}

	public final void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public final String getShopName() {
		return shopName;
	}

	public final void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public final String getStartDate() {
		return startDate;
	}

	public final void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public final String getEndDate() {
		return endDate;
	}

	public final void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public final Integer getShopNo() {
		return shopNo;
	}

	public final void setShopNo(Integer shopNo) {
		this.shopNo = shopNo;
	}

	public int getPlacingOrderStatus() {
		return placingOrderStatus;
	}

	public void setPlacingOrderStatus(int placingOrderStatus) {
		this.placingOrderStatus = placingOrderStatus;
	}

	
	
}
