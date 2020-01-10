package com.KHCafeErp.www.dto;

public class ReleaseProduct {
	private int releaseProductNo;
	private int releaseNo;
	private String releaseProductName;
	private int productCnt;
	private int productStatus;
	private int productPrice;
	private String remark;
	
	@Override
	public String toString() {
		return "ReleaseProduct [releaseProductNo=" + releaseProductNo + ", releaseNo=" + releaseNo
				+ ", releaseProductName=" + releaseProductName + ", productCnt=" + productCnt + ", productStatus="
				+ productStatus + ", productPrice=" + productPrice + ", remark=" + remark + "]";
	}

	public final int getReleaseProductNo() {
		return releaseProductNo;
	}

	public final void setReleaseProductNo(int releaseProductNo) {
		this.releaseProductNo = releaseProductNo;
	}

	public final int getReleaseNo() {
		return releaseNo;
	}

	public final void setReleaseNo(int releaseNo) {
		this.releaseNo = releaseNo;
	}

	public final String getReleaseProductName() {
		return releaseProductName;
	}

	public final void setReleaseProductName(String releaseProductName) {
		this.releaseProductName = releaseProductName;
	}

	public final int getProductCnt() {
		return productCnt;
	}

	public final void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	public final int getProductStatus() {
		return productStatus;
	}

	public final void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
