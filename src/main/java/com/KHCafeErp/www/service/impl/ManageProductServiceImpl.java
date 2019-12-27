package com.KHCafeErp.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.ManageProductDao;
import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ManageProductService;
@Service
public class ManageProductServiceImpl implements ManageProductService{
	
	@Autowired ManageProductDao manageProductDao;
	
	@Override
	public List<Product> getProductList() {
		return manageProductDao.selectProductAll();
	}
	
	@Override
	public List<Shop> getShopList() {
		return manageProductDao.selectShopAll();
	}
	@Override
	public List<CategoryDetail> getcategoryDetailList(int categoryNo) {
		return manageProductDao.selectCategoryDetail(categoryNo);
	}
	
	@Override
	public List<CategoryBase> getcategoryList() {
		return manageProductDao.selectCategoryAll();
	}
}
