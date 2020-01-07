package com.KHCafeErp.www.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.WarehousingDao;
import com.KHCafeErp.www.dto.Warehousing;
import com.KHCafeErp.www.service.face.WarehousingService;

@Service
public class WarehousingServiceImpl implements WarehousingService{
	
	@Autowired private WarehousingDao warehousingDao;
	
	@Override
	public void registration(Warehousing warehousing) {
		
		warehousingDao.insert(warehousing);
		
	}

}
