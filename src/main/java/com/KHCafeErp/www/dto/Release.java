package com.KHCafeErp.www.dto;

public class Release {
	private int releaseNo;
	private int placingOrderNo;
	private int releaseStatus;
	private String releaseDate;
	private String shopName;
	
	@Override
	public String toString() {
		return "Release [releaseNo=" + releaseNo + ", placingOrderNo=" + placingOrderNo + ", releaseStatus="
				+ releaseStatus + ", releaseDate=" + releaseDate + ", shopName=" + shopName + "]";
	}

	public final int getReleaseNo() {
		return releaseNo;
	}

	public final void setReleaseNo(int releaseNo) {
		this.releaseNo = releaseNo;
	}

	public final int getPlacingOrderNo() {
		return placingOrderNo;
	}

	public final void setPlacingOrderNo(int placingOrderNo) {
		this.placingOrderNo = placingOrderNo;
	}

	public final int getReleaseStatus() {
		return releaseStatus;
	}

	public final void setReleaseStatus(int releaseStatus) {
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

	
	
	
}
