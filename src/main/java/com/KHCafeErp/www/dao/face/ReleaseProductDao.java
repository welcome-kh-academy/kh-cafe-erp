package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.ReleaseProduct;
import com.KHCafeErp.www.util.Paging;

public interface ReleaseProductDao {
	
	/**
	 * 19-12-31 유진
	 * 출고 정보 넣기
	 * @param releaseProduct - 출고된 상품 정보
	 */
	public void insertRelease(Release release);

	/**
	 * 20-01-01 유진
	 * 발주 목록 조회
	 * @return - 발주 목록
	 */
	public List<Release> selectReleaseList(Paging paging);

	public int selectReleaseListCnt(Release release);

	public void insertReleaseProduct(ReleaseProduct releaseProduct);

	public int selectOrderNo(Release release);
}
