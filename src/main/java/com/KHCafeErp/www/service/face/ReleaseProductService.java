package com.KHCafeErp.www.service.face;

import java.io.File;
import java.util.List;

import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.util.Paging;

public interface ReleaseProductService {

	/**
	 * 19-12-31 유진
	 * 엑셀 파일 받아오기
	 * @param destFile - 업로드한 엑셀 파일
	 */
	public void insertMassiveProduct(File destFile);

	/**
	 * 20-01-01 유진
	 * 발주 목록에 나타낼 발주 조회
	 * @return - 발주 목록
	 */
	public List<Release> getReleaseList(Paging paging);

	public Paging getPaging(int curPage, Release release);

}
