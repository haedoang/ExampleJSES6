package kr.co.haedoang.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haedoang.db.repository.domain.RegisterStaff;
import kr.co.haedoang.db.repository.domain.StaffSkill;
import kr.co.haedoang.db.repository.mapper.StaffMapper;

@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	private StaffMapper mapper;
	
	@Override
	public Map<String, Object> data() {
		Map<String,Object> map = new HashMap<>();
		map.put("religion", mapper.selectReligion());
		map.put("skill", mapper.selectSkill());
		map.put("school", mapper.selectSchool());
		return map;
	}

	@Override
	public int insertStaff(RegisterStaff registerStaff) {
		return mapper.insertStaff(registerStaff);
	}
	
	
	@Override
	public void insertStaffSkill(RegisterStaff registerStaff) {
		for(String sk : registerStaff.getSkillCode()) {
			StaffSkill staffSkill = new StaffSkill();
			staffSkill.setStaffNo(registerStaff.getStaffNo());
			staffSkill.setSkillCode(Integer.parseInt(sk));
			mapper.insertStaffSkill(staffSkill);
		}
	}
	
	

}
