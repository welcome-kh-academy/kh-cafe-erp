package com.KHCafeErp.www.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.FindIdPwDao;
import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.FindIdPwService;

@Service
public class FindIdPwServiceImpl implements FindIdPwService{

	
	@Autowired 
				FindIdPwDao findidpwDao;
	          
	
	@Override
	public Staff findid(Staff staff) {
		
		Staff findidResult =findidpwDao.findid(staff);
		
		return findidResult;
		
	}


}
