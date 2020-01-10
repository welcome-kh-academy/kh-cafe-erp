package com.KHCafeErp.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(AddProductContrller.class);

	@RequestMapping(value = "/statistics/sales", method=RequestMethod.GET)
	public void salesStatistics() {	}
}
