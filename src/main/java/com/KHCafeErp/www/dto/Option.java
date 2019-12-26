package com.KHCafeErp.www.dto;

public class Option {
	private int optionNo;
	private String optionName;
	private int optionValue;
	private int rnum;
	private int categoryNo;

	@Override
	public String toString() {
		return "option [optionNo=" + optionNo + ", optionName=" + optionName
				+ ", optionValue=" + optionValue + ", rnum=" + rnum + ", categoryNo=" + categoryNo + "]";
	}

	public int getoptionNo() {
		return optionNo;
	}

	public void setoptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getoptionName() {
		return optionName;
	}

	public void setoptionName(String optionName) {
		this.optionName = optionName;
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

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	
}
