package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.OrderProduct;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.util.Paging;

public interface OrderDao {

	/**
	 * 19-12-31 유진
	 * 주문 엑셀 업로드
	 * @param order - 주문 정보
	 */
	public void insertOrderBase(OrderBase order);

	public int selectOrderNo(OrderBase orderBase);

	public void insertOrderProduct(OrderProduct orderProduct);

	public  List<Release> selectOrderList(Paging paging); 

	public int selectOrderListCnt(OrderBase orderBase);

}
