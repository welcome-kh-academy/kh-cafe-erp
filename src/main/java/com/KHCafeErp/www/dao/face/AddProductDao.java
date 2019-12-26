package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.ProductOption;

public interface AddProductDao {

	/**
	 * 19-12-24 유진
	 * 상품 옵션 조회
	 * @return - Option 리스트
	 */
	public List<ProductOption> selectOption(int categoryNo);

	public int selectProductOptionNo(int categoryNo);


}
