package com.KHCafeErp.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.service.face.DashboardService;

@Controller
public class DashboardController {

	private static Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@Autowired DashboardService dashboardService; 
	
	@RequestMapping(value="/dashboard/index")
	public void getPage(HttpSession session, HttpServletRequest req, Model model) {
			logger.info("대쉬보드 접속");
			
			List<NoticeBoard> noticeList = dashboardService.getNoticeList();
			System.out.println(noticeList);
			
			model.addAttribute("notice", noticeList);
	}
}
