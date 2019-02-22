package kr.co.haedoang.db.repository.domain;

import lombok.Data;

@Data
public class SearchStaff {
	/*data*/
	private String staffName;
	private String[] gender;
	private String religionCode;
	private String[] schoolCode;
	private String[] skillCode;
	private String startDay;
	private String endDay;
	
	/*page data*/
	private int pageNo;
	private int begin;
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (pageNo-1)*5;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
}
