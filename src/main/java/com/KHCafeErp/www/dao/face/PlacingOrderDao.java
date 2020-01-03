package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.util.Paging;

public interface PlacingOrderDao {

	/**
	 * 전체 발주 리스트 개수 구하기
	 * 2019-12-31 서현석
	 * 
	 * @param placingOrder - 검색조건
	 * @return int - 총 갯수
	 */
	public int selectPlacingOrderListCnt(PlacingOrder placingOrder);

	/**
	 * 발주 리스트 불러오기
	 * 2019-12-31 서현석
	 * 
	 * @param placingOrder - 검색조건
	 * @return list - 발주 리스트
	 */
	public List<PlacingOrder> selectPlacingOrderList(PlacingOrder placingOrder);

	/**
	 * 지점 목록 불러오기(모듈화 필요!)
	 * 2020-01-03 서현석
	 * 
	 * @return List<Shop> - 지점목록
	 */
	public List<Shop> selectShopList();

	/**
	 * 20-01-03 유진
	 * 발주 목록 전체 조회
	 * @return - 발주 리스트
	 */
	public List<PlacingOrder> selectPlacingOrderListAll();

	/**
	 * 20-01-03 유진
	 * 총 발주 수량
	 * @return - 총 발주 수량
	 */
	public int getTotalPlacingOrder();

}
