package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.ReleaseProductDao;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.service.face.ReleaseProductService;
import com.KHCafeErp.www.util.ExcelRead;
import com.KHCafeErp.www.util.ReadOption;

@Service
public class ReleaseProductServiceImpl implements ReleaseProductService {

	@Autowired ReleaseProductDao releaseProductDao;
	
	@Override
	public List<Release> getReleaseList() {
		return releaseProductDao.selectReleaseList();
	}
	
	@Override
	public void insertMassiveProduct(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		
		for(Map<String, String> article : excelContent){
//		   
//			Product product = new Product();
//		   
//			product.setCategoryMapNo((int)Float.parseFloat(article.get("A")));
//			product.setShopNo((int)Float.parseFloat(article.get("B")));
//		   	product.setProductName(article.get("D"));
//		   	product.setProductContent(article.get("E"));
//		   	product.setOriginPrice((int)Float.parseFloat(article.get("F")));
//		   	product.setPrice((int)Float.parseFloat(article.get("G")));
//		   	product.setProductOrigin(article.get("H"));
//		   	product.setSelStartDate(article.get("I"));
//		   	product.setSelEndDate(article.get("J"));
//		   	product.setSelStatus((int)Float.parseFloat(article.get("K")));
//		   
//		   	System.out.println(product);
//		   
//		   	orderDao.insertRelease(product);
//		   	
//		   	ProductOption productOption = new ProductOption();
//		   	String productName = product.getProductName();
//		   	
//		   	int productNo = orderDao.getProductNo(productName);
//		   	System.out.println(productNo);
//		   	
//		   	productOption.setProductNo(productNo);
//		   	productOption.setOptionNo((int)Float.parseFloat(article.get("C")));
//		   	
//		   	System.out.println(productOption);
//		   	
//		   	orderDao.insertProductOption(productOption);

		  }
		System.out.println(excelContent);
	}

}
