package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.OrderDao;
import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.OrderProduct;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.OrderService;
import com.KHCafeErp.www.util.ExcelRead;
import com.KHCafeErp.www.util.Paging;
import com.KHCafeErp.www.util.ReadOption;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderDao orderDao;
	
	
	
	
	@Override
	public void insertMassiveProduct(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G","H");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		
		for(Map<String, String> article : excelContent){
		   
			OrderBase orderBase = new OrderBase();
			
			orderBase.setCusNo((int)Float.parseFloat(article.get("A")));
			orderBase.setOrderDate(article.get("B"));			
			if(article.get("C").equals("장바구니")) {
				orderBase.setOrderStatus(0);
			} else if(article.get("C").equals("주문완료")) {
				orderBase.setOrderStatus(1);
			} else if(article.get("C").equals("장바구니")){
				orderBase.setOrderStatus(2);
			} else {
				orderBase.setOrderStatus(-1);
			}

			if(article.get("H")!= null && !"".equals(article.get("H"))) {
				orderBase.setCusReq(article.get("H"));				
			} else {
				orderBase.setCusReq("");								
			}
		   
		   	System.out.println(orderBase);
		   
		   	orderDao.insertOrderBase(orderBase);
	 		   	
		   	int orderno = orderDao.selectOrderNo(orderBase);
		   	System.out.println(orderno);
		   	
		   	OrderProduct orderProduct = new OrderProduct();
		   	
		   	orderProduct.setOrderno(orderno);
		   	orderProduct.setProductNo((int)Float.parseFloat(article.get("E")));
		   	orderProduct.setProductOptionNo((int)Float.parseFloat(article.get("F")));
		   	orderProduct.setProductCnt((int)Float.parseFloat(article.get("G")));
		   	System.out.println(orderProduct);
		   	
		   	orderDao.insertOrderProduct(orderProduct);
		  }
		System.out.println(excelContent);
	}




	@Override
	public List getOrderList(OrderBase orderBase) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderList(orderBase);
		
	}




//	@Override
//	public Paging getPaging(int curPage, OrderBase orderBase) {
//		// TODO Auto-generated method stub
//		int totalCount = orderDao.selectOrderListCnt(orderBase);
//		
//		Paging paging = new Paging(totalCount, curPage);
//		
//		return paging;
//	}









	@Override
	public List<Shop> getShopList() {
		// TODO Auto-generated method stub
		return orderDao.selectShopList();
	}




@Override
public List<OrderProduct> selectorderProduct(OrderProduct orderProduct) {
	// TODO Auto-generated method stub
	return orderDao.selectorderProduct();
}




@Override
public List<Product> selectProduct(Product product) {
	// TODO Auto-generated method stub
	return orderDao.selectProduct();
}

}
