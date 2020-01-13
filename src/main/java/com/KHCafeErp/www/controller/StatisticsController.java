package com.KHCafeErp.www.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.StatisticsService;
import com.KHCafeErp.www.util.DateTerm;

@Controller
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);

	@Autowired private StatisticsService statisticsService;
	
	@RequestMapping(value = "/statistics/sales", method=RequestMethod.GET)
	public void salesStatistics(HttpSession session, Model model) {	

	}
	
	@RequestMapping(value = "/statistics/salesSearch", method=RequestMethod.GET)
	public ModelAndView salesSearchStatistics(HttpSession session, ModelAndView mav) {	
		
		int shopNo = (int)session.getAttribute("shopNo");
		List<Map<String, Integer>> map = statisticsService.getStatistics(shopNo);
		
		logger.info(map.toString());
		
		mav.addObject("dailyStatistics",map);
		mav.setViewName("jsonView");
		
		return mav;

	}
	
}
