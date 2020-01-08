package com.KHCafeErp.www.dto;

public class Warehousing {
	
	private int warehousingNo; //입고번호
	private int placingOrderProductNo;//발주 상품 번호
	private int storageNo; //창고 번호
	private int productCnt; //상품수량
	private String inStockDate; //입고등록일
	private int isAutoInStock;//입고 구분
	private int inStockStatus;//입고 상태
	private String dealStore;//거래지점
	private String startDate; //시작일
	private String endDate; //종료일

	
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getWarehousingNo() {
		return warehousingNo;
	}
	
	public void setWarehousingNo(int warehousingNo) {
		this.warehousingNo = warehousingNo;
	}
	public int getIsAutoInStock() {
		return isAutoInStock;
	}

	public void setIsAutoInStock(int isAutoInStock) {
		this.isAutoInStock = isAutoInStock;
	}

	public int getInStockStatus() {
		return inStockStatus;
	}

	public void setInStockStatus(int inStockStatus) {
		this.inStockStatus = inStockStatus;
	}

	public String getDealStore() {
		return dealStore;
	}

	public void setDealStore(String dealStore) {
		this.dealStore = dealStore;
	}

	public int getStorageNo() {
		return storageNo;
	}
	
	public void setStorageNo(int storageNo) {
		this.storageNo = storageNo;
	}
	
	public int getPlacingOrderProductNo() {
		return placingOrderProductNo;
	}
	
	public void setPlacingOrderProductNo(int placingOrderProductNo) {
		this.placingOrderProductNo = placingOrderProductNo;
	}
	
	@Override
	public String toString() {
		return "Warehousing [warehousingNo=" + warehousingNo + ", placingOrderProductNo=" + placingOrderProductNo
				+ ", storageNo=" + storageNo + ", productCnt=" + productCnt + ", inStockDate=" + inStockDate
				+ ", isAutoInStock=" + isAutoInStock + ", inStockStatus=" + inStockStatus + ", dealStore=" + dealStore
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
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
	
}
