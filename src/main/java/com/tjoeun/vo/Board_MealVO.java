package com.tjoeun.vo;

import java.util.Date;

public class Board_MealVO {

	private int idx;
	private String name;		  // 이름
	private String subject;       // 제목
	private String content;		  // 내용
	private Date writeDate;		  // 날짜
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	@Override
	public String toString() {
		return "Board_MealVO [idx=" + idx + ", name=" + name + ", subject=" + subject + ", content=" + content
				+ ", writeDate=" + writeDate + "]";
	}
	
	
	
}
