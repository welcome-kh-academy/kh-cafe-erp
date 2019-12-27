package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface ManageProductService {
	/**
	 * 등록되있는 상품 목록 불러오기
	 * @return - 상품 목록
	 */
	public List<Product> getProductList();
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
}
