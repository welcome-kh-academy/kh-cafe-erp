package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.PlacingOrder;
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
	
	/**
	 * 
	 * @param wareHousing 검색 조건이 들어있는 wareHousing 객체
	 * @return 검색 조건에 일치하는 wareHousing List 객체
	 */
	public List<Warehousing> selectWarehousingList(Warehousing wareHousing) ;
	
	/**
	 * 
	 * @return
	 */
	public List<Warehousing> selectDealList();

	public List<Warehousing> selectWareHouseList();

	public List<Warehousing> selectWareHouseListAll();

	public void insertWarehousing(Warehousing warehousing);

}
