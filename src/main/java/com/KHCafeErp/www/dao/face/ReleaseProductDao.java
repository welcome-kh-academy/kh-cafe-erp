package com.KHCafeErp.www.dao.face;

import com.KHCafeErp.www.dto.ReleaseProduct;

public interface ReleaseProductDao {
	
	/**
	 * 19-12-31 유진
	 * 출고 정보 넣기
	 * @param releaseProduct - 출고된 상품 정보
	 */
	public void insertRelease(ReleaseProduct releaseProduct);
}
