package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.ProductOption;

public interface AddProductService {

	/**
	 * 19-12-24 유진
	 * 상품 옵션 조회
	 * @return - Option 리스트
	 */
	public List<ProductOption> selectOption();

	/**
	 * 19-12-26 현석
	 * 카테고리 목록 가져오기
	 * @return - Category 리스트
	 */
	public List<CategoryBase> getCategoryList();
	
}
