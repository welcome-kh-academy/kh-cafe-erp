package com.KHCafeErp.www.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.FindIdPwService;
import com.KHCafeErp.www.util.email.Email;
import com.KHCafeErp.www.util.email.EmailSender;

@Controller
public class FindIdPwController {
	@Autowired FindIdPwService findidpwservice;

	private static final Logger logger = LoggerFactory.getLogger(FindIdPwController.class);

	@RequestMapping(value="/findinfo/findinfo" ,method=RequestMethod.GET)
	public void findId() {
//		logger.info("xxfxf");
		
	}
	
	@RequestMapping(value="/findinfo/findinfo" ,method=RequestMethod.POST)
	public String findidresult(Staff staff,Model model) {
//		logger.info("xxfxf222222");
		Staff findid = findidpwservice.findid(staff);

		if( findid != null ) {
			int id = findid.getStaffNo();
			model.addAttribute("id" ,id);
			return "/findinfo/findidsuccess";

		}else 
			return "/findinfo/findidfail";

	}

//	@Autowired
//	private EmailSender mailsender;
//	
//	@Autowired
//	private Email email;

//	@RequestMapping(value = "/findinfo/findinfo", method = RequestMethod.GET)
//	@ResponseBody
//	public String passwordSearch(int staffNo,
//			String user_email,
//			HttpServletRequest request) {
//
//		mailsender.mailSendWithPassword(staffNo, user_email, request);
//
//		return "/findinfo/findidfail";
//	}


}


