package com.KHCafeErp.www.dao.face;

import java.util.List;
import java.util.Map;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface ManageProductDao {
	/**
	 * 페이징없는 목록 리스트 불러오기
	 * @return - 목록
	 */
	public List<Product> selectProductListAllWithoutPaging();
	/**
	 * 상품의 사진을 받아온다
	 * @param productNo - 상품의 사진을 받아올 상품 번호
	 * @return - 상품의 사진
	 */
	public ImgFile selectImgFile(int productNo);
	
	public int selectCntAll(Product product);
	/**
	 * 상품을 목록에서 삭제한다
	 * @param prouduct - 삭제할 상품 번호
	 */
	public void deleteProduct(Product product);
	/**
	 * 검색조건으로 검색결과를 가져온다
	 * @param product - 검색 조건 값들
	 * @return - 검색 결과 리스트
	 */
//	public List<Product> selectSearchList(Product product);
	/**
	 * 상품판매 시작 날짜를 업데이트 한다
	 * @param product - 업데이트할 날짜 정보
	 */
	public void updateSelStartDate(Product product);
	/**
	 * 상품판매 종료 날짜를 업데이트 한다
	 * @param product - 업데이트할 날짜 정보
	 */
	public void updateSelEndDate(Product product);
	/**
	 * 상품정보를 업데이트한다
	 * @param product - 업데이트할 상품정보
	 */
	public void updateProduct(Product product);
	/**
	 * 등록되있는 상품 목록 불러오기
	 * @return - 상품 목록
	 */
	public List<Product> selectProductAll(Map<String, Object> map);
	/**
	 * 지점 목록 불러오기
	 * @return - 지점 목록
	 */
	public List<Shop> selectShopAll();
	/**
	 * 카테고리 목록 가져오기
	 * @return - 카테고리 목록
	 */
	public List<CategoryBase> selectCategoryAll();
	/**
	 * 세부 카테고리 목록 가져오기
	 * @return - 세부 카테고리 목록
	 */
	public List<CategoryDetail> selectCategoryDetail(int categoryNo);

	public Product selectProductByProductNo(int productNo);
	
	/**
	 * 20-01-05 유진
	 * 상품 전체 목록 조회
	 * @return - 상품 전체 목록
	 */
	public List<Product> selectList();
	/**
	 * 검색조건으로 상품목록을 가져온다
	 * @param product - 검색조건
	 * @return - 조건에 맞는 상품목록
	 */
	public List<Product> selectSearchList(Product product);
	/**
	 * 리스트를 전체 불러온다 . 페이징 없이
	 * @param product - 
	 * @return
	 */
	public List<Product> selectProductListAll(Product product);
	/**
	 * 샵번호로 샵정보를 받아온다
	 * @param shopNo - 로그인한 샵 번호
	 * @return - 샵 정보
	 */
	public Shop selectShopName(int shopNo);
	/**
	 * 상품 정보 수정 시, 이미지 파일도 수정한다
	 * @param product - 이미지 파일을 수정 할 상품 번호
	 * @param map 
	 */
//	public void updateImgFile(Map<String, Object> map);
	/**
	 * 사진만 따로 업로드....
	 * @param newfile - 업데이트할 사진
	 */
	public void insertImgFile(ImgFile newfile);
	/**
	 * 해당 상품 정보에 기존의 이미지가 존재하는지 확인한다
	 * @param productNo - 해당 상품의 번호
	 * @return - 헤당 상품의 파일 정보
	 */
	public int selectCntFileByProductNo(int productNo);
	/**
	 * 해당 상품 정보의 기존 이미지를 삭제한다
	 * @param productNo - 해당 상품의 상품번호
	 */
	public void deleteFile(int productNo);
}
