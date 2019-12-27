package com.KHCafeErp.www.dto;

public class Shop {
	
	private int shopNo;
	private String shopName;
	private int shopLat;
	private int shopLng;
	
	
	@Override
	public String toString() {
		return "Shop [shopNo=" + shopNo + ", shopName=" + shopName + ", shopLat=" + shopLat + ", shopLng=" + shopLng
				+ "]";
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getShopLat() {
		return shopLat;
	}
	public void setShopLat(int shopLat) {
		this.shopLat = shopLat;
	}
	public int getShopLng() {
		return shopLng;
	}
	public void setShopLng(int shopLng) {
		this.shopLng = shopLng;
	}
	
	

	
	

}
