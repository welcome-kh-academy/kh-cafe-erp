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
	 *  nick 중복 체크
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




	


	
	/**
	 * 유저 인증키 생성 매소드
	 * 2019/12/27 지재용
	 * 
	 * @param staffNo - 회원번호
	 * @param user_key - 난수(인증키)
	 */
	public int getKey(int staffNo, String user_key);
	
	/**
	 * 유저 인증키 Y로 바꿔주는 메소드
	 * 2019/12/27 지재용
	 *  
	 * @param staffNo - 회원번호
	 * @param key - 난수(인증키)
	 * @return
	 */
	public int alterJoinStaffKey(int staffNo, String key); 
	
	
	
}
