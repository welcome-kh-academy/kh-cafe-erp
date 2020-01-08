package com.KHCafeErp.www.dto;

public class OrderProduct {
	private int orderPrdno;
	private int orderNo;
	private int productOptionNo;
	private int productNo;
	private int productCnt;
	private String productName;
	private int price;
	private String productorigin;
	@Override
	public String toString() {
		return "OrderProduct [orderPrdno=" + orderPrdno + ", orderno=" + orderNo + ", productOptionNo="
				+ productOptionNo + ", productNo=" + productNo + ", productCnt=" + productCnt + ", productName="
				+ productName + ", price=" + price + ", productorigin=" + productorigin + "]";
	}
	public int getOrderPrdno() {
		return orderPrdno;
	}
	public void setOrderPrdno(int orderPrdno) {
		this.orderPrdno = orderPrdno;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getProductOptionNo() {
		return productOptionNo;
	}
	public void setProductOptionNo(int productOptionNo) {
		this.productOptionNo = productOptionNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductorigin() {
		return productorigin;
	}
	public void setProductorigin(String productorigin) {
		this.productorigin = productorigin;
	}
	
	
	
}
