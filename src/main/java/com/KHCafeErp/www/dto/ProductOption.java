package com.KHCafeErp.www.dto;

public class ProductOption {
	private int productOptionNo;
	private String productOptionName;
	private int optionValue;
	private int rnum;

	@Override
	public String toString() {
		return "ProductOption [productOptionNo=" + productOptionNo + ", productOptionName=" + productOptionName
				+ ", optionValue=" + optionValue + ", rnum=" + rnum + "]";
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

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	
	
	
	
}
