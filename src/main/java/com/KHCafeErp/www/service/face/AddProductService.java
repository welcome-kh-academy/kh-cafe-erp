package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.ProductOption;
import com.KHCafeErp.www.dto.Shop;

public interface AddProductService {
	
	/**
	 * 19-12-26 동산
	 * 지점들의 목록을 불러온다
	 * @return - 지점 목록
	 */
	public List<Shop> getShopList();

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
	
	/**
	 * 19-12-26 현석
	 * 상품명으로 카테고리 불러오기
	 * @param product
	 * @return Category
	 */
	public CategoryBase getCategory(Product product);
	
}
