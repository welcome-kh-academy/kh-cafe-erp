package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.PlacingOrder;
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
	 * 2020-01-08 이경수
	 * 
	 * 검색 조건 리스트 가져오기
	 * 
	 * @param wareHousing - 조건을 담은 wareHousing 객체 
	 * @return 조회하려는 조건에 일치하는 wareHousing List 객체
	 */
	
	public List<Warehousing> getWareHousingList(Warehousing wareHousing);
	
	/**
	 * 2020-01-08 이경수
	 * 
	 * 거래처 리스트 가져오기
	 * @return
	 */
	public List<Warehousing> getdealList();

	/**
	 * 2020-01-08 이경수
	 * 
	 * 보관 창고 리스트 가져오기
	 * 
	 * @return
	 */
	public List<Warehousing> getdwareHouseList();
	
	/**
	 * 2020-01-08 이경수
	 * 
	 * 엑셀 다운로드를 위한 전체 리스트 로드
	 * 
	 * @return
	 */
	public List<Warehousing> getList();

}
