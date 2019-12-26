package com.KHCafeErp.www.dto;

public class CategoryDetail {
	private int categoryMapNo;
	private String categoryDetailName;
	private int categoryNo;
	
	@Override
	public String toString() {
		return "CategoryDetail [categoryMapNo=" + categoryMapNo + ", categoryDetailName=" + categoryDetailName
				+ ", categoryNo=" + categoryNo + "]";
	}

	public int getCategoryMapNo() {
		return categoryMapNo;
	}

	public void setCategoryMapNo(int categoryMapNo) {
		this.categoryMapNo = categoryMapNo;
	}

	public String getCategoryDetailName() {
		return categoryDetailName;
	}

	public void setCategoryDetailName(String categoryDetailName) {
		this.categoryDetailName = categoryDetailName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	
	
}
