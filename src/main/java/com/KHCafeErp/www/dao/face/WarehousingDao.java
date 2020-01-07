package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.Warehousing;

public interface WarehousingDao {
	
	/**
	 * 2020-01-06 지재용
	 * 
	 * 입고 정보 삽입
	 * 
	 * @param warehousing - 회원가입 정보
	 */
	public void insert(Warehousing warehousing);

	public List<Warehousing> selectWarehousingList(Warehousing wareHousing) ;

}
