package com.KHCafeErp.www.dto;

public class Staff {
	
	private int staffNo;
	private int shopNo;
	private int position;
	private String staffName;
	private String hiredDate;
	private String leaveDate;
	private int salary;
	private int status;
	private String pw;
	private String nick;
	private String email;
	private String cellNum;
	private String gender;
	private String userKey;
	private String shopName;
	@Override
	public String toString() {
		return "Staff [staffNo=" + staffNo + ", shopNo=" + shopNo + ", position=" + position + ", staffName="
				+ staffName + ", hiredDate=" + hiredDate + ", leaveDate=" + leaveDate + ", salary=" + salary
				+ ", status=" + status + ", pw=" + pw + ", nick=" + nick + ", email=" + email + ", cellNum=" + cellNum
				+ ", gender=" + gender + ", userKey=" + userKey + ", shopName=" + shopName + "]";
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
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getHiredDate() {
		return hiredDate;
	}
	public void setHiredDate(String hiredDate) {
		this.hiredDate = hiredDate;
	}
	public String getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCellNum() {
		return cellNum;
	}
	public void setCellNum(String cellNum) {
		this.cellNum = cellNum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserKey() {
		return userKey;
	}
	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	

	
	
	
	
	

}
