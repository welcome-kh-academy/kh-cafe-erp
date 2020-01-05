package com.KHCafeErp.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.LoginService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/login/main")
	public void login() {
		
//		logger.info("로그인~");
		
	}
	
	@RequestMapping(value="/login/main2")
	public void login2() {
		
//		logger.info("로그인~");
		
	}
	
	@RequestMapping(value="/login/check")
	public String loginMain(Staff staff, HttpSession session, Model model) {
		
		logger.info(staff.toString());
		
		boolean isLogin = loginService.loginCheck(staff);
		
		if(isLogin) {
			staff = loginService.selectByStaffNo(staff);
			session.setAttribute("login", isLogin);
			session.setAttribute("staffNo", staff.getStaffNo());
			session.setAttribute("nick", staff.getNick());
			
			// 19-12-31 유진 : 직원 등급 확인
			session.setAttribute("position", loginService.getPosition(staff));
			
			return "redirect:/dashboard/index";
		} else {
			model.addAttribute("login", false);
		}
		
		return "redirect:/login/main";
		
		
	}
	
	@RequestMapping(value="/login/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login/main";
	}

}
