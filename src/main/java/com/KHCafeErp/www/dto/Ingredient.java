package com.KHCafeErp.www.dto;

public class Ingredient {
	private int ingredientNo;
	private String ingredientName;
	private int ingredientPrice;
	private String origin;
	private String maker;
	private String ingredientOption;
	
	private int placingOrderProductCnt;
	private int releaseNo;
	
	@Override
	public String toString() {
		return "Ingredient [ingredientNo=" + ingredientNo + ", ingredientName=" + ingredientName + ", ingredientPrice="
				+ ingredientPrice + ", origin=" + origin + ", maker=" + maker + ", ingredientOption=" + ingredientOption
				+ ", placingOrderProductCnt=" + placingOrderProductCnt + ", releaseNo=" + releaseNo + "]";
	}

	public int getIngredientNo() {
		return ingredientNo;
	}

	public void setIngredientNo(int ingredientNo) {
		this.ingredientNo = ingredientNo;
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

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getIngredientOption() {
		return ingredientOption;
	}

	public void setIngredientOption(String ingredientOption) {
		this.ingredientOption = ingredientOption;
	}

	public int getPlacingOrderProductCnt() {
		return placingOrderProductCnt;
	}

	public void setPlacingOrderProductCnt(int placingOrderProductCnt) {
		this.placingOrderProductCnt = placingOrderProductCnt;
	}

	public int getReleaseNo() {
		return releaseNo;
	}

	public void setReleaseNo(int releaseNo) {
		this.releaseNo = releaseNo;
	}

	
	
}
