package com.KHCafeErp.www.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.LoginDao;
import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	@Autowired LoginDao loginDao;
	
	@Override
	public Staff selectByStaffNo(Staff staff) {
		return loginDao.selectByStaffNo(staff);
	}

	@Override
	public boolean loginCheck(Staff staff) {
		
		int cnt = 0;
		
		cnt = loginDao.cntAccount(staff);
		if(cnt>=1) {
			return true; //직원임
		} else {
			return false; //직원이 아니거나 오류
		}
	}

	@Override
	public Object getPosition(Staff staff) {
		return loginDao.getPosition(staff);
	}
}
