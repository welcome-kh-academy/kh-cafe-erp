package com.KHCafeErp.www.service.face;

import javax.servlet.http.HttpServletRequest;

import com.KHCafeErp.www.dto.Staff;

public interface FindIdPwService {

	public Staff findid(Staff staff);

	/**
	 *  비밀번호찾기
	 * @param user_email
	 * @param staffNo
	 * @param request
	 */
	public void mailSendWithfindPwKey(String user_email, int staffNo, HttpServletRequest request,Staff staff);

	public Staff getPw(Staff staff);


	
}
