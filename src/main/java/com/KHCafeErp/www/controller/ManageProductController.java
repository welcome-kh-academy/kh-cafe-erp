package com.KHCafeErp.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ManageProductService;

@Controller
public class ManageProductController {

	private static final Logger logger = LoggerFactory.getLogger(ManageProductController.class);
	@Autowired ManageProductService manageProductService;
	
	@RequestMapping(value="manageProduct/list", method=RequestMethod.GET)
	public void productList(Model model) {
		logger.info("상품관리");
		
		List<CategoryBase> category = manageProductService.getcategoryList();
		List<CategoryDetail> categoryDetail = manageProductService.getcategoryDetailList();
		List<Shop> shop = manageProductService.getShopList();
		List<Product> product = manageProductService.getProductList();
		
		model.addAttribute("category", category);
		model.addAttribute("categoryDetail", categoryDetail);
		model.addAttribute("shop", shop);
		model.addAttribute("product", product);
	}

}
