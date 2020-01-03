package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.PlacingOrderDao;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.PlacingOrderService;
import com.KHCafeErp.www.util.Paging;

@Service
public class PlacingOrderServiceImpl implements PlacingOrderService {

	private static final Logger logger = LoggerFactory.getLogger(PlacingOrderServiceImpl.class);
	
	@Autowired PlacingOrderDao placingOrderDao;
	
	@Override
	public Paging getPaging(int curPage, PlacingOrder placingOrder) {

		int totalCount = placingOrderDao.selectPlacingOrderListCnt(placingOrder);
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

//	@Override
//	public List<PlacingOrder> getPlacingOrderList(Paging paging) {
//
//		List<PlacingOrder> placingOrderList = placingOrderDao.selectPlacingOrderList(paging);
//		return placingOrderList;
//	}

	@Override
	public List<PlacingOrder> getPlacingOrderList(PlacingOrder placingOrder) {
		List<PlacingOrder> placingOrderList = placingOrderDao.selectPlacingOrderList(placingOrder);
		return placingOrderList;
	}
	
	@Override
	public List<Shop> getShopList() {
		
		List<Shop> shopList = placingOrderDao.selectShopList();
		return shopList;
	}

}
