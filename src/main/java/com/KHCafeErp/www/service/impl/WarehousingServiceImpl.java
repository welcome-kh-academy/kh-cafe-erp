package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.controller.WarehousingController;
import com.KHCafeErp.www.dao.face.WarehousingDao;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.ReleaseProduct;
import com.KHCafeErp.www.dto.Warehousing;
import com.KHCafeErp.www.service.face.WarehousingService;
import com.KHCafeErp.www.util.ExcelRead;
import com.KHCafeErp.www.util.ReadOption;

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

	@Override
	public void insertMassiveProduct(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		
		for(Map<String, String> article : excelContent){
		   
			Warehousing warehousing = new Warehousing();

			warehousing.setPlacingOrderProductNo((int)Float.parseFloat(article.get("A")));
			warehousing.setStorageNo((int)Float.parseFloat(article.get("B")));
			warehousing.setProductCnt((int)Float.parseFloat(article.get("C")));
			warehousing.setInStockDate(article.get("D"));
			if(article.get("E").equals("비정규")) {
				warehousing.setIsAutoInStock(0);				
			} else if(article.get("C").equals("정규")) {
				warehousing.setIsAutoInStock(1);												
			} else {							
				warehousing.setIsAutoInStock(-1);												
			}
			if(article.get("F").equals("입고대기")) {
				warehousing.setIsAutoInStock(0);				
			} else if(article.get("F").equals("입고완료")) {
				warehousing.setIsAutoInStock(1);												
			} else {							
				warehousing.setIsAutoInStock(-1);												
			}
			warehousing.setDealStore(article.get("G"));
			
			System.out.println(warehousing);
			warehousingDao.insertWarehousing(warehousing);
			
		  }
		System.out.println(excelContent);
	}

}
