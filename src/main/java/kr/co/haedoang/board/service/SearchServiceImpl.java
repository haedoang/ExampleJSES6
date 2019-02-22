package kr.co.haedoang.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haedoang.db.repository.domain.PageResult;
import kr.co.haedoang.db.repository.domain.Paging;
import kr.co.haedoang.db.repository.domain.SearchStaff;
import kr.co.haedoang.db.repository.mapper.StaffMapper;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private StaffMapper mapper;
	
	//DB data
	@Override
	public Map<String,Object> data(){
		Map<String,Object> map = new HashMap<>();
		map.put("religion", mapper.selectReligion());
		map.put("school", mapper.selectSchool());
		map.put("skill",mapper.selectSkill());
		return map;
	}
	
	//staff search
	@Override
	public Map<String,Object> selectStaff(SearchStaff searchStaff){
		Map<String,Object> map = new HashMap<>();
		PageResult pageResult = new PageResult(searchStaff.getPageNo(), mapper.selectStaffCount(searchStaff));
		map.put("staff", mapper.selectStaff(searchStaff));
		map.put("pageResult", pageResult);
		map.put("religion", mapper.selectReligion());
		
		System.out.println("hi:"+mapper.selectStaff(searchStaff));
		return map;
	}
	
	
}
