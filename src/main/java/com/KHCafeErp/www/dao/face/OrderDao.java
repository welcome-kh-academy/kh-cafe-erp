package com.KHCafeErp.www.dao.face;

import com.KHCafeErp.www.dto.Order;

public interface OrderDao {

	/**
	 * 19-12-31 유진
	 * 주문 엑셀 업로드
	 * @param order - 주문 정보
	 */
	public void insertOrder(Order order);

}