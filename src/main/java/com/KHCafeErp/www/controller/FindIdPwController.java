package com.KHCafeErp.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.FindIdPwService;

@Controller
public class FindIdPwController {
	@Autowired FindIdPwService findidpwservice;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value="/findinfo/findidinfo" ,method=RequestMethod.GET)
	public void findId() {
		//		logger.info("테스트");
	}
	@RequestMapping(value="/findinfo/findidinfo" ,method=RequestMethod.POST)
	public String findIdResult(Staff staff,Model model) {
		//		logger.info("테스트");

		Staff findid = findidpwservice.findid(staff);

		if( findid != null ) {
			int id = findid.getStaffNo();
			model.addAttribute("id" ,id);
			return "/findinfo/findidsuccess";

		}else 
			return "/findinfo/findidfail";

	}
	@RequestMapping(value="/findinfo/findpwinfo" ,method=RequestMethod.GET)
	public void findPw() {
		//		logger.info("테스트");
	}
	@RequestMapping(value="/findinfo/findpwinfo" ,method=RequestMethod.POST)
	public String findPwResult(Staff staff,Model model) {
		//		logger.info("테스트");

		Staff findid = findidpwservice.findid(staff);

		if( findid != null ) {
			int id = findid.getStaffNo();
			model.addAttribute("id" ,id);
			return "/findinfo/findidsuccess";

		}else 
			return "/findinfo/findidfail";

	}

}
