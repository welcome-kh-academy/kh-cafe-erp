package com.KHCafeErp.www.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.CsDao;
import com.KHCafeErp.www.dto.CounselBoard;
import com.KHCafeErp.www.service.face.CsService;
import com.KHCafeErp.www.util.Paging;

@Service
public class CsServiceImpl implements CsService {

	@Autowired CsDao csDao;
	
	@Override
	public Paging getPaging(Paging data, HttpServletRequest req) {
		//검색어
		Map<String, String> map = new HashMap<String, String>();
				
		String searchType = req.getParameter("searchType");
		System.out.println(searchType);
		String searchContent = req.getParameter("searchContent");
		System.out.println(searchContent);
		
		if(searchType!=null & !"".equals(searchType)) {
	         map.put("searchType",searchType);
	      }
	      
	      if(searchContent!=null && !"".equals(searchContent)) {
	         map.put("searchContent", searchContent);
	      }
		System.out.println(map);
		int totalCount = csDao.selectCntAll(map);
				
		Paging paging = new Paging(totalCount, data.getCurPage());
		paging.setSearch(map);
				
		//검색어
		System.out.println("MAP : " +map);

		return paging;
	}

	@Override
	public List<CounselBoard> getCsList(CounselBoard counselBoard) {
		return csDao.selectCsList(counselBoard);
	}
	
	@Override
	public List<CounselBoard> list(Paging paging) {
		return csDao.selectPageList(paging);
	}

	@Override
	public CounselBoard boardView(CounselBoard cBoard) {
		return csDao.selectBoardByBoardNo(cBoard);
	}

	@Override
	public String getStaffName(int staffNo) {
		return csDao.selectStaffName(staffNo);
	}

	@Override
	public int getShopNo(int staffNo) {
		return csDao.selectShopNo(staffNo);
	}

	@Override
	public void write(CounselBoard cBoard) {
		if(cBoard.getcBoardTitle()==null || "".equals(cBoard.getcBoardTitle())) {
			cBoard.setcBoardTitle("[제목 없음]");	
		}
		csDao.insertBoard(cBoard);
	}

	@Override
	public CounselBoard getCusNo(String cusId) {
		return csDao.selectCusNo(cusId);
	}

	@Override
	public void delete(CounselBoard counselBoard) {
		csDao.delete(counselBoard);
	}

	@Override
	public void update(CounselBoard cBoard) {
		csDao.update(cBoard);
	}

}
