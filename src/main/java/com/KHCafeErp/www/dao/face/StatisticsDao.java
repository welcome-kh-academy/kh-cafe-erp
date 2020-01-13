package com.KHCafeErp.www.dao.face;

import java.util.List;
import java.util.Map;

public interface StatisticsDao {

	/**
	 * shopNo로 통계자료 가지고 오기
	 * 2020-01-12 서현석
	 * 
	 * @param shopNo
	 * @return map : 통계자료
	 */
	List<Map<String, Integer>> selectStatistics(int shopNo);

}
