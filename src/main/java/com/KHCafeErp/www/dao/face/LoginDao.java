package com.KHCafeErp.www.dao.face;

import com.KHCafeErp.www.dto.Staff;

public interface LoginDao {
	/**
	 * 로그인 정보로 직원정보를 불러온다
	 * @param staff - 로그인한 직원번호
	 * @return - 직원 정보
	 */
	public Staff selectByStaffNo(Staff staff);
	/**
	 * 로그인 하려고 하는 정보가 db에 있는지 확인한다
	 * @param staff - 로그인 하려는 정보
	 * @return - db와 일치하는 갯수
	 */
	public int cntAccount(Staff staff);
	public Object getPosition(Staff staff);

}
