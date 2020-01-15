package com.KHCafeErp.www.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.service.face.DashboardService;
import com.KHCafeErp.www.service.face.StatisticsService;

@Controller
public class DashboardController {

	private static Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@Autowired DashboardService dashboardService; 
	@Autowired StatisticsService statisticsService;
	
	@RequestMapping(value="/dashboard/index")
	public void getPage(HttpSession session, HttpServletRequest req, Model model) {
			logger.info("대쉬보드 접속");
			
			List<NoticeBoard> noticeList = dashboardService.getNoticeList();
			System.out.println(noticeList);
			
			model.addAttribute("notice", noticeList);
	}
	
	@RequestMapping(value="/dashboard/barChart", method=RequestMethod.GET)
	public ModelAndView getBarChart(HttpSession session, ModelAndView mav) {
		
		int shopNo = (int) session.getAttribute("shopNo");
		
		List<Map> barChart = statisticsService.getWeekSalesStatistics(shopNo);
		mav.addObject("barChart", barChart);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/dashboard/pieChart", method=RequestMethod.GET)
	public ModelAndView getPieChart(HttpSession session, ModelAndView mav) {
		
		int shopNo = (int) session.getAttribute("shopNo");
		
		List<Map> pieChart = statisticsService.getBest3SalesStatistics(shopNo);
		mav.addObject("pieChart", pieChart);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
