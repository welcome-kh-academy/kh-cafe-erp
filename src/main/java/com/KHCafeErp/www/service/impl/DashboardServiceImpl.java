package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.DashboardDao;
import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.service.face.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired DashboardDao dashboardDao;

	@Override
	public List<NoticeBoard> getNoticeList() {
		return dashboardDao.getNoticeList();
	} 
	
}
