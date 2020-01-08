package com.KHCafeErp.www.dto;

public class OrderProduct {
	private int orderPrdno;
	private int orderNo;
	private int productOptionNo;
	private int productNo;
	private int productCnt;
	
	@Override
	public String toString() {
		return "OrderProduct [orderPrdno=" + orderPrdno + ", orderNo=" + orderNo + ", productOptionNo="
				+ productOptionNo + ", productNo=" + productNo + ", productCnt=" + productCnt + "]";
	}

	public final int getOrderPrdno() {
		return orderPrdno;
	}

	public final void setOrderPrdno(int orderPrdno) {
		this.orderPrdno = orderPrdno;
	}

	public final int getOrderNo() {
		return orderNo;
	}

	public final void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public final int getProductOptionNo() {
		return productOptionNo;
	}

	public final void setProductOptionNo(int productOptionNo) {
		this.productOptionNo = productOptionNo;
	}

	public final int getProductNo() {
		return productNo;
	}

	public final void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public final int getProductCnt() {
		return productCnt;
	}

	public final void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	
	
}
