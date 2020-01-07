package com.KHCafeErp.www.dao.face;

import java.util.List;
import java.util.Map;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.OptionBase;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.ProductDetail;
import com.KHCafeErp.www.dto.ProductOption;
import com.KHCafeErp.www.dto.Shop;

public interface AddProductDao {
	/**
	 * 20-01-03
	 * 상품의 이미지파일을 저장한다
	 * @param imgFile - 저장할 이미지 파일
	 */
	public void insertImgFile(ImgFile imgFile);
	
	/**
	 * 19-12-26
	 * 지점의 목록을 가져온다
	 * @return - 지점 목록
	 */
	public List<Shop> selectShopList();

	/**
	 * 19-12-24 유진
	 * 상품 옵션 조회
	 * @return - Option 리스트
	 */
	public List<OptionBase> selectOption(int categoryNo);

	/**
	 * 19-12-26 현석
	 * 카테고리 목록 불러오기
	 * @return - List<CategoryBase> 카테고리 목록
	 */
	public List<CategoryBase> selectCategoryList();


	public void insertOption(OptionBase option);
	/**
	 * 19-12-26 현석
	 * 상품검색으로 카테고리 가져오기
	 */
	public Map selectCategory(Product product);

	/**
	 * 19-12-26 현석
	 * 카테고리 넘버로 카테고리 상세목록 가져오기
	 * @param categoryNo
	 * @return
	 */
	public List<CategoryDetail> selectCategoryDetailList(int categoryNo);

	/**
	 * 카테고리 이름 조회
	 * 2019-12-30 서현석
	 * 
	 * @param categoryBaseNo - 카테고리 No
	 * @return - 카테고리 이름
	 */
	public String selectCategoryBaseName(int categoryBaseNo);

	/**
	 * 상세 카테고리 조회
	 * 2019-12-30 서현석
	 * 
	 * @param categoryDetailNo - 상세 카테고리 No
	 * @return - 상세 카테고리 이름
	 */
	public String selectCategoryDetailName(int categoryDetailNo);

	public int getProductNo(String productName);


	public void insertProductDetail(ProductDetail productDetail);

	/**
	 * 상품상세정보 등록하기
	 * 2020-01-06 서현석
	 * 
	 * @param productDetail
	 */
	public void insertAllProductDetail(List<ProductDetail> productDetail);


	/**
	 * 상품정보 등록하기
	 * 2020-01-01 서현석
	 * 
	 * @param product - 세션에 담긴 상품정보
	 */
	public void insertProduct(Product product);

	/**
	 * 전체 상품 목록 불러오기
	 * 2020-01-03 서현석
	 * @return List<product> - 전체상품목록
	 */
	public List<Product> selectPrdList();
}
