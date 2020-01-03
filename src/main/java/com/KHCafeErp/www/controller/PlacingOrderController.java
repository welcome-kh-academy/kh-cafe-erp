package com.KHCafeErp.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.PlacingOrderService;
import com.KHCafeErp.www.util.Paging;
import com.KHCafeErp.www.util.WriteOption;

@Controller
public class PlacingOrderController {

	private static final Logger logger = LoggerFactory.getLogger(PlacingOrderController.class);
	@Autowired PlacingOrderService placingOrderService;
	
	@RequestMapping(value="/placingOrder/registration", method=RequestMethod.GET)
	public void placingOrderAdd() {
		logger.info("발주등록 페이지");
	}
	
	@RequestMapping(value="/placingOrder/management", method=RequestMethod.GET)
	public void placingOrderMain(Model model) {
		
		logger.info("발주관리 페이지");
		List<Shop> shopList = placingOrderService.getShopList();
		model.addAttribute(shopList);
		
	}

	@RequestMapping(value="/placingOrder/search", method=RequestMethod.GET)
	public ModelAndView placingOrderSearch(PlacingOrder placingOrder, ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
		
		List<PlacingOrder> data = placingOrderService.getPlacingOrderList(placingOrder);
		
		List llist = new ArrayList();
		List list = null;
		
		//번호
		int i=1;
		for(PlacingOrder po : data) {
			list = new ArrayList();
			list.add(i++);
			list.add(po.getPlacingOrderNo());
			list.add(po.getShopNo());
			
//			StringBuffer sb = new StringBuffer(po.getPlacingOrderDate());
//			sb.insert(4, "년 ");
//			sb.insert(7, "월  ");
//			sb.insert(10, "일");
//			list.add(sb);
			list.add(po.getPlacingOrderDate());
			list.add(0);
			list.add(0);
			list.add(po.getPlacingOrderStatus());
			list.add(po.getInStockStatus());
			
//			list.add(po.getStartDate());
//			list.add(po.getEndDate());
//			list.add(po.getShopName());
			
			llist.add(list);
		}
		
		mav.addObject("data",llist);
		mav.setViewName("jsonView");
		
		return mav;
	}	
	
	@RequestMapping(value = "/placingorder/exceldown")
	public void excelDown() {
		
		List<PlacingOrder> placingOrderList = placingOrderService.getList();
		System.out.println(placingOrderList);
		
		WriteOption writeOption = new WriteOption();
		writeOption.setFileName("발주목록.xlsx");
		writeOption.setSheetName("발주");
		
		
		
		 List<String> titles = new ArrayList<String>();
		 
		 titles.add("발주 번호");
		 titles.add("지점명");
		 titles.add("발주 날짜");
		 titles.add("총 발주 수량");
		 titles.add("총 발주 금액");
		 titles.add("발주 상태");
		 titles.add("입고 상태");
		 
	}
}
