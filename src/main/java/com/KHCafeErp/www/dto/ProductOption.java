package com.KHCafeErp.www.dto;

public class ProductOption {
	private int productOptionNo;
	private String productOptionName;
	private int optionValue;
	private int productCnt;
	
	@Override
	public String toString() {
		return "ProductOption [productOptionNo=" + productOptionNo + ", productOptionName=" + productOptionName
				+ ", optionValue=" + optionValue + ", productCnt=" + productCnt + "]";
	}

	public int getProductOptionNo() {
		return productOptionNo;
	}

	public void setProductOptionNo(int productOptionNo) {
		this.productOptionNo = productOptionNo;
	}

	public String getProductOptionName() {
		return productOptionName;
	}

	public void setProductOptionName(String productOptionName) {
		this.productOptionName = productOptionName;
	}

	public int getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(int optionValue) {
		this.optionValue = optionValue;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	
	
}
