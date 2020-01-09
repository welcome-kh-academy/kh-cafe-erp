package com.KHCafeErp.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {

	private static Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@RequestMapping(value="/dashboard/index")
	public void getPage(HttpSession session, HttpServletRequest req) {
			logger.info("대쉬보드 접속");
	}
}
