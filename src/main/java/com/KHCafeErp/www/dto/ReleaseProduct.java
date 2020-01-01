package com.KHCafeErp.www.dto;

public class ReleaseProduct {
	private int releaseNo;
	private int placingOrderNo;
	private int productNo;
	private int productCnt;
	
	@Override
	public String toString() {
		return "ReleaseProduct [releaseNo=" + releaseNo + ", placingOrderNo=" + placingOrderNo + ", productNo="
				+ productNo + ", productCnt=" + productCnt + "]";
	}

	protected final int getReleaseNo() {
		return releaseNo;
	}

	protected final int getPlacingOrderNo() {
		return placingOrderNo;
	}

	protected final int getProductNo() {
		return productNo;
	}

	protected final int getProductCnt() {
		return productCnt;
	}
	
	
}
