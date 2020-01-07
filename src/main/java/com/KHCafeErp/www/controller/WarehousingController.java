package com.KHCafeErp.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.Warehousing;
import com.KHCafeErp.www.service.face.WarehousingService;

@Controller
public class WarehousingController {

	private static final Logger logger = LoggerFactory.getLogger(WarehousingController.class);	
	
	@Autowired private WarehousingService warehousingService;
	
	//입고 등록 페이지
	@RequestMapping(value="/warehousing/registration")
	public String registration() {
		
		logger.info("입고 등록 페이지 확인");
		
		return "warehousing/registration";
	}
	
	@RequestMapping(value="/warehousing/registration", method = RequestMethod.POST)
	public String registrationProcess(Warehousing warehousing) {
		
		logger.info("입고 처리 페이지 확인");
		
		warehousingService.registration(warehousing);
		
		return "redirect:/warehousing/registration";
	}
	
}
