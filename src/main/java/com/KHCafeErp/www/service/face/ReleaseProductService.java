package com.KHCafeErp.www.service.face;

import java.io.File;

public interface ReleaseProductService {

	/**
	 * 19-12-31 유진
	 * 엑셀 파일 받아오기
	 * @param destFile - 업로드한 엑셀 파일
	 */
	public void insertMassiveProduct(File destFile);

}
