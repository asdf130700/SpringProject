package com.test.board.board.vo;

import java.util.Date;

public class ReplyVO {
	
	private int no;
	private int rno;
	private String content;
	private String writer;
	private Date writeDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", writeDate="
				+ writeDate + "]";
	}
	
}
