package com.KHCafeErp.www.service.face;

import java.io.File;

public interface OrderService {

	/**
	 * 주문 등록
	 * @param destFile - 업로드한 엑셀 파일
	 */
	public void insertMassiveProduct(File destFile);

}
