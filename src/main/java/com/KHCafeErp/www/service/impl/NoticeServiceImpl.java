package com.KHCafeErp.www.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.NoticeDao;
import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.service.face.NoticeService;
import com.KHCafeErp.www.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired private NoticeDao noticeDao;
	
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
		int totalCount = noticeDao.selectCntAll(map);
				
		Paging paging = new Paging(totalCount, data.getCurPage());
		paging.setSearch(map);
				
		//검색어
		System.out.println("MAP : " +map);

		return paging;
	}

	@Override
	public List<NoticeBoard> list(Paging paging) {
		
		return noticeDao.selectPageList(paging);
	}

	@Override
	public void write(NoticeBoard board) {
		
		noticeDao.insert(board);
		
	}

	@Override
	public String getStaffName(NoticeBoard staffNo) {
		
		return noticeDao.selectStaffName(staffNo);
	}

	@Override
	public int getShopNo(int staffNo) {
		return noticeDao.selectShopNo(staffNo);
	}

	@Override
	public NoticeBoard boardView(NoticeBoard viewBoard) {
		
		return noticeDao.selectBoardByBoardNo(viewBoard);
		
	}

	@Override
	public void update(NoticeBoard board) {
		
		noticeDao.update(board);
		
	}

	@Override
	public void delete(NoticeBoard board) {
		
		noticeDao.delete(board);
		
	}
	

}
