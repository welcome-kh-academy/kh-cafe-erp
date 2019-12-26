package com.KHCafeErp.www.controller;

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

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.ProductOption;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.AddProductService;

@Controller
public class AddProductContrller {

	@Autowired AddProductService addProductService;
	
	private static final Logger logger = LoggerFactory.getLogger(AddProductContrller.class);
	
	@RequestMapping(value = "/product/index", method=RequestMethod.GET)
	public void productIndex() {
		logger.info("상품등록 첫 페이지");
	}
	
//	상품등록 1단계 - 카테고리등록
	@RequestMapping(value = "/product/addCategory", method=RequestMethod.GET)
	public void addCategory(Model model) {
		logger.info("카테고리 등록");
		List<CategoryBase> categoryList = addProductService.getCategoryList();
	
		model.addAttribute("categoryList", categoryList);
	}
	
	// 상품 옵션 목록  
	@RequestMapping(value = "/product/option/list", method=RequestMethod.GET)
	public String optionList(Model model) {
		logger.info("optionList()");
//		int categoryNo = 1;	// 나중에 수정 필요 - 앞에서 넘어오는 categoryNo로..!
		int categoryNo = 2;	

		List<ProductOption> optionList = addProductService.selectOption(categoryNo);

		model.addAttribute("optionList", optionList);
		
		return "/product/productOption";
	}


	// 상품 옵션 등록
	@RequestMapping(value = "/product/option/register")
	public ModelAndView getOption(@RequestParam(value="categoryNo") int categoryNo, @RequestParam(value="productOptionName") String productOptionName, @RequestParam(value="optionValue") int optionValue,ModelAndView mav) {
		System.out.println(categoryNo);
		
		int productOptionNo = addProductService.getProductOptionNo(categoryNo);
		
		mav.addObject("productOptionNo", productOptionNo);
		mav.addObject("categoryNo",categoryNo);

		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//판매지점 등록
	@RequestMapping(value="/product/addShop", method=RequestMethod.GET)
	public void addShop(Model model) {
//		logger.info("지점등록");
		
		List<Shop> shopList = addProductService.getShopList();
		model.addAttribute("shopList", shopList);
		
	}
}
