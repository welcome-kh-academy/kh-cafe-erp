package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.util.Paging;

public interface NoticeService {
	
	/**
	 * 지재용
	 * 2019-12-30
	 * 
	 * @param inData - 요청정보 객체
	 * @return Paging - 페이징 정보
	 */
	public Paging getPaging(Paging inData);
	
	/**
	 * 지재용
	 * 2019-12-30
	 * 
	 * 페이징 정보를 활용하여 보여질 게시글 목록만 조회
	 *  
	 * @param Paging - 페이징 정보
	 * @return List - 게시글 목록
	 */
	public List<NoticeBoard> list(Paging paging);
	
	/**
	 * 지재용
	 * 2019-12-31
	 * 
	 * 게시글 작성
	 * 	 
	 * @param board - 요청정보 객체(게시글내용 + 첨부파일)
	 * 
	 */
	public void write(NoticeBoard board);
	
	/*
	 * 지재용
	 * 2020-01-01
	 * 
	 * 글쓰기 작성자 불러오기
	 * 
	 * @param staffNo - 직원번호(아이디)
	 * @return NoticeBoard - 게시글 정보
	 */
	public String getStaffName(NoticeBoard staffNo);

	/**
	 * 지재용
	 * 2020-01-01
	 * 
	 * 직원이 속한 지점번호 불러오기
	 * 
	 * @param staffNo - 직원번호(아이디)
	 * @return shopNo - 지점번호
	 */
	public int getShopNo(int staffNo);
	
	/**
	 * 지재용
	 * 2020-01-02
	 * 
	 * 게시판 상세보기
	 * 
	 * @param viewBoard - 상세보기할 nBoardno를 가진 객체
	 * @return NoticeBoard - 상세보기할 게시글 조회 결과
	 */
	public NoticeBoard boardView(NoticeBoard viewBoard);

}
