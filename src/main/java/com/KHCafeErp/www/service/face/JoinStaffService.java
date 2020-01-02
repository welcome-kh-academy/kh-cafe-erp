package com.KHCafeErp.www.service.face;

import javax.servlet.http.HttpServletRequest;

import com.KHCafeErp.www.dto.Staff;

public interface JoinStaffService {
	
	/**
	 * 2019-12-26 지재용
	 * 
	 * 회원가입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void join(Staff staff);
	
	/*
	 * 2019-12-26 지재용
	 * 
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
	
	/**
	 * 인증 메일 보내기 메서드
	 * 2019-12-27 지재용
	 * 
	 * @param email - 이메일 주소
	 * @param staffNo - 회원번호
	 * @param req
	 */
	public void mailSendWithjoinStaffKey(String email, int staffNo, HttpServletRequest req);

	/**
	 * 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	 * 2019-12-27 지재용
	 * 
	 * @param staffNo
	 * @param key
	 */
	public int alter_userKey_service(int staffNo, String key);


}
