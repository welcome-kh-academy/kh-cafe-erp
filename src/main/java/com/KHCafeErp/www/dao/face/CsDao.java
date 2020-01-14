package com.KHCafeErp.www.dao.face;

import java.util.List;
import java.util.Map;

import com.KHCafeErp.www.dto.CounselBoard;
import com.KHCafeErp.www.util.Paging;

public interface CsDao {

	public int selectCntAll(Map<String, String> search);

	public List<CounselBoard> selectPageList(Paging paging);

	public CounselBoard selectBoardByBoardNo(CounselBoard cBoard);

	public String selectStaffName(int staffNo);

	public int selectShopNo(int staffNo);

	public CounselBoard selectCusNo(String cusId);

	public void insertBoard(CounselBoard cBoard);

	public void delete(CounselBoard counselBoard);

	public void update(CounselBoard cBoard);

	public List<CounselBoard> selectCsList(CounselBoard counselBoard);

}
