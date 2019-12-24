package com.KHCafeErp.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {

	private static Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@RequestMapping(value="/dashboard/index")
	public void getPage() {
		
		logger.info("대시보드 ");
	}
}
