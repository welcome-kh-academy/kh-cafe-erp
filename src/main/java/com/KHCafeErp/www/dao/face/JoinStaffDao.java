package com.KHCafeErp.www.dao.face;

import com.KHCafeErp.www.dto.Staff;

public interface JoinStaffDao {
	
	/**
	 * 회원가입 정보 삽입
	 * 
	 * @param staff - 회원가입 정보
	 */
	public void insert(Staff staff);
		
	/*
	 *  중복 체크
	 * 
	 * @param nick - 입력한 nick 값
	 * @return 1 - 중복 , 0 - 중복x
	 */
	public int nickCheck(String nick);
	
	/*
	 * id 중복 체크
	 * 
	 * @param id - 입력한 id 값
	 * @return 1 - 중복 , 0 - 중복x
	 */
	public int selectIdCntCheck(int staffNo);
	
	
}
