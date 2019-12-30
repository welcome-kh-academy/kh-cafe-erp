package com.KHCafeErp.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.FindIdPwService;

@Controller
public class FindIdPwController {
	@Autowired FindIdPwService findidpwservice;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value="/findinfo/findinfo" ,method=RequestMethod.GET)
	public void findId() {
		//		logger.info("�뀒�뒪�듃");
	}
	@RequestMapping(value="/findinfo/findinfo" ,method=RequestMethod.POST)
	public String findIdResult(Staff staff,Model model) {
		//		logger.info("�뀒�뒪�듃");

		Staff findid = findidpwservice.findid(staff);

		if( findid != null ) {
			int id = findid.getStaffNo();
			model.addAttribute("id" ,id);
			return "/findinfo/findidsuccess";

		}else 
			return "/findinfo/findidfail";

	}
//	// 비밀번호 찾기
//	@RequestMapping(value = "/findinfo/findinfo", method = RequestMethod.GET)
//	@ResponseBody
//	public String passwordSearch(@RequestParam("userId")int staffNo,
//			@RequestParam("userEmail")String email,
//			HttpServletRequest request) {
//
//		MailSender.mailSendWithPassword(staffNo, email, request);
//		
//		return "/findinfo/findinfo";
//	}



}
