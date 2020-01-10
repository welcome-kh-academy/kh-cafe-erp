package com.KHCafeErp.www.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.util.Paging;

public interface ManageProductService {
	
	
	/**
	 * 상품의 사진을 받아온다
	 * @param productNo - 상품의 사진을 받을 상품 번호
	 * @return - 상품의 사진
	 */
	public ImgFile getImgFile(int productNo);
	/**
	 * 페이징
	 * @param Curpage - 현재 페이지 값 가져오기
	 * @return - 페이지 결과
	 */
	public Paging getPaging(Paging page, Product product);
	/**
	 * 상품을 목록에서 삭제한다
	 * @param product - 삭제할 상품 번호
	 */
	public void deleteProduct(Product product);
	/**
	 * 검색 결과를 가져온다
	 * @param product - 검색 조건 값들
	 * @return - 검색 결과
	 */
//	public List<Product> searchList(Product product);
	/**
	 * 상품판매 시작날짜를 등록한다
	 * @param product - 상품 판매 시작 날짜
	 */
	public void editSelStartDate(Product product);
	/**
	 * 상품판매 종료날짜를 등록한다
	 * @param product - 상품 판매 종료 날짜
	 */
	public void editSelEndDate(Product product);
	/**
	 * 상품 정보를 수정한다
	 * @param product - 수정할 상품 데이터
	 * @param imgFile 
	 * @param imgFile 
	 */
	public void editProduct(Product product);
	/**
	 * 등록되있는 상품 목록 불러오기 및 검색조건 
	 * @return - 상품 목록
	 */
	public List<Product> getProductList(Paging paging, Product product);
	/**
	 * 지점 목록 불러오기
	 * @return - 지점 목록
	 */
	public List<Shop> getShopList();
	/**
	 * 카테고리 리스트 불러오기
	 * @return - 기본 카테고리 목록
	 */
	public List<CategoryBase> getcategoryList();
	/**
	 * 세부 카테고리 리스트 불러오기
	 * @return - 세부카테고리 목록
	 */
	public List<CategoryDetail> getcategoryDetailList(int categoryNo);

	public Product getProduct(int productNo);
	
	/**
	 * 20-01-05 유진
	 * 상품 전체 목록 조회
	 * @return - 상품 전체 목록
	 */
	public List<Product> getList();
	/**
	 * 검색 조건으로 목록을 가져온다
	 * @param product - 검색조건
	 * @return - 조건에 맞는 목록
	 */
	public List<Product> getProductList(Product product);
	/**기본 리스트를 불러온다 (페이징 없이)
	 * 
	 * @return - 상품 목록리스트
	 */
	public List<Product> getProductListAll();
	/**
	 * 샵 번호로 샵 이름을 가져온다
	 * @param shopNo - 로그인한 샵 번호
	 * @return - 샵에대한 정보
	 */
	public Shop getShopName(int shopNo);
	/**
	 * 이미지 파일을 수정한다
	 * @param file - 수정할 파일 정보
	 * @return 
	 */
	public ImgFile editFile(ImgFile file, int productNo);
}
