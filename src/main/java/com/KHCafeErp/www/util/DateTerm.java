package com.KHCafeErp.www.util;

// 기간
public class DateTerm {

	private String startDate; //시작일
	private String endDate; //종료일

	@Override
	public String toString() {
		return "DateTerm [startDate=" + startDate + ", endDate=" + endDate + "]";
	}
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
	
}
