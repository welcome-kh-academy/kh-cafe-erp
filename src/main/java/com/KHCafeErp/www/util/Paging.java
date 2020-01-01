package com.KHCafeErp.www.util;

import java.util.Map;

public class Paging {

	private int curPage; 

	private int totalCount; 
	
	private int listCount; 
	private int totalPage; 

	private int pageCount;
	private int startPage; 
	private int endPage;

	private int startNo; 
	private int endNo; 
	
	private Map<String, String> search; //검색조건

	public Paging(int totalCount) {
		this.setTotalCount(totalCount);
		
		this.makePaging();
	}
	
	public Paging(int totalCount, int curPage) {
		this.setTotalCount(totalCount);
		this.setCurPage(curPage);

		this.makePaging();
	}
	
	public Paging(int totalCount, int curPage, int listCount) {
		this.setTotalCount(totalCount);
		this.setCurPage(curPage);
		this.setListCount(listCount);
		
		this.makePaging();
	}
	
	public Paging(int totalCount, int curPage, int listCount, int pageCount) {
		this.setTotalCount(totalCount);
		this.setCurPage(curPage);
		this.setListCount(listCount);
		this.setPageCount(pageCount);
		
		this.makePaging();
	}
	
	private void makePaging() {
		if(totalCount == 0) return;
		
		if(curPage == 0) setCurPage(1); 
		if(pageCount == 0) setPageCount(10);
		if(listCount == 0) setListCount(10);
	
		totalPage = totalCount / listCount;
		if(totalCount % listCount > 0) totalPage++;
		
		if(totalPage < curPage) curPage = totalPage;
		
		startPage = ((curPage-1)/pageCount) * pageCount + 1;
        endPage = startPage + pageCount - 1;

        if(endPage > totalPage ) endPage = totalPage;
        
        startNo = (curPage-1) * listCount + 1;
        endNo = curPage * listCount;
	}

	@Override
	public String toString() {
		return "Paging [curPage=" + curPage + ", totalCount=" + totalCount + ", listCount=" + listCount + ", totalPage="
				+ totalPage + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startNo=" + startNo + ", endNo=" + endNo + ", search=" + search + "]";
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public Map<String, String> getSearch() {
		return search;
	}

	public void setSearch(Map<String, String> search) {
		this.search = search;
	}
	
}
