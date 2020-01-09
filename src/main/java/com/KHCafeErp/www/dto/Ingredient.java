package com.KHCafeErp.www.dto;

public class Ingredient {
	
	private int ingredientNo; //원자재 번호
	private String ingredientName; //원자재 이름
	private int ingredientPrice; //원자재 가격
	private String origin; //원산지
	private String maker; //제조사
	private String ingredientOption; //원자재 옵션
	
	@Override
	public String toString() {
		return "Ingredient [ingredientNo=" + ingredientNo + ", ingredientName=" + ingredientName + ", ingredientPrice="
				+ ingredientPrice + ", origin=" + origin + ", maker=" + maker + ", ingredientOption=" + ingredientOption
				+ "]";
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
	
	
	
}
