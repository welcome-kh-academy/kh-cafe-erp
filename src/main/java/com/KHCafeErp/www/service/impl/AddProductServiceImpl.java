package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

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
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.AddProductService;

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

}
