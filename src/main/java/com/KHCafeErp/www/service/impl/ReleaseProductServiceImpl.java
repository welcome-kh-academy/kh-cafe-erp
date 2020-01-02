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
import com.KHCafeErp.www.util.Paging;
import com.KHCafeErp.www.util.ReadOption;

@Service
public class ReleaseProductServiceImpl implements ReleaseProductService {

	@Autowired ReleaseProductDao releaseProductDao;
	
	@Override
	public List<Release> getReleaseList(Paging paging) {
		return releaseProductDao.selectReleaseList(paging);
	}
	
	@Override
	public void insertMassiveProduct(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		
		for(Map<String, String> article : excelContent){
		   
			Release release = new Release();

			release.setPlacingOrderNo((int)Float.parseFloat(article.get("A")));
			release.setShopName(article.get("B"));
			if(article.get("C").equals("출고 전")) {
				release.setReleaseStatus(0);				
			} else if(article.get("C").equals("출고 완료")) {
				release.setReleaseStatus(1);								
			} else {
				release.setReleaseStatus(-1);								
			}
			release.setReleaseDate(article.get("D"));
			
			System.out.println(release);
		   	releaseProductDao.insertRelease(release);
			
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

	@Override
	public Paging getPaging(int curPage, Release release) {
		int totalCount = releaseProductDao.selectReleaseListCnt(release);
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

}
