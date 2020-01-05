package com.KHCafeErp.www.dao.face;

import java.util.List;
import java.util.Map;

import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.util.Paging;

public interface NoticeDao {
	
	/**
	 * 지재용
	 * 2019-12-30
	 * 
	 * 총 게시글 수 조회
	 * 
	 * @return int - 총 게시글 수
	 */
//	public int selectCntAll();
	
	/**
	 * 지재용
	 * 2020-01-04
	 * 
	 * 검색어를 이용한 총 게시글 수 조회
	 * 
	 * @return int - 총 게시글 수
	 */
	public int selectCntAll(Map<String, String> search);
	
	/**
	 * 지재용
	 * 2019-12-30
	 * 
	 * 페이징 대상 게시글 목록 조회
	 * 
	 * @param Paging - 페이징 정보
	 * @return List - 조회된 게시글 목록
	 */
	public List<NoticeBoard> selectPageList(Paging paging);
	
	/**
	 * 지재용
	 * 2019-12-31
	 * 
	 * 게시글 입력
	 * 
	 * @param board - 삽입될 게시글 내용
	 */
	public void insert(NoticeBoard board);
	
	/**
	 * 지재용
	 * 2020-01-01
	 * 
	 * 직원이름조회
	 * 
	 * @param staffNo - 직원번호(아이디)
	 * @return NoticeBoard- 게시글 정보
	 */
	public String selectStaffName(NoticeBoard staffNo);

	/**
	 * 지재용
	 * 2020-01-01
	 * 
	 * 지점번호조회
	 * 
	 * @param staffNo - 직원번호(아이디)
	 * @return shopNo - 지점번호
	 */
	public int selectShopNo(int staffNo);
	
	/**
	 * 지재용
	 * 2020-01-02
	 * 
	 * 상세보기 게시글 조회
	 * 
	 * @param viewBoard - 조회 대상
	 * @return Board - 게시글 조회 결과
	 */
	public NoticeBoard selectBoardByBoardNo(NoticeBoard viewBoard);
	
	/**
	 * 지재용
	 * 2020-01-02
	 * 
	 * 게시글 수정
	 * 
	 * @param board - 수정될 게시글 내용
	 */
	public void update(NoticeBoard board);
	
	/**
	 * 지재용
	 * 2020-01-02
	 * 
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 객체
	 */
	public void delete(NoticeBoard board);

	

}
