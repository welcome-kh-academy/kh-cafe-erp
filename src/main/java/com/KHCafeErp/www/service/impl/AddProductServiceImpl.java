package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.AddProductDao;
import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.Option;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.AddProductService;

@Service
public class AddProductServiceImpl implements AddProductService {

	@Autowired AddProductDao addProductDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AddProductServiceImpl.class);
	
	@Override
	public List<Shop> getShopList() {
		return addProductDao.selectShopList();
	}
	
	@Override
	public List<Option> selectOption(int categoryNo) {
		return addProductDao.selectOption(categoryNo);
	}


	@Override
	public List<CategoryBase> getCategoryList() {
		return addProductDao.selectCategoryList();
	}

	@Override
	public void addOption(Option option) {
		addProductDao.insertOption(option);
	}

}
