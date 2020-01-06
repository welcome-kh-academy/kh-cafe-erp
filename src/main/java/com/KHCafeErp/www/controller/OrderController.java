package com.KHCafeErp.www.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.service.face.OrderService;
import com.KHCafeErp.www.util.Paging;


@Controller
public class OrderController {

	@Autowired OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


	@RequestMapping(value="/order/orderlist" ,method=RequestMethod.GET)
	public void Orderlist(Model model) {
		
	}
		
	@RequestMapping(value = "/order/popExcel", method = RequestMethod.GET)
	public void popExcel() {
		
	}
	
	@RequestMapping(value="/order/search" ,method=RequestMethod.GET)
	public ModelAndView releaseSearch(OrderBase orderBase, ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
		logger.info("releaseSearch()");
		
		Paging paging = orderService.getPaging(curPage, orderBase);
		
		@SuppressWarnings("unchecked")
		List<OrderBase> orderBaseList = orderService.getOrderList(paging);
		System.out.println(orderBaseList);
		
		List llist = new ArrayList();
		List list = null;
		
		for(OrderBase r : orderBaseList) {
			list = new ArrayList();
			list.add(r.getOrderNo());
			list.add(r.getCusNo());
			list.add(r.getPrdShopNo());
			list.add(r.getRequirement());
			list.add(r.getOrderStatus());
			
			llist.add(list);
		}
		
		mav.addObject("data",llist);
//		mav.addObject("data",data);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	// 19-12-31 유진 - 엑셀 업로드
	@RequestMapping(value = "/order/upload", method = RequestMethod.POST)
	public ModelAndView uploadExcel(MultipartHttpServletRequest request) {
		logger.info("uploadExcel()");
		
		MultipartFile excelFile = request.getFile("excelFile");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택해 주세요");
        }
 
        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IllegalStateException | IOException e) {
            throw new RuntimeException(e.getMessage(),e);
 
        }
        
        orderService.insertMassiveProduct(destFile);
        
        ModelAndView view = new ModelAndView();
        
        view.setViewName("/release/excel-success");
        
        return view;
	}
}
