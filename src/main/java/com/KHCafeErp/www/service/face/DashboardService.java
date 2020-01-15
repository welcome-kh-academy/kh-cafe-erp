package com.KHCafeErp.www.service.face;

import java.util.List;

import com.KHCafeErp.www.dto.NoticeBoard;

public interface DashboardService {

	/**
	 * 20-01-15 유진
	 * 공지사항 목록 불러오기
	 * @return - 공지사항 리스트
	 */
	public List<NoticeBoard> getNoticeList();

}
