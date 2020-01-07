package com.KHCafeErp.www.dto;

public class Warehousing {
	
	private int inStockNo; //입고번호
	private int productCnt; //상품수량
	private String inStockDate; //입고날짜
	private int shopNo; //지점번호
	private String ingredientName; //원자재 이름
	private int ingredientPrice; // 원자재가격
	
	@Override
	public String toString() {
		return "Warehousing [inStockNo=" + inStockNo + ", productCnt=" + productCnt + ", inStockDate=" + inStockDate
				+ ", shopNo=" + shopNo + ", ingredientName=" + ingredientName + ", ingredientPrice=" + ingredientPrice
				+ "]";
	}

	public int getInStockNo() {
		return inStockNo;
	}

	public void setInStockNo(int inStockNo) {
		this.inStockNo = inStockNo;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	public String getInStockDate() {
		return inStockDate;
	}

	public void setInStockDate(String inStockDate) {
		this.inStockDate = inStockDate;
	}

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public int getIngredientPrice() {
		return ingredientPrice;
	}

	public void setIngredientPrice(int ingredientPrice) {
		this.ingredientPrice = ingredientPrice;
	}
	
	
	
	
	
}
