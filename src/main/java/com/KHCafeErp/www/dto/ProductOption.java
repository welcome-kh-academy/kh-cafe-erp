package com.KHCafeErp.www.dto;

public class ProductOption {
	private int productOptionNo;
	private int productNo;
	private int optionNo;
	
	@Override
	public String toString() {
		return "ProductOption [productOptionNo=" + productOptionNo + ", productNo=" + productNo + ", optionNo="
				+ optionNo + "]";
	}

	public int getProductOptionNo() {
		return productOptionNo;
	}

	public void setProductOptionNo(int productOptionNo) {
		this.productOptionNo = productOptionNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	
	
}
