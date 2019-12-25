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
	 * id 중복 체크
	 * 
	 * @param id - 입력한 id 값
	 * @return 1 - 중복 , 0 - 중복x
	 */
	public int idCheck(String id);
	
	
}
