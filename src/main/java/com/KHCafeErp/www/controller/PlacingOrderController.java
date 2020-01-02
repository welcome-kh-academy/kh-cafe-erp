package com.KHCafeErp.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.service.face.PlacingOrderService;
import com.KHCafeErp.www.util.Paging;

@Controller
public class PlacingOrderController {

	private static final Logger logger = LoggerFactory.getLogger(PlacingOrderController.class);
	@Autowired PlacingOrderService placingOrderService;
	
	@RequestMapping(value="placingOrder/registration", method=RequestMethod.GET)
	public void placingOrderAdd() {
		logger.info("발주등록 페이지");
	}
	
	@RequestMapping(value="placingOrder/management", method=RequestMethod.GET)
	public void placingOrderMain() {
		logger.info("발주관리 페이지");
	}

	@RequestMapping(value="/placingOrder/search", method=RequestMethod.GET)
	public ModelAndView placingOrderSearch(PlacingOrder placingOrder, ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
		
		logger.info(placingOrder.toString());
		
		Paging paging = placingOrderService.getPaging(curPage, placingOrder);
		logger.info("--" + paging);
		
		List<PlacingOrder> data = placingOrderService.getPlacingOrderList(paging);
		logger.info("++" + data);
		
		List llist = new ArrayList();
		List list = null;
		
		for(PlacingOrder po : data) {
			list = new ArrayList();
			list.add(po.getPlacingOrderNo());
			list.add(po.getShopNo());
			list.add(po.getPlacingOrderDate());
			list.add(po.getPlacingOrderStatus());
			list.add(po.getInStockStatus());
			list.add(po.getStartDate());
			list.add(po.getEndDate());
			list.add(po.getShopName());
			
			llist.add(list);
		}
		
		mav.addObject("data",llist);
//		mav.addObject("data",data);
		mav.setViewName("jsonView");
		
		return mav;
	}	
}
