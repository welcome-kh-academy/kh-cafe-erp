package com.KHCafeErp.www.service.face;

import java.util.List;
import java.util.Map;

public interface StatisticsService {

	/**
	 * 한달치 통계자료 가져오기
	 * @param shopNo
	 * @return 통계자료
	 */
	List<Map<String, Integer>> getStatistics(int shopNo);

}
