package kr.co.haedoang.board.service;

import java.util.Map;

import kr.co.haedoang.db.repository.domain.RegisterStaff;

public interface RegisterService {
	Map<String,Object> data();
	
	//register staff AI return. 
	int insertStaff(RegisterStaff registerStaff);
	
	//register staff skill
	void insertStaffSkill(RegisterStaff registerStaff); 
}
