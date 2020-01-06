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

	/**
	 * 20-01-03 유진
	 * orderNo 조회하기
	 * @param orderBase 엑셀에서 받아온 orderBase 정보
	 * @return - orderNo
	 */
	public int selectOrderNo(OrderBase orderBase);

	/**
	 * 20-01-03 유진
	 * 엑셀 업로드
	 * @param orderProduct - 주문 상세 정보
	 */
	public void insertOrderProduct(OrderProduct orderProduct);

	public  List<OrderBase> selectOrderList(Paging paging); 

	public int selectOrderListCnt(OrderBase orderBase);

}
