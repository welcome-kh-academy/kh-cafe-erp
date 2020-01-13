package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.PlacingOrderProduct;
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
	 * 20-01-08 지재용
	 * 발주 정보 등록 
	 * @param placingorder - 발주 정보
	 */
	public void placingOrderInsert(PlacingOrder placingorder);
	
	/**
	 * 20-01-08 지재용
	 * 발주 상품 정보 등록
	 * @param placingorderproduct - 발주 상품 정보
	 */
	public void placingOrderProductInsert(PlacingOrderProduct placingorderproduct);
	
	/**
	 * 20-01-08 지재용
	 * 원자재 이름 조회
	 * @return List<Ingredient> - 원자재 이름
	 */
	public List<Ingredient> selectIngredientList();
	
	/**
	 * 20-01-08 장유진,지재용
	 * 원자재 추가 시 원자재 정보  가져오기
	 * @return Ingredient - 원자재 정보 
	 */
	public Ingredient selectIngredientInfo(int ingredientNo);
	
	/**
	 * 20-01-08 지재용
	 * nextval 발주번호  가져오기
	 * @return placingOrderNo - 발주번호
	 */
	public int selectNextVal();

	/**
	 * 20-01-12 유진
	 * 엑셀 파일 업로드
	 * @param placingOrder - 발주번호
	 */
	public void insertPlacingOrder(PlacingOrder placingOrder);

	/**
	 * 20-01-12 유진
	 * shopNo 조회
	 * @param shopName - 엑셀에서 받아온 shopName
	 * @return - 해당하는 shopNo
	 */
	public int getShopNo(String shopName);

	/**
	 * 20-01-12 유진
	 * 발주번호 조회
	 * @param placingOrder - 엑셀 업로드로 생성 된 placingOrderNo
	 * @return - 해당하는 placingOrderNo
	 */
	public int selectPlacingOrderNo(PlacingOrder placingOrder);

	/**
	 * 20-01-12 유진
	 * 엑셀 파일 업로드
	 * @param placingOrderProduct - 엑셀에서 얻어온 placingOrderProduct
	 */
	public void insertPlacingOrderProduct(PlacingOrderProduct placingOrderProduct);
	


}
