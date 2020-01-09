package com.KHCafeErp.www.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.LoginService;

@Component
public class CustomAuthenticationProvider  implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

	@Autowired LoginService loginService;
	@Autowired private HttpServletRequest req;
	
	@Override
	public Authentication authenticate(Authentication authentication)

			throws AuthenticationException {

        String user_id = (String)authentication.getPrincipal();
        String user_pw = (String)authentication.getCredentials();
        Staff staff = new Staff();
        // Form에서 전달 된, name 태그 설정이 username-parameter, password-parameter로 되있는 값을 읽어온다

        
//        logger.info(req.getParameter("shopNo"));
        
        //fail로 로그인 시 null 반환 > loginFail 테스트
        logger.info("로그인 실행 id :"+user_id+" pw :"+user_pw);
        staff.setStaffNo(Integer.parseInt(user_id));
        staff.setPw(user_pw);
        boolean isLogin = loginService.loginCheckSecu(staff);

		if(isLogin) {
        	staff = loginService.selectByStaffNo(staff);
			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();

	        roles.add(new SimpleGrantedAuthority(Integer.toString(staff.getPosition())));

	        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, roles);

	        result.setDetails(staff);
	        logger.info("직위 : "+roles.toString());
	        //user session 생성 후 반환

			return result;
			
		} 
		else {
			return null;
		}
	

        

	}



	@Override
	public boolean supports(Class<?> authentication) {

		 return authentication.equals(UsernamePasswordAuthenticationToken.class);

	}
}
