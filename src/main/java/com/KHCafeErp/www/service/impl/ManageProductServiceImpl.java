package com.KHCafeErp.www.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.ManageProductDao;
import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ManageProductService;
import com.KHCafeErp.www.util.Paging;
@Service
public class ManageProductServiceImpl implements ManageProductService{
	
	@Autowired ManageProductDao manageProductDao;
	
	@Override
	public Paging getPaging(Paging page, Product product) {
		
		
		int totalCount = manageProductDao.selectCntAll(product);
		
		
		Paging paging = new Paging (totalCount, page.getCurPage());
		
		return paging;
	}
	
	@Override
	public void deleteProduct(Product product) {
		manageProductDao.deleteProduct(product);
	}
	
//	@Override
//	public List<Product> searchList(Product product) {
//	
//		return manageProductDao.selectSearchList(product);
//	}

	@Override
	public void editSelStartDate(Product product) {
		manageProductDao.updateSelStartDate(product);
	}

	@Override
	public void editSelEndDate(Product product) {
		manageProductDao.updateSelEndDate(product);
	}

	@Override
	public void editProduct(Product product) {
		manageProductDao.updateProduct(product);
	}
	
	@Override
	public List<Product> getProductList(Paging paging, Product product) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("product", product);
		
		return manageProductDao.selectProductAll(map);
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
	
	@Override
	public Product getProduct(int productNo) {
		return manageProductDao.selectProductByProductNo(productNo);
	}

	@Override
	public List<Product> getList() {
		return manageProductDao.selectList();
	}
}
