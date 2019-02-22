package kr.co.haedoang.db.repository.mapper;

import java.util.List;

import kr.co.haedoang.db.repository.domain.CodeReligion;
import kr.co.haedoang.db.repository.domain.CodeSchool;
import kr.co.haedoang.db.repository.domain.CodeSkill;
import kr.co.haedoang.db.repository.domain.RegisterStaff;
import kr.co.haedoang.db.repository.domain.SearchStaff;
import kr.co.haedoang.db.repository.domain.Staff;
import kr.co.haedoang.db.repository.domain.StaffSkill;

public interface StaffMapper {
	
	/* page load search table DB데이터 */
	List<CodeReligion> selectReligion();
	List<CodeSchool> selectSchool();
	List<CodeSkill> selectSkill();
	
	/* 사원 검색 */
	List<Staff> selectStaff(SearchStaff searchStaff);
	
	/* 검색 카운트 */
	int selectStaffCount(SearchStaff searchStaff);
	
	//staff register
	int insertStaff(RegisterStaff registerStaff);
	
	//staff skill register
	void insertStaffSkill(StaffSkill staffSkill);
	
	//staff 정보
	Staff selectStaffByStaffNo(int staffNo);
	
	//skill정보 받기
	String[] selectStaffSkillByStaffNo(int staffNo);
	
	//staff update
	void updateStaffInfo(RegisterStaff registerStaff);
	
	//staff skill delete
	void deleteStaffSkillByStaffNo(int staffNo);
	
	//staff delete
	void deleteStaff(int staffNo);
	
}
