package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.util.Paging;

public interface PlacingOrderService {

	/**
	 * 19-12-31 현석
	 * 페이징 객체 만들기
	 * 
	 * @param curPage : 현재 페이지 번호
	 * @param placingOrder : 전달 파라미터
	 * @return 페이징 객체
	 */
	Paging getPaging(int curPage, PlacingOrder placingOrder);

	/**
	 * 19-12-31
	 * 발주 리스트 받아오기
	 * 
	 * @param paging : 페이징 객체
	 * @return 발주 현황 리스트
	 */
//	List<PlacingOrder> getPlacingOrderList(Paging paging);

	/**
	 * 20-01-03 서현석 
	 * 지점 리스트 불러오기 (모듈화 필요!)
	 * 
	 * @return List<Shop>
	 */
	List<Shop> getShopList();

	/**
	 * 20-01-03
	 * 발주 리스트 받아오기
	 * 
	 * @param placingOrder : 검색조건
	 * @return List<PlacingOrder> : 발주리스트
	 */
	List<PlacingOrder> getPlacingOrderList(PlacingOrder placingOrder);

	/**
	 * 20-01-03 유진
	 * 발주 리스트
	 * @return 발주 리스트
	 */
	public List<PlacingOrder> getList();

}
