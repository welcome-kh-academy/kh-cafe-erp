package com.KHCafeErp.www.dto;

public class CategoryBase {
	private int categoryNo;
	private String categoryName;
	
	@Override
	public String toString() {
		return "CategoryBase [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
}
