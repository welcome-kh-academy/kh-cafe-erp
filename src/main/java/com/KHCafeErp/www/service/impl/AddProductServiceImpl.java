package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.AddProductDao;
import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.ProductOption;
import com.KHCafeErp.www.service.face.AddProductService;

@Service
public class AddProductServiceImpl implements AddProductService {

	@Autowired AddProductDao addProductDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AddProductServiceImpl.class);
	
	@Override
	public List<ProductOption> selectOption() {
		return addProductDao.selectOption();
	}

	@Override
	public List<CategoryBase> getCategoryList() {
		return addProductDao.selectCategoryList();
	}

}
