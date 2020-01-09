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
import com.KHCafeErp.www.dto.Warehousing;
import com.KHCafeErp.www.service.face.WarehousingService;
import com.KHCafeErp.www.util.ExcelWriter;

@Controller
public class WarehousingController {

	private static final Logger logger = LoggerFactory.getLogger(WarehousingController.class);	
	
	@Autowired private WarehousingService warehousingService;
	
	//입고 목록 페이지
	@RequestMapping(value="/warehousing/warehousingList")
	public void list(Model model) {
		
		logger.info("입고 목록 페이지 확인");
		List<Warehousing> dealList = warehousingService.getdealList();
		List<Warehousing> wareHouseList = warehousingService.getdwareHouseList();
		logger.info("거래처 : "+dealList.toString());
		model.addAttribute("dealList", dealList);
		model.addAttribute("wareHouseList", wareHouseList);
	}
	@RequestMapping(value="/warehousing/search")
	public ModelAndView search(Warehousing wareHousing, ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
		
		logger.info("입고 검색 후 목록 불러오기");
		List<Warehousing> data = warehousingService.getWareHousingList(wareHousing);
		
		List llist = new ArrayList();
		List list = null;
		
		//번호
		int i=1;
		for(Warehousing po : data) {
			list = new ArrayList();
			list.add(i++);
			list.add(po.getWarehousingNo());
			list.add(po.getPlacingOrderProductNo());
			list.add(po.getStorageNo());
			list.add(po.getProductCnt());
			list.add(po.getInStockDate());
			list.add(po.getIsAutoInStock());
			list.add(po.getInStockStatus());
			list.add(po.getDealStore());
			llist.add(list);
		}
		
		mav.addObject("data",llist);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//입고 등록 페이지
	@RequestMapping(value="/warehousing/registration")
	public String registration() {
		return "warehousing/registration";
	}
	
	@RequestMapping(value="/warehousing/prdSearchPopup")
	public void prdSearch() {
	}
	
	
	@RequestMapping(value="/warehousing/registration", method = RequestMethod.POST)
	public String registrationProcess(Warehousing warehousing) {
		
		logger.info("입고 처리 페이지 확인");
		warehousingService.registration(warehousing);
		
		return "redirect:/warehousing/registration";
	}
	
	
	@RequestMapping(value = "/warehousing/exceldown")
	public String excelDown() {
		
		List<Warehousing> wareHouseList = warehousingService.getList();

		System.out.println(wareHouseList);

		 ExcelWriter excelWriter=new ExcelWriter();
		 excelWriter.wareHouseXls(wareHouseList);
		 
		 logger.info("엑셀 다운 완료");
		 
		 return "redirect:/warehousing/warehousingList";
	}
}
