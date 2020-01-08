package com.KHCafeErp.www.service.face;

import java.io.File;
import java.util.List;

import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.OrderProduct;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.util.Paging;

public interface OrderService {

	/**
	 * 20-01-02 유진
	 * 주문 등록
	 * @param destFile - 업로드한 엑셀 파일
	 */
	public void insertMassiveProduct(File destFile);
	/**
	 * 20-01-02 병주
	 * 주문 목록에 나타낼 발주 조회
	 * @return - 주문 목록
	 */
	public List getOrderList(OrderBase orderBase);

//	public Paging getPaging(int curPage, OrderBase orderBase);
	

	public List<Shop> getShopList();
	
	public List<OrderProduct> selectorderProduct(OrderBase orderBase);
	

	public List<Product> selectProduct(OrderProduct orderproduct);
	

	
	public List<OrderBase> getList();


}
