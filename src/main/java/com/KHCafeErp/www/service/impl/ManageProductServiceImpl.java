package com.KHCafeErp.www.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.KHCafeErp.www.dao.face.ManageProductDao;
import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ManageProductService;
import com.KHCafeErp.www.util.Paging;
@Service
public class ManageProductServiceImpl implements ManageProductService{
	
	@Autowired ManageProductDao manageProductDao;
	@Autowired ServletContext context;
	
	@Override
	public ImgFile editFile(ImgFile file, int productNo) {
		
		String originName = file.getProductImage().getOriginalFilename();
		
		int isSuccess = 0; //업데이트 성공? = 1 or 실패 = 0
		
		if(originName != null) {
		
			// 파일이 저장될 경로
			String storedPath = context.getRealPath("upload");
			System.out.println("aaaaaaaaaaaaaaaaaaaaa "+ file.getProductImage().getOriginalFilename());
			// UUID
			String uid=UUID.randomUUID().toString().split("-")[4];
			
			// 저장될 파일의 이름 (원본명+UUID)
			String filename = uid+"_"+originName;
			// 저장될 파일 객체
			File dest = new File(storedPath, filename);
			
			System.out.println(dest);
			System.out.println(filename);
			
			try {
				file.getProductImage().transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			ImgFile newfile = new ImgFile();
			newfile.setOriginName(file.getProductImage().getOriginalFilename());
			newfile.setStoredName(filename);
			newfile.setProductNo(productNo);
			System.out.println("ddddddddddddddddddddddddddddddddddddd"+ newfile.toString());
			
			int fileno = manageProductDao.selectCntFileByProductNo(productNo);
			if( fileno == 0 ) {
				manageProductDao.insertImgFile(newfile);
			} else {
				manageProductDao.deleteFile(productNo);
				manageProductDao.insertImgFile(newfile);
			}
			
			return newfile;
		}
		
		return null;
		
	}

	
	@Override
	public Shop getShopName(int shopNo) {
		return manageProductDao.selectShopName(shopNo);
	}
	
	@Override
	public List<Product> getProductListAll() {
		return manageProductDao.selectProductListAllWithoutPaging();
	}
	
	@Override
	public List<Product> getProductList(Product product) {
		List<Product> productSearchList = manageProductDao.selectSearchList(product);
 		return productSearchList;
	}
	
	@Override
	public ImgFile getImgFile(int productNo) {
		return manageProductDao.selectImgFile(productNo);
	}
	
	@Override
	public Paging getPaging(Paging page, Product product) {
		
		
		int totalCount = manageProductDao.selectCntAll(product);
		
		
		Paging paging = new Paging (totalCount, page.getCurPage());
		
		return paging;
	}
	
	@Override
	public void deleteProduct(Product product) {
		manageProductDao.deleteFile(product.getProductNo());
		manageProductDao.deleteProductDetail(product);
		manageProductDao.deleteOrderProduct(product);
		manageProductDao.deleteProduct(product);
	}
	
//	@Override
//	public List<Product> searchList(Product product) {
//	
//		return manageProductDao.selectSearchList(product);
//	}

	@Override
	public void editSelStartDate(Product product) {
		manageProductDao.updateSelStartDate(product);
	}

	@Override
	public void editSelEndDate(Product product) {
		manageProductDao.updateSelEndDate(product);
	}

	@Override
	public void editProduct(Product product) {
		manageProductDao.updateProduct(product);
//		
//		if(imgFile.getOriginName() != null) {
//			
//			// 파일이 저장될 경로
//			String storedPath = context.getRealPath("upload");
//			System.out.println("aaaaaaaaaaaaaaaaaaaaa "+ imgFile.getProductImage().getOriginalFilename());
//			// UUID
//			String uid=UUID.randomUUID().toString().split("-")[4];
//			
//			// 저장될 파일의 이름 (원본명+UUID)
//			String filename = uid+"_"+imgFile.getOriginName();
//			// 저장될 파일 객체
//			File dest = new File(storedPath, filename);
//			
//			try {
//				imgFile.getProductImage().transferTo(dest);
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			ImgFile file = new ImgFile();
//			file.setOriginName(imgFile.getProductImage().getOriginalFilename());
//			file.setStoredName(filename);
//			
//			Map<String, Object> map = new HashMap<>();
//			map.put("product", product);
//			map.put("file", file);
//			manageProductDao.updateImgFile(map);
//		}
	}
	
	@Override
	public List<Product> getProductList(Paging paging, Product product) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("product", product);
		
		return manageProductDao.selectProductAll(map);
	}
	
	@Override
	public List<Shop> getShopList() {
		return manageProductDao.selectShopAll();
	}
	@Override
	public List<CategoryDetail> getcategoryDetailList(int categoryNo) {
		return manageProductDao.selectCategoryDetail(categoryNo);
	}
	
	@Override
	public List<CategoryBase> getcategoryList() {
		return manageProductDao.selectCategoryAll();
	}
	
	@Override
	public Product getProduct(int productNo) {
		return manageProductDao.selectProductByProductNo(productNo);
	}

	@Override
	public List<Product> getList() {
		return manageProductDao.selectList();
	}
}
