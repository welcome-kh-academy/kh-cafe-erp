package com.KHCafeErp.www.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.JoinStaffDao;
import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.JoinStaffService;

@Service
public class JoinStaffServiceImpl implements JoinStaffService {

	@Autowired private JoinStaffDao joinstaffDao;
	
	@Override
	public void join(Staff staff) {
		// TODO Auto-generated method stub
		joinstaffDao.insert(staff);
	}


	
}
