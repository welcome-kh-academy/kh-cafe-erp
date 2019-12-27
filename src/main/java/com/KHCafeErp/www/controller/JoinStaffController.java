package com.KHCafeErp.www.controller;



import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.JoinStaffService;



@Controller
public class JoinStaffController {
	
	@Autowired private JoinStaffService joinstaffService;
	
	private static final Logger logger = LoggerFactory.getLogger(JoinStaffController.class);
	

	
	//회원가입페이지
	@RequestMapping(value="/join/join", method=RequestMethod.GET)
	public String join() { 
		
		logger.info("회원가입접속확인");
		return "join/join";		
	}
	
	//회원가입 폼 작성 처리
	@RequestMapping(value="/join/join", method=RequestMethod.POST)
	public String joinProcess(Staff staff) { 
		
		logger.info(staff.toString());
		
		//회원가입 처리
		joinstaffService.join(staff);		
		
		return "redirect:/dashboard/index";
	}
	
	//id 중복 처리 
	@RequestMapping(value="/join/idcheck", method=RequestMethod.GET)
	public ModelAndView idCheck( @RequestParam(value="staffNo") int staffNo, ModelAndView mav) { 
		
//		logger.info("id 중복 체크");
//		String id = request.getParameter("id");
		int check = joinstaffService.idCheck(staffNo);
		
		logger.info("idcheck " + check);
		mav.addObject("check", check);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//nick 중복 확인
	@RequestMapping(value="/join/nickcheck", method=RequestMethod.GET)
	@ResponseBody
	public String nickCheck(HttpServletRequest request) { 
		
		logger.info("nick 중복 체크");
		String nick = request.getParameter("nick");
		int result = joinstaffService.nickCheck(nick);
		logger.info("nickcheck" + result);
		return Integer.toString(result);
	}
	
	
	
}
