package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.OptionBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface AddProductDao {
	
	/**
	 * 19-12-26
	 * 지점의 목록을 가져온다
	 * @return - 지점 목록
	 */
	public List<Shop> selectShopList();

	/**
	 * 19-12-24 유진
	 * 상품 옵션 조회
	 * @return - Option 리스트
	 */
	public List<OptionBase> selectOption(int categoryNo);

	/**
	 * 19-12-26 현석
	 * 카테고리 목록 불러오기
	 * @return - List<CategoryBase> 카테고리 목록
	 */
	public List<CategoryBase> selectCategoryList();


	public void insertOption(OptionBase option);
	/**
	 * 19-12-26 현석
	 * 상품검색으로 카테고리 가져오기
	 */
	public CategoryBase selectCategory(Product product);

	/**
	 * 19-12-26 현석
	 * 카테고리 넘버로 카테고리 상세목록 가져오기
	 * @param categoryNo
	 * @return
	 */
	public List<CategoryDetail> selectCategoryDetailList(int categoryNo);

	/**
	 * 카테고리 이름 조회
	 * @param categoryBaseNo - 카테고리 No
	 * @return - 카테고리 이름
	 */
	public String selectCategoryBaseName(int categoryBaseNo);

	/**
	 * 상세 카테고리 조회
	 * @param categoryDetailNo - 상세 카테고리 No
	 * @return - 상세 카테고리 이름
	 */
	public String selectCategoryDetailName(int categoryDetailNo);
}
