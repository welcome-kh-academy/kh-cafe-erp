
package com.KHCafeErp.www.dto;

public class ProductDetail {

	private int productdetailNo;
	private int productNo;
	private int shopNo;
	private int optionNo;
	
	@Override
	public String toString() {
		return "ProductDetail [productdetailNo=" + productdetailNo + ", productNo=" + productNo + ", shopNo=" + shopNo
				+ ", optionNo=" + optionNo + "]";
	}
	public int getProductdetailNo() {
		return productdetailNo;
	}
	public void setProductdetailNo(int productdetailNo) {
		this.productdetailNo = productdetailNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	
}

