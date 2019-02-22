package kr.co.haedoang.board.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haedoang.db.repository.domain.RegisterStaff;
import kr.co.haedoang.db.repository.domain.StaffSkill;
import kr.co.haedoang.db.repository.mapper.StaffMapper;

@Service
public class UpdateServiceImpl implements UpdateService {
	
	@Autowired 
	private StaffMapper mapper;
	
	@Override
	public Map<String, Object> data(int staffNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("religion", mapper.selectReligion());
		map.put("skill", mapper.selectSkill());
		map.put("school", mapper.selectSchool());
		map.put("staff",mapper.selectStaffByStaffNo(staffNo));
		map.put("staffSkill", mapper.selectStaffSkillByStaffNo(staffNo));
		//System.out.println(mapper.selectStaffByStaffNo(staffNo));
		//System.out.println(Arrays.toString(mapper.selectStaffSkillByStaffNo(staffNo)));
		return map;
	}

	@Override
	public void updateStaffInfo(RegisterStaff registerStaff) {
		//staff update
		mapper.updateStaffInfo(registerStaff);
		//delete staff skill
		mapper.deleteStaffSkillByStaffNo(registerStaff.getStaffNo());
		
		//staff skill insert
		
		for(String sk : registerStaff.getSkillCode()) {
			StaffSkill staffSkill = new StaffSkill();
			staffSkill.setStaffNo(registerStaff.getStaffNo());
			staffSkill.setSkillCode(Integer.parseInt(sk));
			mapper.insertStaffSkill(staffSkill);
		}
	}

	@Override
	public void deleteStaff(int staffNo) {
		mapper.deleteStaffSkillByStaffNo(staffNo);
		mapper.deleteStaff(staffNo);
	}
}
