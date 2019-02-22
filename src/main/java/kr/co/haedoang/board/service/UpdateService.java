package kr.co.haedoang.board.service;

import java.util.Map;

import kr.co.haedoang.db.repository.domain.RegisterStaff;

public interface UpdateService {
	Map<String,Object> data(int staffNo);
	
	void updateStaffInfo(RegisterStaff registerStaff);
	
	void deleteStaff(int staffNo);
	
}
