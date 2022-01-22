package kr.co.vo;

import java.util.Date;

public class ReplyVO {
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	public ReplyVO() {
		
	}
	
	public ReplyVO(int bno, int rno, String content, 
				   String writer, Date regdate) {
		this.bno = bno;
		this.rno = rno;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}
	
	public int getBno() {
		return bno;
	}
	public int getRno() {
		return rno;
	}
	public String getContent() {
		return content;
	}
	public String getWriter() {
		return writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
}
