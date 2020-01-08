package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.controller.WarehousingController;
import com.KHCafeErp.www.dao.face.WarehousingDao;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Warehousing;
import com.KHCafeErp.www.service.face.WarehousingService;

@Service
public class WarehousingServiceImpl implements WarehousingService{
	
	@Autowired private WarehousingDao warehousingDao;
	private static final Logger logger = LoggerFactory.getLogger(WarehousingServiceImpl.class);	

	@Override
	public void registration(Warehousing warehousing) {
		
		warehousingDao.insert(warehousing);
		
	}

	@Override
	public List<Warehousing> getWareHousingList(Warehousing wareHousing) {
		logger.info("검색 조건 : "+wareHousing.toString());
		if(wareHousing.getStartDate() == null) {
			wareHousing.setInStockStatus(-1);
			wareHousing.setStorageNo(-1);
		}
		List<Warehousing> warehousingList = warehousingDao.selectWarehousingList(wareHousing);
		
		return warehousingList;
	}

	@Override
	public List<Warehousing> getdealList() {
		List<Warehousing> dealList = warehousingDao.selectDealList();
		logger.info(dealList.toString());
		return dealList;
	}

	@Override
	public List<Warehousing> getdwareHouseList() {
		List<Warehousing> wareHouseList = warehousingDao.selectWareHouseList();
		return wareHouseList;
	}

	@Override
	public List<Warehousing> getList() {
		// TODO Auto-generated method stub
		return warehousingDao.selectWareHouseListAll();
	}

}
