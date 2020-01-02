package com.KHCafeErp.www.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.OptionBase;
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
	
		List<Product> prdList = addProductService.getPrdList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("prdList", prdList);
	}
	
//	상품등록 1단계 - 카테고리등록 - 상품검색
	@RequestMapping(value = "/product/getCategoryByPrd", method=RequestMethod.GET)
	public void getCategoryByPrd(ModelAndView mav, @RequestParam(value = "value") int value) {
		
		Product product = new Product();
		product.setCategoryMapNo(value);
		
		logger.info(product.toString());
		CategoryBase category = addProductService.getCategory(product);
		
		
		mav.addObject("category", category);
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
	
	@RequestMapping(value = "/product/saveCategoryMap", method=RequestMethod.POST)
	public String saveCategoryMap(HttpSession session, CategoryBase category, CategoryDetail categoryDetail) {
		
		addProduct.put("categoryNo", category.getCategoryNo());
		addProduct.put("categoryMapNo", categoryDetail.getCategoryMapNo());

		logger.info(addProduct+"'");
		
		session.setAttribute("addProduct", addProduct);
		
		return "redirect:/product/register";
	}
	
	//상품등록 2단계 - 상품 등록 페이지
	@RequestMapping(value = "/product/register", method = RequestMethod.GET)
	public String addProduct(HttpSession session, Model model) {
		
		logger.info("addProduct()");
		int categoryBaseNo = (int) addProduct.get("categoryNo");
		String categoryBaseName = addProductService.getCategoryBaseName(categoryBaseNo);

		int categoryDetailNo = (int) addProduct.get("categoryMapNo");
		String categoryDetailName = addProductService.getCategoryDetailName(categoryDetailNo);
		
		addProduct.put("categoryName", categoryBaseName);
		addProduct.put("categoryDetailName", categoryDetailName);

		session.setAttribute("addProduct", addProduct);
		
		return "/product/addproduct";
	}

	// 상품 정보 저장하기
	@RequestMapping(value = "/product/saveRegisterMap", method = RequestMethod.POST)
	public String addProductProc(HttpSession session, Product product,ImgFile imgFile, Model model) {
		logger.info("addProductProc()");
		logger.info(product.toString()); 
//		logger.info(imgFile.toString());
		imgFile = addProductService.filesave(imgFile);
		logger.info(imgFile.toString());

		addProduct.put("productName", product.getProductName());
		addProduct.put("productOrigin", product.getProductOrigin());
		addProduct.put("productContent", product.getProductContent());
		addProduct.put("fileOrigin", imgFile.getOriginName());
		addProduct.put("fileStored", imgFile.getStoredName());
		addProduct.put("originPrice",product.getOriginPrice());
		addProduct.put("price",product.getPrice());

		System.out.println("++++++++++++++++++++++++-*** "+imgFile.getOriginName()+imgFile.getStoredName());
		
		session.setAttribute("addProduct", addProduct);
		
		System.out.println("+++++++++++++++++++++++++++++++++++++++"+addProduct);
		
		return "redirect:/product/option";
	}
		
	// 상품 옵션 목록  
	@RequestMapping(value = "/product/option", method=RequestMethod.GET)
	public String optionList(Model model) {
		logger.info("optionList()");
		int categoryNo = (int) addProduct.get("categoryNo");

		List<OptionBase> optionList = addProductService.selectOption(categoryNo);

		model.addAttribute("optionList", optionList);
		
		return "/product/addOption";
	}


	// 상품 옵션 저장
	@RequestMapping(value = "/product/option/register")
	public ModelAndView getOption(@RequestParam(value="categoryNo") int categoryNo, @RequestParam(value="optionName") String optionName, @RequestParam(value="optionValue") int optionValue,ModelAndView mav) {
		
		OptionBase option = new OptionBase();
		option.setCategoryNo(categoryNo);
		option.setoptionName(optionName);
		option.setOptionValue(optionValue);
		
		addProductService.addOption(option);
		List<OptionBase> optionList = addProductService.selectOption(categoryNo);
		mav.addObject("optionList", optionList);
		mav.setViewName("jsonView");
		
		return mav;
	}

	@RequestMapping(value = "/product/saveOptionMap", method=RequestMethod.POST)
	public String addOptionProc(HttpServletRequest req, HttpSession session) {
		logger.info("addOptionProc()");
		List optionBase = new ArrayList();
		
		String[] option = req.getParameterValues("optionNo");
		for(int i=0;i<option.length;i++) {
			System.out.println(option[i]);	
			optionBase.add(option[i]);
		}
		
		addProduct.put("option", optionBase);
//		System.out.println(addProduct);
		session.setAttribute("addProduct", addProduct);

		return "redirect:/product/addShop";
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
		model.addAttribute("page", 4);
	}
	
	@RequestMapping(value="/product/addShop", method=RequestMethod.POST)
	public String addProductFinal(HttpSession session) {
		
		addProductService.addProduct(session);
		
		return "redirect:/product/index";
	}
	
	@RequestMapping(value = "/product/upload")
	public ModelAndView uploadExcel(MultipartHttpServletRequest request) {
		
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
        
        addProductService.insertMassiveProduct(destFile);
        
//      FileUtils.deleteFile(destFile.getAbsolutePath());
        
        ModelAndView view = new ModelAndView();
        
        view.setViewName("redirect:/manageProduct/list");
        
        return view;
	}
	
	
}
