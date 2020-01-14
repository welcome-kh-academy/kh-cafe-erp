package com.KHCafeErp.www.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.FindIdPwService;

@Controller
public class FindIdPwController {
	@Autowired FindIdPwService findidpwservice;
	
	private static final Logger logger = LoggerFactory.getLogger(FindIdPwController.class);

	@RequestMapping(value="/findinfo/findinfo" ,method=RequestMethod.GET)
	public void findId() {
//		logger.info("xxfxf");
		
	}
	
	@RequestMapping(value="/findinfo/findinfo" ,method=RequestMethod.POST)
	public String findIdResult(Staff staff,Model model) {
//		logger.info("xxfxf222222");
		Staff findid = findidpwservice.findid(staff);

		if( findid != null ) {
			int id = findid.getStaffNo();
			model.addAttribute("id" ,id);
			return "/findinfo/findidsuccess";

		}else 
			return "/findinfo/findidfail";

		
	}
	
	
	@Autowired
	private JavaMailSender mailsender;
	
	@RequestMapping(value="/findinfo/findpwinfo" ,method=RequestMethod.GET)
	public void findPw() {

		
	}


	@RequestMapping(value = "/findinfo/findpwinfo", method = RequestMethod.POST)
	public String findpwResult(HttpServletRequest request, HttpServletResponse response, Staff staff) {
		String email = (String)request.getParameter("email");
		String staffNoStr = (String)request.getParameter("staffNo");
		Staff pw = findidpwservice.getPw(staff); 
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out;
		int staffNo = Integer.parseInt(staffNoStr);
	
		if(pw!=null) {
			try {	
				//인증 메일 보내기 메서드
				findidpwservice.mailSendWithfindPwKey(email, staffNo, request,staff);
				
				out = response.getWriter();
				out.println("<script>alert('입력하신 이메일로 임시 비밀번호가 전송되었습니다.')</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/login/main";
		}   else {
			
			return "/findinfo/findidfail";
		}
	
	
		
		
		
		
	}


}


