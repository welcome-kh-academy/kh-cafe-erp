package com.KHCafeErp.www.dao.face;

import java.util.List;
import java.util.Map;

import com.KHCafeErp.www.util.DateTerm;

public interface StatisticsDao {

	/**
	 * shopNo로 통계자료 가지고 오기
	 * 2020-01-12 서현석
	 * 
	 * @param shopNo
	 * @return map : 통계자료
	 */
	List<Map> selectStatistics(int shopNo);

	/**
	 * 검색조건으로 통계자료 가지고오기
	 * 2020-01-13 서현석
	 * 
	 * @param shopNoArr
	 * @param dateTerm
	 * @return
	 */
	List<Map> selectStatisticsCondition(Map map);

	/**
	 * 최근 일주일 통계자료 가져오기
	 * 2020-01-15 서현석
	 * 
	 * @return
	 */
	List<Map> selectWeekStatistics(int shopNo);

	/**
	 * 지점별 베스트 3 상품목록 가져오기
	 * 2020-01-15 서현석
	 * 
	 * @param shopNo
	 * @return
	 */
	List<Map> selectBestPrd3Statistics(int shopNo);

}
