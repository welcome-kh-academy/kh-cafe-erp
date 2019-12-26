package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.Option;
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
	public List<Option> selectOption(int categoryNo);

	/**
	 * 12-12-26 현석
	 * 카테고리 목록 불러오기
	 * @return - List<CategoryBase> 카테고리 목록
	 */
	public List<CategoryBase> selectCategoryList();

	public void insertOption(Option option);


}
