package com.KHCafeErp.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.KHCafeErp.www.dto.CategoryDetail;

import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.Option;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.AddProductService;

@Controller
public class AddProductContrller {

	@Autowired AddProductService addProductService;
	
	private static final Logger logger = LoggerFactory.getLogger(AddProductContrller.class);
	private Map<String, Object> addProduct = new HashMap<String, Object>();
	
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
	
//	상품등록 1단계 - 카테고리등록 - 상품검색
	@RequestMapping(value = "/product/addCategory", method=RequestMethod.POST)
	public void addCategory(Model model, Product product) {
		logger.info("카테고리 등록에서 상품검색");
		CategoryBase category = addProductService.getCategory(product);
			
		model.addAttribute("category", category);
	}
	
	//상품등록 1단계 - 카테고리등록 - 카테고리로 카테고리 상세목록 가져오기(Ajax)
	@RequestMapping(value = "/product/getCategoryDetail", method=RequestMethod.GET)
	public ModelAndView getCategoryDetail(@RequestParam(value = "value") int value, ModelAndView mav) {
		
		List<CategoryDetail> categoryDetailList = addProductService.getCategoryDetail(value);
		
		mav.addObject("categoryDetailList",categoryDetailList);
		mav.setViewName("jsonView");
		
		logger.info(""+categoryDetailList);
		
		return mav;
	}
	
	// 상품 등록 페이지
	@RequestMapping(value = "/product/saveCategoryMap", method=RequestMethod.POST)
	public String saveCategoryMap(HttpSession session, CategoryBase category, CategoryDetail categoryDetail) {
		
		addProduct.put("categoryNo", category.getCategoryNo());
		addProduct.put("categoryDetailNo", categoryDetail.getCategoryMapNo());
		
		session.setAttribute("addProduct", addProduct);
		
		logger.info(category.toString());
		logger.info(categoryDetail.toString());
		
		return "redirect:/product/register";
	}
	

	@RequestMapping(value = "/product/register", method = RequestMethod.GET)
	public String addProduct() {
		
		logger.info("addProduct()");
		return "/product/addproduct";
	}

	// 상품 정보 저장하기
	@RequestMapping(value = "/product/register", method = RequestMethod.POST)
	public String addProductProc(HttpSession session, Product product,ImgFile imgFile, Model model) {
		logger.info("addProductProc()");
		logger.info(product.toString()); 
//		logger.info(imgFile.toString());
		imgFile = addProductService.filesave(imgFile);
		logger.info(imgFile.toString());

		session.setAttribute("productName", product.getProductName());
		session.setAttribute("productOrigin", product.getProductOrigin());
		session.setAttribute("productContent", product.getProductContent());

		return "/product/addproduct";
	}
		
	// 상품 옵션 목록  
	@RequestMapping(value = "/product/option", method=RequestMethod.GET)
	public String optionList(Model model) {
		logger.info("optionList()");
		int categoryNo = 1;	// 나중에 수정 필요 - 앞에서 넘어오는 categoryNo로..!
//		int categoryNo = 2;	

		List<Option> optionList = addProductService.selectOption(categoryNo);

		model.addAttribute("optionList", optionList);
		
		return "/product/addOption";
	}


	// 상품 옵션 등록
	@RequestMapping(value = "/product/option/register")
	public ModelAndView getOption(@RequestParam(value="categoryNo") int categoryNo, @RequestParam(value="optionName") String optionName, @RequestParam(value="optionValue") int optionValue,ModelAndView mav) {
		
		Option option = new Option();
		option.setCategoryNo(categoryNo);
		option.setoptionName(optionName);
		option.setOptionValue(optionValue);
		
		addProductService.addOption(option);
		List<Option> optionList = addProductService.selectOption(categoryNo);
		mav.addObject("optionList", optionList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//판매 방식 등록
	@RequestMapping(value="/product/salesMethod", method=RequestMethod.GET)
	public void salesMethod(Model model) { 
		
		model.addAttribute("productHeaderNo",4);
		
	}
	
	@RequestMapping(value="/product/salesMethod", method=RequestMethod.POST)
	public void saveSalesMethod() { }
	
	//판매지점 등록
	@RequestMapping(value="/product/addShop", method=RequestMethod.GET)
	public void addShop(Model model) {
		
		List<Shop> shopList = addProductService.getShopList();
		model.addAttribute("shopList", shopList);
	}
}
