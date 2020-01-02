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
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ManageProductService;

@Controller
public class ManageProductController {

	private static final Logger logger = LoggerFactory.getLogger(ManageProductController.class);
	@Autowired ManageProductService manageProductService;
	
	@RequestMapping(value="/manageProduct/list", method=RequestMethod.GET)
	public void productList(Model model) {
		logger.info("상품관리");
		
		List<CategoryBase> category = manageProductService.getcategoryList();
		List<Shop> shop = manageProductService.getShopList();
		List<Product> product = manageProductService.getProductList();
		
		model.addAttribute("category", category);
		model.addAttribute("shop", shop);
		model.addAttribute("product", product);
		
	}
	@RequestMapping(value="/manageProduct/categoryDetail", method=RequestMethod.GET)
	public ModelAndView getCategoryDetail(@RequestParam(value = "value")int categoryNo, ModelAndView mav) {
		
		List<CategoryDetail> categoryDetail = manageProductService.getcategoryDetailList(categoryNo);
		
		mav.addObject("categoryDetail", categoryDetail);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/manageProduct/view", method=RequestMethod.GET)
	public void getProductView(Model model, int productNo) {		

		List<CategoryBase> category = manageProductService.getcategoryList();
		Product product = manageProductService.getProduct(productNo);
		
		model.addAttribute("category", category);
		model.addAttribute("product", product);
		

	}
	
	@RequestMapping(value="/manageProduct/update", method=RequestMethod.GET)
	public ModelAndView updateProduct(Product product, ModelAndView mav) {
		logger.info("모달 값 : " + product.toString());
		
		manageProductService.editProduct(product);
		
		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");
		
		return mav;
	}

	@RequestMapping(value="/manageProduct/selStartDate", method=RequestMethod.GET)
	public ModelAndView updateSelStartDate(Product product, ModelAndView mav) {
		logger.info("판매 시작 등록 모달 값 : " + product.toString());
		
		manageProductService.editSelStartDate(product);
		
		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");
		
		return mav;
	}

	@RequestMapping(value="/manageProduct/selEndDate", method=RequestMethod.GET)
	public ModelAndView updateSelEndDate(Product product, ModelAndView mav) {
		logger.info("판매 종료 등록 모달 값 : " + product.toString());
		
		manageProductService.editSelEndDate(product);

		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");

		return mav;
	}
	
	@RequestMapping(value="/manageProduct/search", method=RequestMethod.GET)
	public ModelAndView search(ModelAndView mav, Product product) {
		
		logger.info("검색조건 :" + product);
//		manageProductService.searchList();
		
		return mav;
	}

}
