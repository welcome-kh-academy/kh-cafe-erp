package com.KHCafeErp.www.dto;

public class ProductDetail {
	private int productDetailNo;
	private int productNo;
	private int optionNo;
	private int shopNo;
	
	@Override
	public String toString() {
		return "ProductDetail [productDetailNo=" + productDetailNo + ", productNo=" + productNo + ", optionNo="
				+ optionNo + ", shopNo=" + shopNo + "]";
	}

	public final int getProductDetailNo() {
		return productDetailNo;
	}

	public final void setProductDetailNo(int productDetailNo) {
		this.productDetailNo = productDetailNo;
	}

	public final int getProductNo() {
		return productNo;
	}

	public final void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public final int getOptionNo() {
		return optionNo;
	}

	public final void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public final int getShopNo() {
		return shopNo;
	}

	public final void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	
	
}
