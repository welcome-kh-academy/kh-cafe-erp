package com.KHCafeErp.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.service.face.PlacingOrderService;

@Controller
public class PlacingOrderController {

	private static final Logger logger = LoggerFactory.getLogger(ManageProductController.class);
	@Autowired PlacingOrderService placingOrderService;
	
	@RequestMapping(value="placingOrder/registration", method=RequestMethod.GET)
	public void addPlacingOrder() {
		logger.info("발주등록 페이지");
	}
	
	@RequestMapping(value="placingOrder/management", method=RequestMethod.GET)
	public void placingOrderList() {
		logger.info("발주관리 페이지");
	}
}
