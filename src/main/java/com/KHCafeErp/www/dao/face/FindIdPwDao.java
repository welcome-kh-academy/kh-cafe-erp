package com.KHCafeErp.www.dao.face;

import com.KHCafeErp.www.dto.Staff;

public interface FindIdPwDao {

	public Staff findid(Staff staff);

	public void getKey(int staffNo, String key);

	

}
