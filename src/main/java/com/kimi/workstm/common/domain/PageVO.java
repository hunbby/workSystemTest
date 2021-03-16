package com.kimi.workstm.common.domain;

public class PageVO {
    private int displayRowCount;           		// 출력할 데이터 개수
    private int rowStart;                       // 시작행번호
    private int rowEnd;                         // 종료행 번호
    private int totPage;                        // 전체 페이수
    private int totRow;                     	// 전체 데이터 수
    private int page;                           // 현재 페이지
    private int pageStart;                      // 시작페이지
    private int pageEnd;                        // 종료페이지
    
	public int getDisplayRowCount() {
		return displayRowCount;
	}
	public void setDisplayRowCount(int displayRowCount) {
		this.displayRowCount = displayRowCount;
	}
	public int getRowStart() {
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getTotRow() {
		return totRow;
	}
	public void setTotRow(int totRow) {
		this.totRow = totRow;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
    
    

}