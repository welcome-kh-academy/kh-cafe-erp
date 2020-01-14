package com.KHCafeErp.www.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.PlacingOrderProduct;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.PlacingOrderService;
import com.KHCafeErp.www.util.ExcelWriter;

@Controller
public class PlacingOrderController {

	private static final Logger logger = LoggerFactory.getLogger(PlacingOrderController.class);
	@Autowired PlacingOrderService placingOrderService;
	
	@RequestMapping(value="/placingOrder/registration", method=RequestMethod.GET)
	public void placingOrderAdd(Model model) {
		logger.info("발주등록 페이지");
		
		
		List<Shop> shopList = placingOrderService.getShopList();
		model.addAttribute(shopList);
			
		List<Ingredient> ingredientList = placingOrderService.getIngredientList();
		model.addAttribute(ingredientList);
		
		PlacingOrderProduct placingOrderProduct = new PlacingOrderProduct();
		model.addAttribute(placingOrderProduct);
		

	}
	
	@RequestMapping(value="/placingOrder/addTable", method=RequestMethod.GET)
	public ModelAndView placingOrderAddTable(ModelAndView mav,@RequestParam(value="ingredientNo") int ingredientNo) {
		logger.info("발주등록 원자재 추가 ajax 페이지");
				
		Ingredient ingredient = placingOrderService.getIngredientInfo(ingredientNo);
		System.out.println(ingredient);
	
		mav.addObject("ingredient", ingredient);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/placingOrder/registration", method=RequestMethod.POST)
	public String placingOrderAddProcess(PlacingOrder placingorder, PlacingOrderProduct placingorderproduct, HttpSession session) {
		
		logger.info("발주등록 처리 페이지");
		
		//발주등록처리
		placingOrderService.add(placingorder, placingorderproduct, session);
		
		return "redirect:/placingOrder/registration";
	}
	
	@RequestMapping(value="/placingOrder/management", method=RequestMethod.GET)
	public void placingOrderMain(Model model) {
		
		logger.info("발주관리 페이지");
		List<Shop> shopList = placingOrderService.getShopList();
		model.addAttribute(shopList);
		
	}

	@RequestMapping(value="/placingOrder/search", method=RequestMethod.GET)
	public ModelAndView placingOrderSearch(PlacingOrder placingOrder, ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
		
		logger.info(placingOrder.toString());
		
		List<PlacingOrder> data = placingOrderService.getPlacingOrderList(placingOrder);
		
		// 20-01-13 유진 : 총 발주 금액, 총 발주 수량 구하기
		for(int i=0;i<data.size();i++) {
			PlacingOrder placingProduct = data.get(i);
//			System.out.println(placingProduct);
			int placingOrderPrice = placingOrderService.sumPlacingOrderPrice(placingProduct);
//			System.out.println(placingProduct.getPlacingOrderNo()+" : "+placingOrderPrice);
			placingProduct.setPlacingOrderPrice(placingOrderPrice);
			int placingOrderCnt = placingOrderService.sumPlacingOrderCnt(placingProduct);
//			System.out.println(placingOrderCnt);
			placingProduct.setPlacingOrderCnt(placingOrderCnt);
		}
		
		List llist = new ArrayList();
		List list = null;
		
		//번호
		int i=1;
		for(PlacingOrder po : data) {
			list = new ArrayList();
			list.add(null);
			list.add(i++);
			list.add(po.getPlacingOrderNo());
			list.add(po.getShopName());
			list.add(po.getPlacingOrderDate());
			list.add(po.getPlacingOrderCnt());
			list.add(po.getPlacingOrderPrice());
			// 20-01-12 유진 : 상태 표시 변경
			if(po.getPlacingOrderStatus()==0) {
				list.add("발주 확인 전");
			} else if(po.getPlacingOrderStatus()==1) {
				list.add("발주 확인");
			} else if(po.getPlacingOrderStatus()==2) {
				list.add("출고 대기");
			} else if(po.getPlacingOrderStatus()==3) {
				list.add("출고 완료");
			}
//			list.add(po.getPlacingOrderStatus());
			if(po.getInStockStatus()==0) {
				list.add("입고 대기");
			} else if(po.getInStockStatus()==1) {
				list.add("입고 완료");
			}
//			list.add(po.getInStockStatus());
			
//			list.add(po.getStartDate());
//			list.add(po.getEndDate());
//			list.add(po.getShopName());
			
			llist.add(list);
			
		}
		
		mav.addObject("data",llist);
		mav.setViewName("jsonView");
		
		return mav;
	}	
	
	@RequestMapping(value = "/placingOrder/exceldown")
	public String excelDown() {
		
		List<PlacingOrder> placingOrderList = placingOrderService.getList();

		System.out.println(placingOrderList);
		 
		 ExcelWriter excelWriter=new ExcelWriter();
		 excelWriter.placingOrderXls(placingOrderList);
		 
		 logger.info("엑셀 다운 완료");
		 
		 return "redirect:/placingOrder/management";
	}
	
	// 20-01-12 : 유진 엑셀 업로드
	@RequestMapping(value = "/placingOrder/popExcel", method = RequestMethod.GET)
	public void popExcel() {
	}
	
	// 20-01-12 : 유진 엑셀 업로드
	@RequestMapping(value = "/placingOrder/upload", method=RequestMethod.POST)
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
        placingOrderService.insertMassiveProduct(destFile);
        
        ModelAndView view = new ModelAndView();
        
        view.setViewName("/placingOrder/excel-success");
        
        return view;
	}
}
