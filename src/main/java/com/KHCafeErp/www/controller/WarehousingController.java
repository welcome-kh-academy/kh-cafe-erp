package com.KHCafeErp.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KHCafeErp.www.service.face.WarehousingService;

@Controller
public class WarehousingController {

	private static final Logger logger = LoggerFactory.getLogger(WarehousingController.class);	
	
	@Autowired private WarehousingService warehousingService;
	
	@RequestMapping(value="/warehousing/registration")
	public void registration() { }
	
}
