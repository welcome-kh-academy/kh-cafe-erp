package com.KHCafeErp.www.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.LoginService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/login/main")
	public void login() {
		
	}
	
	@RequestMapping(value="/login/main2")
	public void login2() {
		
//		logger.info("로그인~");
		
	}
	
	@RequestMapping(value="/login/check")
	public String loginMain(
//			Staff staff,
			HttpSession session, 
			Model model) {
		
		Staff staff = (Staff)SecurityContextHolder.getContext().getAuthentication().getDetails();
		
		
		logger.info("로그인 실행"+staff.toString());
		//CustomAuthenticationProvider에서 set한 값을 로드

		boolean isLogin = loginService.loginCheck(staff);
		
		if(isLogin) {
			staff = loginService.selectByStaffNo(staff);
			
			
			session.setAttribute("login", isLogin);
			session.setAttribute("staffNo", staff.getStaffNo());
			session.setAttribute("nick", staff.getNick());
			
			// 19-12-31 유진 : 직원 등급 확인
			session.setAttribute("position", loginService.getPosition(staff));
			
//			SecurityContextHolder.getContext().setAuthentication((Authentication) loginService.getPosition(staff));
			return "redirect:/dashboard/index";
		} else {
			model.addAttribute("login", false);
			return "redirect:/login/logout";
		}
		
		
	}
	
	@RequestMapping(value="/login/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login/main";
	}

}
