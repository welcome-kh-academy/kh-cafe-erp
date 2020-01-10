package com.KHCafeErp.www.dto;

public class PlacingOrderProduct {
	
	private int placingOrderProductNo; //발주 상품 번호, 기본키
	private int placingOrderNo; //발주 번호, 외래키
	private int ingredientNo; //원자재 번호, 외래키	
	private int placingOrderProductStatus; //발주 상태
	private int placingOrderProductCnt; //발주 상품 개수
	
	@Override
	public String toString() {
		return "PlacingOrderProductNo [placingOrderProductNo=" + placingOrderProductNo + ", placingOrderNo="
				+ placingOrderNo + ", ingredientNo=" + ingredientNo + ", placingOrderProductStatus="
				+ placingOrderProductStatus + ", placingOrderProductCnt=" + placingOrderProductCnt + "]";
	}

	public int getPlacingOrderProductNo() {
		return placingOrderProductNo;
	}

	public void setPlacingOrderProductNo(int placingOrderProductNo) {
		this.placingOrderProductNo = placingOrderProductNo;
	}

	public int getPlacingOrderNo() {
		return placingOrderNo;
	}

	public void setPlacingOrderNo(int placingOrderNo) {
		this.placingOrderNo = placingOrderNo;
	}

	public int getIngredientNo() {
		return ingredientNo;
	}

	public void setIngredientNo(int ingredientNo) {
		this.ingredientNo = ingredientNo;
	}

	public int getPlacingOrderProductStatus() {
		return placingOrderProductStatus;
	}

	public void setPlacingOrderProductStatus(int placingOrderProductStatus) {
		this.placingOrderProductStatus = placingOrderProductStatus;
	}

	public int getPlacingOrderProductCnt() {
		return placingOrderProductCnt;
	}

	public void setPlacingOrderProductCnt(int placingOrderProductCnt) {
		this.placingOrderProductCnt = placingOrderProductCnt;
	}
	
	
	
}
