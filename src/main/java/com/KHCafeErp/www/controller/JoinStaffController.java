package com.KHCafeErp.www.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
		
		return "redirect:/dashboard/main";
	}
	
}
