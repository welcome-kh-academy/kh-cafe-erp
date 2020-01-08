package com.KHCafeErp.www.dto;

public class CounselBoard {
	private int cBoardNo;
	private int cusNo;
	private String cusId;
	private int staffNo;
	private String staffName;
	private String cBoardTitle;
	private String cBoardDate;
	private String cBoardContent;

	@Override
	public String toString() {
		return "CounselBoard [cBoardNo=" + cBoardNo + ", cusNo=" + cusNo + ", cusId=" + cusId + ", staffNo=" + staffNo
				+ ", staffName=" + staffName + ", cBoardTitle=" + cBoardTitle + ", cBoardDate=" + cBoardDate
				+ ", cBoardContent=" + cBoardContent + "]";
	}

	public final int getcBoardNo() {
		return cBoardNo;
	}

	public final void setcBoardNo(int cBoardNo) {
		this.cBoardNo = cBoardNo;
	}

	public final int getCusNo() {
		return cusNo;
	}

	public final void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}

	public final int getStaffNo() {
		return staffNo;
	}

	public final void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}

	public final String getStaffName() {
		return staffName;
	}

	public final void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public final String getcBoardTitle() {
		return cBoardTitle;
	}

	public final void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}

	public final String getcBoardDate() {
		return cBoardDate;
	}

	public final void setcBoardDate(String cBoardDate) {
		this.cBoardDate = cBoardDate;
	}

	public final String getcBoardContent() {
		return cBoardContent;
	}

	public final void setcBoardContent(String cBoardContent) {
		this.cBoardContent = cBoardContent;
	}

	public final String getCusId() {
		return cusId;
	}

	public final void setCusId(String cusId) {
		this.cusId = cusId;
	}

}
