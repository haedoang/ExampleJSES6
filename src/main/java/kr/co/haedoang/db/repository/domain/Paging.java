package kr.co.haedoang.db.repository.domain;


public class Paging {
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
