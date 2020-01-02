package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.AddProductDao;
import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.OptionBase;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.ProductOption;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.AddProductService;
import com.KHCafeErp.www.util.ExcelRead;
import com.KHCafeErp.www.util.ReadOption;

@Service
public class AddProductServiceImpl implements AddProductService {

	@Autowired AddProductDao addProductDao;
	@Autowired ServletContext context;
	
	private static final Logger logger = LoggerFactory.getLogger(AddProductServiceImpl.class);
	
	@Override
	public List<Shop> getShopList() {
		return addProductDao.selectShopList();
	}
	
	@Override
	public List<OptionBase> selectOption(int categoryNo) {
		return addProductDao.selectOption(categoryNo);
	}


	@Override
	public List<CategoryBase> getCategoryList() {
		return addProductDao.selectCategoryList();
	}

	@Override
	public void addOption(OptionBase option) {
		addProductDao.insertOption(option);
	}
	public CategoryBase getCategory(Product product) {
		return addProductDao.selectCategory(product);
	}

	@Override
	public List<CategoryDetail> getCategoryDetail(int categoryNo) {
		return addProductDao.selectCategoryDetailList(categoryNo);
	}

	@Override
	public ImgFile filesave(ImgFile imgFile) {
		logger.info(context.getRealPath("TEST"));
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		// UUID
		String uid=UUID.randomUUID().toString().split("-")[4];
		
		// 저장될 파일의 이름 (원본명+UUID)
		String filename = uid+"_"+imgFile.getProductImage().getOriginalFilename();
		
		// 저장될 파일 객체
		File dest = new File(storedPath, filename);
		
		try {
			imgFile.getProductImage().transferTo(dest);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ImgFile file = new ImgFile();
		file.setOriginName(imgFile.getProductImage().getOriginalFilename());
		file.setStoredName(filename);
		
		return file;
	}

	@Override
	public String getCategoryBaseName(int categoryBaseNo) {
		return addProductDao.selectCategoryBaseName(categoryBaseNo);
	}

	@Override
	public String getCategoryDetailName(int categoryDetailNo) {
		return addProductDao.selectCategoryDetailName(categoryDetailNo);
	}

	@Override
	public Map<String, String> getOption(HttpServletRequest req) {
		Map<String, String> option = new HashMap<String, String>();
		String optionName = null;
		int optionValue = 0;
		
		int cnt = 0;
//		int cnt = Integer.parseInt(req.getParameter("count"));
//		System.out.println("********************************************* "+cnt);
		
		Enumeration params = req.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
			String name = (String)params.nextElement();
			System.out.println(name + " : " +req.getParameter(name));
			option.put(name, req.getParameter(name));
		}
		System.out.println("----------------------------");
		System.out.println(option);
		
		return option;
	}

	@Override
	public void insertMassiveProduct(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);

//		Product product = null;
		
		for(Map<String, String> article : excelContent){
		   
			Product product = new Product();
		   
			product.setCategoryMapNo((int)Float.parseFloat(article.get("A")));
			product.setShopNo((int)Float.parseFloat(article.get("B")));
		   	product.setProductName(article.get("D"));
		   	product.setProductContent(article.get("E"));
		   	product.setOriginPrice((int)Float.parseFloat(article.get("F")));
		   	product.setPrice((int)Float.parseFloat(article.get("G")));
		   	product.setProductOrigin(article.get("H"));
		   	product.setSelStartDate(article.get("I"));
		   	product.setSelEndDate(article.get("J"));
		   	product.setSelStatus((int)Float.parseFloat(article.get("K")));
		   
		   	System.out.println(product);
		   
		   	addProductDao.insertProduct(product);
		   	
		   	ProductOption productOption = new ProductOption();
		   	String productName = product.getProductName();
		   	
		   	int productNo = addProductDao.getProductNo(productName);
		   	System.out.println(productNo);
		   	
		   	productOption.setProductNo(productNo);
		   	productOption.setOptionNo((int)Float.parseFloat(article.get("C")));
		   	
		   	System.out.println(productOption);
		   	
		   	addProductDao.insertProductOption(productOption);

		  }
		System.out.println(excelContent);

	}

	@Override
	public void addProduct(HttpSession session) {

		Map map = (HashMap)session.getAttribute("addProduct");

		Product product = new Product();
		
		product.setCategoryMapNo((int)map.get("categoryMapNo"));
		product.setPrice((int)map.get("price"));
		product.setProductContent((String)map.get("productContent"));
		product.setCategoryNo((int)map.get("categoryNo"));
		product.setProductOrigin((String)map.get("productOrigin"));
		product.setOriginPrice((int)map.get("originPrice"));
		product.setCategoryName((String)map.get("categoryName"));
		product.setProductName((String)map.get("productName"));

		//가짜데이터
		product.setShopNo(11);
		product.setSelStartDate("20200101");
		product.setSelEndDate("20200101");
		product.setSelStatus(1);
		
		//상품등록
		addProductDao.insertProduct(product);
		
		//상품번호 구하기
	   	int productNo = addProductDao.getProductNo((String)map.get("productName"));
		product.setProductNo(productNo);
		
		ProductOption productOption = new ProductOption();
		
		List optionNo = (ArrayList)map.get("option");
		for(Object i : optionNo) {
			
			productOption.setProductNo(productNo);
			productOption.setOptionNo(Integer.parseInt((String) i)); 
			
			//상품옵션 등록
			addProductDao.insertProductOption(productOption);
		}
		
	}
}
