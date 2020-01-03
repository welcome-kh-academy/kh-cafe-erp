package com.KHCafeErp.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("+ + + 인터셉터 시작 + + +");
		
		HttpSession session = request.getSession();
		logger.info(request.getRequestURI());
		if(session.getAttribute("staffNo")==null) {
			logger.info("접속 불가 : 비 로그인 상태");
			response.sendRedirect("/login/main");
			return false;
		}
		logger.info("정상접근");
		return true;
	}

}
