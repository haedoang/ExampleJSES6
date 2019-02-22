package kr.co.haedoang.db.repository.domain;

import lombok.Data;

@Data
public class Staff {
	private int staffNo;
	private String staffName;
	private String juminNo;
	private int schoolCode;
	private int religionCode;
	private String graduateDay;
	
}
