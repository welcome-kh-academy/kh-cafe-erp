package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.PlacingOrderDao;
import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.PlacingOrderProduct;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.PlacingOrderService;
import com.KHCafeErp.www.util.ExcelRead;
import com.KHCafeErp.www.util.Paging;
import com.KHCafeErp.www.util.ReadOption;

@Service
public class PlacingOrderServiceImpl implements PlacingOrderService {

	private static final Logger logger = LoggerFactory.getLogger(PlacingOrderServiceImpl.class);
	
	@Autowired PlacingOrderDao placingOrderDao;
	
	@Override
	public Paging getPaging(int curPage, PlacingOrder placingOrder) {

		int totalCount = placingOrderDao.selectPlacingOrderListCnt(placingOrder);
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

//	@Override
//	public List<PlacingOrder> getPlacingOrderList(Paging paging) {
//
//		List<PlacingOrder> placingOrderList = placingOrderDao.selectPlacingOrderList(paging);
//		return placingOrderList;
//	}

	@Override
	public List<PlacingOrder> getPlacingOrderList(PlacingOrder placingOrder) {
		List<PlacingOrder> placingOrderList = placingOrderDao.selectPlacingOrderList(placingOrder);
		
		return placingOrderList;
	}
	
	@Override
	public List<Shop> getShopList() {
		
		List<Shop> shopList = placingOrderDao.selectShopList();
		return shopList;
	}

	@Override
	public List<PlacingOrder> getList() {
		return placingOrderDao.selectPlacingOrderListAll();
	}

	@Override
	public void add(PlacingOrder placingorder, PlacingOrderProduct placingorderproduct, HttpSession session) {
		
		//발주번호 가져오기(nextval)
		int placingOrderNo = placingOrderDao.selectNextVal();
		
		placingorder.setPlacingOrderNo(placingOrderNo);
		
		placingorder.setShopNo((int) session.getAttribute("shopNo"));
		
		//발주 정보 등록
		placingOrderDao.placingOrderInsert(placingorder);
		
		//발주 상품 정보 등록
//		placingOrderDao.placingOrderProductInsert(placingorderproduct);
		
	}

	@Override
	public List<Ingredient> getIngredientList() {
		
		List<Ingredient> ingredientList = placingOrderDao.selectIngredientList();
		
		return ingredientList;
	}

	@Override
	public Ingredient getIngredientInfo(int ingredientNo) {
		return placingOrderDao.selectIngredientInfo(ingredientNo);
	}

	@Override
	public void insertMassiveProduct(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		
		for(Map<String, String> article : excelContent){
		   
			PlacingOrder placingOrder = new PlacingOrder();

			String shopName = article.get("A");
			int shopNo = placingOrderDao.getShopNo(shopName);
			placingOrder.setShopNo(shopNo);
			if(article.get("B").equals("발주 확인 전")) {
				placingOrder.setPlacingOrderStatus(0);				
			} else if(article.get("B").equals("발주 확인")) {
				placingOrder.setPlacingOrderStatus(1);				
			} else if(article.get("B").equals("출고 대기")) {
				placingOrder.setPlacingOrderStatus(2);				
			} else if(article.get("B").equals("출고 완료")) {
				placingOrder.setPlacingOrderStatus(3);							
			} else {
				placingOrder.setPlacingOrderStatus(-1);											
			}
			placingOrder.setPlacingOrderDate(article.get("C"));
			if(article.get("D").equals("입고 대기")) {
				placingOrder.setInStockStatus(0);
			} else if(article.get("D").equals("입고 완료")) {
				placingOrder.setInStockStatus(1);				
			} else {
				placingOrder.setPlacingOrderStatus(-1);															
			}

			System.out.println(placingOrder);
			placingOrderDao.insertPlacingOrder(placingOrder);
			
		   	int placingOrderNo = placingOrderDao.selectPlacingOrderNo(placingOrder);
		   	System.out.println(placingOrderNo);
		   	
		   	PlacingOrderProduct placingOrderProduct = new PlacingOrderProduct();
		   	placingOrderProduct.setPlacingOrderNo(placingOrderNo);
		   	placingOrderProduct.setIngredientNo((int)Float.parseFloat(article.get("E")));
		   	if(article.get("G").equals("입고 대기 중")) {
		   		placingOrderProduct.setPlacingOrderProductStatus(0);
		   	} else if(article.get("G").equals("입고 확인")) {
		   		placingOrderProduct.setPlacingOrderProductStatus(1);		   		
		   	} else if(article.get("G").equals("파손")) {
		   		placingOrderProduct.setPlacingOrderProductStatus(2);		   				   		
		   	} else if(article.get("G").equals("누락")) {
		   		placingOrderProduct.setPlacingOrderProductStatus(3);		   				   		
		   	} else {
		   		placingOrderProduct.setPlacingOrderProductStatus(-1);
		   	}
		   	placingOrderProduct.setPlacingOrderProductCnt((int)Float.parseFloat(article.get("F")));
		   	
		   	System.out.println(placingOrderProduct);
		   	placingOrderDao.insertPlacingOrderProduct(placingOrderProduct);
		  }
		System.out.println(excelContent);
		
	}





}
