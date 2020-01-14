package com.KHCafeErp.www.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.controller.StatisticsController;
import com.KHCafeErp.www.dao.face.StatisticsDao;
import com.KHCafeErp.www.service.face.StatisticsService;
import com.KHCafeErp.www.util.DateTerm;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsServiceImpl.class);
	
	@Autowired StatisticsDao statisticsDao;
	
	@Override
	public List<Map> getStatistics(int shopNo) {

		return statisticsDao.selectStatistics(shopNo);
	}

	@Override
	public List<Map> getStatistics(List<Map> dailyStatisticsMap) {
		
		//빈 맵 생성
		Map monthlyStatisticsMap = new HashMap<>();
		
		//빈 리스트 생성
		List<Map> monthlyStatistics = new ArrayList<Map>();
		
		int sumPrice = 0;
		
		//일별 매출통계를 월별로 바꾸기
		for(int i=0; i<dailyStatisticsMap.size(); i++) {
			
			String month = ((String) dailyStatisticsMap.get(i).get("PAYMENTDATE")).substring(0, 7);
			
			monthlyStatisticsMap.put("PAYMENTDATE",month);
			
			String sumPriceStr = dailyStatisticsMap.get(i).get("SUMPRICE")+"";
			
			if(i==0) {
				sumPrice = Integer.parseInt(sumPriceStr);
				monthlyStatisticsMap.put("SUMPRICE", sumPrice);
				monthlyStatistics.add(monthlyStatisticsMap);
			}
			else if(((String)dailyStatisticsMap.get(i-1).get("PAYMENTDATE")).substring(0, 7).equals(month)) {
				sumPrice += Integer.parseInt(sumPriceStr);
				monthlyStatisticsMap.put("SUMPRICE", sumPrice);
			} else {
				sumPrice = Integer.parseInt(sumPriceStr);
				monthlyStatisticsMap.put("SUMPRICE", sumPrice);
				monthlyStatistics.add(monthlyStatisticsMap);
			}

		}
		
		return monthlyStatistics;
	}

	@Override
	public List<Map> getStatistics(int[] shopNoArr, DateTerm dateTerm) {

		Map map = new HashMap();
		map.put("shopNo", shopNoArr);
		map.put("startDate", dateTerm.getStartDate());
		map.put("endDate", dateTerm.getEndDate());
		
		return statisticsDao.selectStatisticsCondition(map);
	}
}
