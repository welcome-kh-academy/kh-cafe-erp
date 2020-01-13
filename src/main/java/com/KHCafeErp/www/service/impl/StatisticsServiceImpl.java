package com.KHCafeErp.www.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.StatisticsDao;
import com.KHCafeErp.www.service.face.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired StatisticsDao statisticsDao;
	
	@Override
	public List<Map<String, Integer>> getStatistics(int shopNo) {

		return statisticsDao.selectStatistics(shopNo);
	}
}
