package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.NoticeBoard;

public interface DashboardDao {

	/**
	 * 20-01-15 유진
	 * 공지사항 목록 조회
	 * @return - 공지사항 목록
	 */
	public List<NoticeBoard> getNoticeList();

}
