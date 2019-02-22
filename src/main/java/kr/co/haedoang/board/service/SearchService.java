package kr.co.haedoang.board.service;

import java.util.Map;

import kr.co.haedoang.db.repository.domain.SearchStaff;

public interface SearchService {	
	Map<String,Object> data();
	Map<String,Object> selectStaff(SearchStaff searchStaff);
	
}

