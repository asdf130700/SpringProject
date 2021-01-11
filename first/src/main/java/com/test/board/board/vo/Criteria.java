package com.test.board.board.vo;

public class Criteria {

	private int page;
	private int pageNum;
	private int startRow;
	private int endRow;
	
	public Criteria() {
		this.page = 1;
		this.pageNum = 15;
	}
	public int getPage() {
		return page;
	}
	public int getPageStart() {
		return (this.page - 1) * pageNum;
	}
	public void setPage(int page) {
		if(page <= 0) {
		this.page = 1;
		return;
		}
		this.page = page;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		if(pageNum <= 0 || pageNum >100) {
			this.pageNum = 10;
			return;
		}
		this.pageNum = pageNum;
	}
	public int getStartRow() {
		startRow = ((page -1) * pageNum) + 1;
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		endRow = startRow + pageNum - 1;
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageNum=" + pageNum + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}
	
	
}
