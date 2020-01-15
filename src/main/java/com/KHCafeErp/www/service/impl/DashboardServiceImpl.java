package com.KHCafeErp.www.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.DashboardDao;
import com.KHCafeErp.www.service.face.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired DashboardDao dashboardDao; 
	
}
