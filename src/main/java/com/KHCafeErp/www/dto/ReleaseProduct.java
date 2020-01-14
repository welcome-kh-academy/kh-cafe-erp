package com.KHCafeErp.www.dto;

public class ReleaseProduct {
	private int releaseProductNo;
	private int releaseNo;
	private String releaseProductName;
	private int productCnt;
	private int productStatus;
	private int productPrice;
	private String productRemark;
	private String releaseDate;
	private int releaseTotalCnt;
	private String shopName;
	
	
	@Override
	public String toString() {
		return "ReleaseProduct [releaseProductNo=" + releaseProductNo + ", releaseNo=" + releaseNo
				+ ", releaseProductName=" + releaseProductName + ", productCnt=" + productCnt + ", productStatus="
				+ productStatus + ", productPrice=" + productPrice + ", productRemark=" + productRemark
				+ ", releaseDate=" + releaseDate + ", releaseTotalCnt=" + releaseTotalCnt + ", shopName=" + shopName
				+ "]";
	}
	public int getReleaseProductNo() {
		return releaseProductNo;
	}
	public void setReleaseProductNo(int releaseProductNo) {
		this.releaseProductNo = releaseProductNo;
	}
	public int getReleaseNo() {
		return releaseNo;
	}
	public void setReleaseNo(int releaseNo) {
		this.releaseNo = releaseNo;
	}
	public String getReleaseProductName() {
		return releaseProductName;
	}
	public void setReleaseProductName(String releaseProductName) {
		this.releaseProductName = releaseProductName;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public int getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductRemark() {
		return productRemark;
	}
	public void setProductRemark(String productRemark) {
		this.productRemark = productRemark;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getReleaseTotalCnt() {
		return releaseTotalCnt;
	}
	public void setReleaseTotalCnt(int releaseTotalCnt) {
		this.releaseTotalCnt = releaseTotalCnt;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	
	
	
	
	
	
	
}
