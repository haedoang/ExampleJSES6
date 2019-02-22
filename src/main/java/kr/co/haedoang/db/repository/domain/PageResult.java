package kr.co.haedoang.db.repository.domain;

/** 
 * 페이징을 모듈화 하기! !
 * 
 * */

public class PageResult {
	
	//화면접근할 거 멤버변수로 다빼 (기존에 파라미터였던거 )
	private int count; // 게시글의 갯수를 각각의 페이지에서 받을거야
	private int pageNo;
	
	private int lastPage; //전체 게시글을 받아서 처리해줌 .. 
	private int beginPage;
	private int endPage;
	

	private boolean prev;
	private boolean next;
	
	//@param = 게시물 전체 개수
	public PageResult(int pageNo, int count) {
		this(pageNo,count,5,5);  
	}
	
	public PageResult(int pageNo,int count, int listSize, int tabSize) {
		this.pageNo= pageNo;
		this.count=count;
		
		lastPage = (int)Math.ceil(count /(double)listSize);
		int currTab = (pageNo-1)/tabSize+1;
		
		beginPage = (currTab-1) * tabSize+1;
		endPage =   (currTab * tabSize <lastPage) ? currTab * tabSize : lastPage;  
		
		prev = beginPage !=1;       
		next = endPage !=lastPage; 	
	}

	
	public int getCount() {
		return count;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	
}
