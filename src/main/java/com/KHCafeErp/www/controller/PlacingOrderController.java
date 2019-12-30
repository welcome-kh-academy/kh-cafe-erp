package com.KHCafeErp.www.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.service.face.PlacingOrderService;

@Controller
public class PlacingOrderController {

	private static final Logger logger = LoggerFactory.getLogger(PlacingOrderController.class);
	@Autowired PlacingOrderService placingOrderService;
	
	@RequestMapping(value="placingOrder/registration", method=RequestMethod.GET)
	public void placingOrderAdd() {
		logger.info("발주등록 페이지");
	}
	
	@RequestMapping(value="placingOrder/management", method=RequestMethod.GET)
	public void placingOrderMain() {
		
		logger.info("발주관리 페이지");
	}
	
	@RequestMapping(value="/placingOrder/management", method=RequestMethod.POST)
	public void placingOrderSearch(PlacingOrder placingOrder) {
		
		logger.info(placingOrder.toString());
		logger.info("발주관리 페이지");
	}	
}
