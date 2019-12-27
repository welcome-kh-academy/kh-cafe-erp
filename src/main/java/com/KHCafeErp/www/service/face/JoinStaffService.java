package com.KHCafeErp.www.service.face;

import com.KHCafeErp.www.dto.Staff;

public interface JoinStaffService {
	
	/**
	 * 회원가입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void join(Staff staff);
	
	/*
	 * nick 중복 체크
	 * 
	 * @param nick - nick값
	 */
	public int nickCheck(String nick);
	
	/*
	 * id 중복 체크
	 * 
	 * @param id - id값
	 */
	public int idCheck(int staffNo);
	


}
