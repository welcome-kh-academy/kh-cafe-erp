package com.KHCafeErp.www.dto;

public class ProductOption {
	private int productOptionNo;
	private String productOptionName;
	private int optionValue;
	
	@Override
	public String toString() {
		return "ProductOption [productOptionNo=" + productOptionNo + ", productOptionName=" + productOptionName
				+ ", optionValue=" + optionValue + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
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

	
	
	
	
}
