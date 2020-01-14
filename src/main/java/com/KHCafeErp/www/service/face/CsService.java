package com.KHCafeErp.www.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.KHCafeErp.www.dto.CounselBoard;
import com.KHCafeErp.www.util.Paging;

public interface CsService {

	public Paging getPaging(Paging data, HttpServletRequest req);

	public List<CounselBoard> list(Paging paging);

	public CounselBoard boardView(CounselBoard cBoard);

	public String getStaffName(int staffNo);

	public int getShopNo(int staffNo);

	public void write(CounselBoard cBoard);

	public CounselBoard getCusNo(String cusId);

	public void delete(CounselBoard counselBoard);

	public void update(CounselBoard cBoard);

	public List<CounselBoard> getCsList(CounselBoard counselBoard);

}
