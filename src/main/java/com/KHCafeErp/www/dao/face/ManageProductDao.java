package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface ManageProductDao {
	/**
	 * 상품정보에 업데이트된 카테고리 정보를 업데이트 한다
	 * @param category - 업데이트할 카테고리 정보
	 */
	public void updateCategoryDetail(CategoryDetail category);
	/**
	 * 상품정보를 업데이트한다
	 * @param product - 업데이트할 상품정보
	 */
	public void updateProduct(Product product);
	/**
	 * 등록되있는 상품 목록 불러오기
	 * @return - 상품 목록
	 */
	public List<Product> selectProductAll();
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
}
