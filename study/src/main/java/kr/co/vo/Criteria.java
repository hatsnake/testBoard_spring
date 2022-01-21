package kr.co.vo;

public class Criteria {
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public Criteria(int page, int perPageNum, 
				    int rowStart, int rowEnd) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.rowStart = rowStart;
		this.rowEnd = rowEnd;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}	
	
	public int getPage() {
		return page;
	}

	// 필드는 없는 메소드
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}

	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
}
