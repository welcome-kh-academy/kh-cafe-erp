package com.KHCafeErp.www.service.face;

import java.io.File;
import java.util.List;

import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.ReleaseProduct;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.util.Paging;

public interface ReleaseProductService {

	/**
	 * 19-12-31 유진
	 * 엑셀 파일 받아오기
	 * @param destFile - 업로드한 엑셀 파일
	 */
	public void insertMassiveProduct(File destFile);

	/**
	 * 20-01-01 유진
	 * 발주 목록에 나타낼 발주 조회
	 * @return - 발주 목록
	 */
	public List<Release> getReleaseList(Release release);

	/**
	 * 20-01-03 유진
	 * 페이징 처리
	 * @param curPage - 현재 페이지
	 * @param release - 출고 정보
	 * @return - Paging 객체
	 */
	public Paging getPaging(int curPage, Release release);

	public List<Release> getList();

	public List<Shop> getShopList();

	public List<Integer> getPlacingOrderNo();

	public void insertRelease(int placingOrderNo);

	public void insertReleaseProduct(Ingredient ingredient);

	public int getReleaseNo(int placingOrderNo);

	public List<Ingredient> getReleaseProductList(int placingOrderNo);

	public List<ReleaseProduct> getReleseProduct(Release release);

	public PlacingOrder getReleaseInfo(Release release);

	public void updateRelease(List releaselist);

	public void updateReleaseTotalCnt(int releaseNo);

	public String getReleaseTotalCnt(int releaseNo);

	public String getAfterReleaseCnt(int releaseNo);

	public void updateReleaseStatus1(int releaseNo);

	public void updateReleaseStatus2(int releaseNo);

	public void updatePlacingOrderStatus(int placingOrderNo);
	/**
	 * 출고가 목록 불러오기
	 * @return - 출고가 목록
	 */
	public List<ReleaseProduct> getReleaseProductListAll();


}
