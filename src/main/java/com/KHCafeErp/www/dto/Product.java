package com.KHCafeErp.www.dto;

public class Product {
	private Integer productNo;
	private Integer categoryMapNo;
	private int optionNo;
	private Integer shopNo;
	private String shopName;
	private String productName;
	private String productContent;
	private int originPrice;
	private int price;
	private String productOrigin;
	private String selStartDate;
	private String enrollDate;
	private String selEndDate;
	private int selStatus;
	private String categoryName;
	private Integer categoryNo;
	private String categoryDetailName;
	
	
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryMapNo=" + categoryMapNo + ", optionNo=" + optionNo
				+ ", shopNo=" + shopNo + ", shopName=" + shopName + ", productName=" + productName + ", productContent="
				+ productContent + ", originPrice=" + originPrice + ", price=" + price + ", productOrigin="
				+ productOrigin + ", selStartDate=" + selStartDate + ", enrollDate=" + enrollDate + ", selEndDate="
				+ selEndDate + ", selStatus=" + selStatus + ", categoryName=" + categoryName + ", categoryNo="
				+ categoryNo + ", categoryDetailName=" + categoryDetailName + "]";
	}
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public Integer getCategoryMapNo() {
		return categoryMapNo;
	}
	public void setCategoryMapNo(Integer categoryMapNo) {
		this.categoryMapNo = categoryMapNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public Integer getShopNo() {
		return shopNo;
	}
	public void setShopNo(Integer shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getOriginPrice() {
		return originPrice;
	}
	public void setOriginPrice(int originPrice) {
		this.originPrice = originPrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	public String getSelStartDate() {
		return selStartDate;
	}
	public void setSelStartDate(String selStartDate) {
		this.selStartDate = selStartDate;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getSelEndDate() {
		return selEndDate;
	}
	public void setSelEndDate(String selEndDate) {
		this.selEndDate = selEndDate;
	}
	public int getSelStatus() {
		return selStatus;
	}
	public void setSelStatus(int selStatus) {
		this.selStatus = selStatus;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Integer getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryDetailName() {
		return categoryDetailName;
	}
	public void setCategoryDetailName(String categoryDetailName) {
		this.categoryDetailName = categoryDetailName;
	}
	
	
	
	
	
	
	
}
