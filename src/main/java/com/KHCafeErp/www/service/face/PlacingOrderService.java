package com.KHCafeErp.www.service.face;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.PlacingOrderProduct;
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

	/**
	 * 20-01-08 지재용 
	 * 발주 등록 
	 * @param placingorder - 발주 정보, placingorderproduct - 발주 상품 정보
	 */
	public void add(PlacingOrder placingorder, PlacingOrderProduct placingorderproduct, HttpSession session);
	
	/**
	 * 20-01-08 지재용
	 * 원자재 등록 리스트 가져오기
	 * @return List<Ingredient> - 원자재 등록 정보
	 */
	public List<Ingredient> getIngredientList();
	
	/**
	 * 20-01-08 장유진, 지재용
	 * 원자재 추가 시 원자재 정보 가져오기 
	 * @return Ingredient - 원자재 정보 
	 */
	public Ingredient getIngredientInfo(int ingredientNo);

	/**
	 * 20-01-12 유진
	 * 엑셀 파일 업로드
	 * @param destFile - 엑셀 파일
	 */
	public void insertMassiveProduct(File destFile);
	


	

}
