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
	public Map getStatistics(HashMap<Integer, ArrayList<Map>> dailyStatisticsMap) {
		
		//빈 맵 생성
		Map monthlyStatisticsMap = new HashMap<>();
		
		Iterator<Integer> keys = dailyStatisticsMap.keySet().iterator();
		while ( keys.hasNext() ) {
			
			//지점번호
		    Integer key = keys.next();
		    
		    //지점번호에 해당하는 통계 자료 리스트 불러오기
			List dailyStatistics = dailyStatisticsMap.get(key);
		    List monthlyStatistics = new ArrayList();
		    
		    int sumPrice = 0;
		    Map monthMap = new HashMap();
		    
		    for(int i=0; i<dailyStatistics.size(); i++) {
				
				Map dailyMap = (Map) dailyStatistics.get(i);
				
				String month = ((String) dailyMap.get("PAYMENTDATE")).substring(0, 7);
				
				monthMap.put("PAYMENTDATE",month);
				String sumPriceStr = dailyMap.get("SUMPRICE")+"";
				
				if(i==0) {
					sumPrice = Integer.parseInt(sumPriceStr);
					monthMap.put("SUMPRICE", sumPrice);
					monthlyStatistics.add(monthMap);
				} else if(((String)dailyMap.get("PAYMENTDATE")).substring(0, 7).equals(month)) {
					sumPrice += Integer.parseInt(sumPriceStr);
					monthMap.put("SUMPRICE", sumPrice);
					
				} else {
					sumPrice = Integer.parseInt(sumPriceStr);
					monthMap.put("SUMPRICE", sumPrice);
					monthlyStatistics.add(monthMap);
				}
				
			}
		    
			monthlyStatisticsMap.put(key,monthlyStatistics);
		    
		}   

		return monthlyStatisticsMap;
	}

	@Override
	public List<Map> getStatistics(int[] shopNoArr, DateTerm dateTerm) {

		Map<String, Object> map = new HashMap<>(); 
		
		map.put("shopNoArr", shopNoArr);
		map.put("startDate", dateTerm.getStartDate());
		map.put("endDate", dateTerm.getEndDate());
		
		return statisticsDao.selectStatisticsCondition(map);
	}

	@Override
	public List<Map> getWeekSalesStatistics(int shopNo) {
		
		return statisticsDao.selectWeekStatistics(shopNo);
	}

	@Override
	public List<Map> getBest3SalesStatistics(int shopNo) {
		return statisticsDao.selectBestPrd3Statistics(shopNo);
	}
}
