package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.ProductOption;

public interface AddProductService {

	/**
	 * 상품 옵션 목록 조회
	 * @param categoryNo
	 * @return
	 */
	public List<ProductOption> selectOption(int categoryNo);

	public int getProductOptionNo(int categoryNo);

}
