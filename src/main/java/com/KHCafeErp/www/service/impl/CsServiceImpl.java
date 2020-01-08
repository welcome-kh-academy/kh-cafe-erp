package com.KHCafeErp.www.service.impl;

import java.util.List;
import java.util.Map;

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
	public Paging getPaging(Paging data) {
		//검색어
		Map<String, String> search = data.getSearch(); 
				
		int totalCount = csDao.selectCntAll(search);
				
		Paging paging = new Paging(totalCount, data.getCurPage());
				
		//검색어
		paging.setSearch(search);
				
		return paging;
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

		System.out.println("cccccccccccccccccc "+cBoard);
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
