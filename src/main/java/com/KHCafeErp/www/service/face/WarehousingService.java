package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.Warehousing;

public interface WarehousingService {
	
	/**
	 * 2020-01-06 지재용
	 * 
	 * 입고 등록
	 * 
	 * @param login - 회원가입 정보
	 */
	public void registration(Warehousing warehousing);
	
	/**
	 * 
	 * @param wareHousing - 조건을 담은 wareHousing 객체 
	 * @return 조회하려는 조건에 일치하는 wareHousing List 객체
	 */
	
	public List<Warehousing> getWareHousingList(Warehousing wareHousing);
	
	
	
	public List<Warehousing> getdealList();

}
