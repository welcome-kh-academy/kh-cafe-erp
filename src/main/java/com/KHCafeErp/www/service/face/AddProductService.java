package com.KHCafeErp.www.service.face;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.OptionBase;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface AddProductService {
	
	/**
	 * 19-12-26 동산
	 * 지점들의 목록을 불러온다
	 * @return - 지점 목록
	 */
	public List<Shop> getShopList();

	/**
	 * 상품 옵션 목록 조회
	 * @param categoryNo
	 * @return
	 */
	public List<OptionBase> selectOption(int categoryNo);

	/**
	 * 19-12-26 현석
	 * 카테고리 목록 가져오기
	 * @return - Category 리스트
	 */
	public List<CategoryBase> getCategoryList();

	/**
	 * 19-12-26 유진
	 * 옵션 추가하기
	 * @param option - 입력한 option
	 */
	public void addOption(OptionBase option);
	
	/**
	 * 19-12-26 현석
	 * 상품명으로 카테고리 불러오기
	 * @param product
	 * @return Category
	 */
	public CategoryBase getCategory(Product product);

	/**
	 * 19-12-27 현석
	 * 카테고리 상세목록 가져오기
	 * @param value
	 * @return CategoryDetail List
	 */
	public List<CategoryDetail> getCategoryDetail(int categoryNo);

	/**
	 * 이미지 파일 서버에 저장
	 * @param imgFile - 업로드한 이미지 파일
	 * @return - 이미지 파일
	 */
	public ImgFile filesave(ImgFile imgFile);

	/**
	 * 카테고리 이름 조회하기
	 * @param categoryBaseNo - 카테고리 No
	 * @return - 조회된 카테고리 이름
	 */
	public String getCategoryBaseName(int categoryBaseNo);

	/**
	 * 상세 카테고리 이름 조회하기
	 * @param categoryDetailNo - 상세 카테고리 No
	 * @return - 조회된 카테고리 이름
	 */
	public String getCategoryDetailName(int categoryDetailNo);

	/**
	 * 선택한 option들 받아오기
	 * @param req - addOption.jsp에서 넘어온 request
	 * @return - 선택한 옵션들
	 */
	public Map<String, String> getOption(HttpServletRequest req);

	public void insertMassiveProduct(File destFile);

	/**
	 * 2020-01-02
	 * 서현석
	 * 
	 * 상품 추가하기 최종 단계!
	 * @param session - 세션에 상품정보 담겨있음
	 */
	public void addProduct(HttpSession session);

	/**
	 * 2020-01-03
	 * 서현석
	 * 
	 * 상품 목록 불러오기
	 * @return List<Product>
	 */
	public List<Product> getPrdList();
	
}
