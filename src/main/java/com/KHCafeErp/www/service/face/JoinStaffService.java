package com.KHCafeErp.www.service.face;

import com.KHCafeErp.www.dto.Staff;

public interface JoinStaffService {
	
	/**
	 * 회원가입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void join(Staff staff);
	


}
