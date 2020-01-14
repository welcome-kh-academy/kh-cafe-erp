package com.KHCafeErp.www.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.AddProductService;
import com.KHCafeErp.www.service.face.ManageProductService;
import com.KHCafeErp.www.service.face.StatisticsService;
import com.KHCafeErp.www.util.DateTerm;

@Controller
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);

	@Autowired private StatisticsService statisticsService;
	@Autowired private AddProductService addProductService;
	@Autowired private ManageProductService manageProductService;
	
	@RequestMapping(value = "/statistics/sales", method=RequestMethod.GET)
	public void salesStatistics(Model model, HttpSession session) {	

		//본사일 경우 지점리스트 볼 수 있게
		if((int)session.getAttribute("position") == 3) {
			
			//본사 코드 불러오기
			Shop shop = manageProductService.getShopName((int)session.getAttribute("shopNo"));
			model.addAttribute("shop", shop);
			
			List<Shop> shopList = addProductService.getShopList();
			model.addAttribute("shopList", shopList);
		}
		
		model.addAttribute("position",session.getAttribute("position"));
	}
	
	@RequestMapping(value = "/statistics/salesSearch", method=RequestMethod.GET)
	public ModelAndView salesSearchStatistics(HttpSession session, ModelAndView mav, DateTerm dateTerm, @RequestParam(value="shopNoArr[]", required=false) int[] shopNoArr) {	
		
		List<Map> dailyStatisticsList = new ArrayList<Map>();
		
//		본사일 경우 지점리스트 볼 수 있게
		if(shopNoArr != null)
			dailyStatisticsList = statisticsService.getStatistics(shopNoArr, dateTerm);
			
		else {
			int shopNo = (int)session.getAttribute("shopNo");
			dailyStatisticsList = statisticsService.getStatistics(shopNo);
		}
		
		//빈 해쉬맵
		HashMap<Integer, ArrayList<Map>> newMap = new HashMap<Integer, ArrayList<Map>>();
		
		//지점별 리스트로 변경
		for(int i=0; i<dailyStatisticsList.size(); i++) {
			
			String strKey = dailyStatisticsList.get(i).get("SHOPNO")+"";
			int key = Integer.parseInt(strKey);
		
			ArrayList list = new ArrayList();
			
			if (newMap.containsKey(key)) {
				
                // 이미 해당 key가 맵에 있을 때에는 value를 불러온 뒤 넣음
                list = newMap.get(key);
                list.add(dailyStatisticsList.get(i));
            } else {
            	
                // 맵에 key가 없다면 새로 value를 추가
                list.add(dailyStatisticsList.get(i));
            }
            newMap.put(key, list);
            
		}
		
		logger.info(newMap.toString());
		
		Map monthlyStatisticsMap = statisticsService.getStatistics(newMap);
//		List<Map> weeklyStatisticsMap = statisticsService.getStatistics(weeklyStatisticsMap);
		
		mav.addObject("dailyStatistics",newMap);
		mav.addObject("monthlyStatistics",monthlyStatisticsMap);
		mav.setViewName("jsonView");
		
		return mav;

	}
}
