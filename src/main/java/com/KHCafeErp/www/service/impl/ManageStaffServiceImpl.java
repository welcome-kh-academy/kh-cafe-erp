package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.ManageStaffDao;
import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.ManageStaffService;


@Service
public class ManageStaffServiceImpl implements ManageStaffService{
@Autowired ManageStaffDao manageStaffDao;
	@Override
	public List<Staff> getStaffList(Staff staff) {
		// TODO Auto-generated method stub
		return manageStaffDao.getStaffList();
	}

}
