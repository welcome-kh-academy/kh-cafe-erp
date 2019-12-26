package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.ProductOption;
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
	public List<ProductOption> selectOption();


}
