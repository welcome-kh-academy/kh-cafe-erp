package com.KHCafeErp.www.service.face;

import com.KHCafeErp.www.dto.Staff;

public interface LoginService {
	/**
	 * 직원번호로 직원정보를 불러온다
	 * @param staff - 로그인 한 직원번호
	 * @return - 직원 정보
	 */
	public Staff selectByStaffNo(Staff staff);
	/**
	 * 가입되어있는 직원인지 확인한다
	 * @param staff - 로그인 하려는 정보
	 * @return - true : 직원 / false : 아님
	 */
	public boolean loginCheck(Staff staff);

}
