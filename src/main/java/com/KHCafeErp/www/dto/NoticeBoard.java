package com.KHCafeErp.www.dto;

public class NoticeBoard {
	
	private int nBoardNo;
	private int staffNo;
	private int shopNo;
	private String shopName;
	private String nBoardTitle;
	private String staffName;
	private String nBoardDate;
	private String nBoardContent;
	
	@Override
	public String toString() {
		return "NoticeBoard [nBoardNo=" + nBoardNo + ", staffNo=" + staffNo + ", shopNo=" + shopNo + ", shopName="
				+ shopName + ", nBoardTitle=" + nBoardTitle + ", staffName=" + staffName + ", nBoardDate=" + nBoardDate
				+ ", nBoardContent=" + nBoardContent + "]";
	}

	public int getnBoardNo() {
		return nBoardNo;
	}

	public void setnBoardNo(int nBoardNo) {
		this.nBoardNo = nBoardNo;
	}

	public int getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public String getnBoardTitle() {
		return nBoardTitle;
	}

	public void setnBoardTitle(String nBoardTitle) {
		this.nBoardTitle = nBoardTitle;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getnBoardDate() {
		return nBoardDate;
	}

	public void setnBoardDate(String nBoardDate) {
		this.nBoardDate = nBoardDate;
	}

	public String getnBoardContent() {
		return nBoardContent;
	}

	public void setnBoardContent(String nBoardContent) {
		this.nBoardContent = nBoardContent;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
		
	
}
