package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface ManageProductService {
	/**
	 * 검색 결과를 가져온다
	 * @param product - 검색 조건 값들
	 * @return - 검색 결과
	 */
//	public List<Product> searchList(Product product);
	/**
	 * 상품판매 시작날짜를 등록한다
	 * @param product - 상품 판매 시작 날짜
	 */
	public void editSelStartDate(Product product);
	/**
	 * 상품판매 종료날짜를 등록한다
	 * @param product - 상품 판매 종료 날짜
	 */
	public void editSelEndDate(Product product);
	/**
	 * 상품 정보를 수정한다
	 * @param product - 수정할 상품 데이터
	 */
	public void editProduct(Product product);
	/**
	 * 등록되있는 상품 목록 불러오기 및 검색조건 
	 * @return - 상품 목록
	 */
	public List<Product> getProductList(Product product);
	/**
	 * 지점 목록 불러오기
	 * @return - 지점 목록
	 */
	public List<Shop> getShopList();
	/**
	 * 카테고리 리스트 불러오기
	 * @return - 기본 카테고리 목록
	 */
	public List<CategoryBase> getcategoryList();
	/**
	 * 세부 카테고리 리스트 불러오기
	 * @return - 세부카테고리 목록
	 */
	public List<CategoryDetail> getcategoryDetailList(int categoryNo);

	public Product getProduct(int productNo);
}
