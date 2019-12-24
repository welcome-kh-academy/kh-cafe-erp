package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.ProductOption;

public interface AddProductService {

	/**
	 * 등록되어 있는 Option 조회
	 * @return - Option 리스트
	 */
	public List<ProductOption> selectOption();

}
