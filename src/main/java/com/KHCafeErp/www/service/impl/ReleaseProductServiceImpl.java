package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.ReleaseProductDao;
import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.ReleaseProduct;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ReleaseProductService;
import com.KHCafeErp.www.util.ExcelRead;
import com.KHCafeErp.www.util.Paging;
import com.KHCafeErp.www.util.ReadOption;

@Service
public class ReleaseProductServiceImpl implements ReleaseProductService {

	@Autowired ReleaseProductDao releaseProductDao;
	
	@Override
	public List<Release> getReleaseList(Release release) {
		return releaseProductDao.selectReleaseList(release);
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
			release.setReleaseDate(article.get("G"));
			
			System.out.println(release);
		   	releaseProductDao.insertRelease(release);
			
		   	int releaseNo = releaseProductDao.selectOrderNo(release);
		   	System.out.println(releaseNo);
		   	
		   	ReleaseProduct releaseProduct = new ReleaseProduct();
		   	releaseProduct.setReleaseNo(releaseNo);
		   	releaseProduct.setReleaseProductName(article.get("D"));
		   	releaseProduct.setProductCnt((int)Float.parseFloat(article.get("E")));
		   	if(article.get("F").equals("출고 전")) {
				releaseProduct.setProductStatus(0);				
			} else if(article.get("F").equals("출고 완료")) {
				releaseProduct.setProductStatus(1);								
			} else {
				releaseProduct.setProductStatus(-1);								
			}
		   	
		   	System.out.println(releaseProduct);
		   	releaseProductDao.insertReleaseProduct(releaseProduct);

		  }
		System.out.println(excelContent);
	}

	@Override
	public Paging getPaging(int curPage, Release release) {
		int totalCount = releaseProductDao.selectReleaseListCnt(release);
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Release> getList() {
		return releaseProductDao.getList();
	}

	@Override
	public List<Shop> getShopList() {
		return releaseProductDao.selectShopList();
	}

	@Override
	public List<Integer> getPlacingOrderNo() {
		return releaseProductDao.selectPlacingOrderNo();
	}

	@Override
	public void insertRelease(int placingOrderNo) {
		releaseProductDao.insertNewRelease(placingOrderNo);
	}

	@Override
	public void insertReleaseProduct(Ingredient ingredient) {
		releaseProductDao.insertNewReleaseProduct(ingredient);		
	}

	@Override
	public int getReleaseNo(int placingOrderNo) {
		return releaseProductDao.selectReleaseNo(placingOrderNo);
	}

	@Override
	public List<Ingredient> getReleaseProductList(int placingOrderNo) {
		return releaseProductDao.selectReleaseProductList(placingOrderNo);
	}

	@Override
	public List<ReleaseProduct> getReleseProduct(Release release) {
		return releaseProductDao.selectReleaseProduct(release);
	}

	@Override
	public PlacingOrder getReleaseInfo(Release release) {
		return releaseProductDao.selectReleseInfo(release);
	}

	@Override
	public void updateRelease(List releaselist) {
		System.out.println("서비스 : " + releaselist);
		for(int i=0;i<releaselist.size();i++) {
			ReleaseProduct releaseProduct = new ReleaseProduct();
			List list = (List) releaselist.get(i);
			releaseProduct.setReleaseProductNo(Integer.parseInt((String)list.get(0)));
			releaseProduct.setProductCnt(Integer.parseInt((String)list.get(1)));
			releaseProduct.setProductStatus(Integer.parseInt((String)list.get(2)));
			if((String)list.get(3)!=null && !"".equals((String)list.get(3))) {
				releaseProduct.setProductRemark((String)list.get(3));				
			} else {
				releaseProduct.setProductRemark("");
			}
			System.out.println("dsdfsdfsdfsd : "+releaseProduct);
			releaseProductDao.updateRelease(releaseProduct);
		}
	}



}
