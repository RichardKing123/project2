package com.spring.project2.domain;

import java.sql.Timestamp;

public class Board {
	// no, title, content, writer, reg_date, read_count, pass, file1
	private int board_no;
	private String title;
	private String content;
	private String writer;
	private Timestamp regDate;
	private int readCount;
	
	public Board() { }
	public Board(int board_no, String title, String content, String writer,
			Timestamp regDate, int readCount) {
		this.board_no = board_no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
		this.readCount = readCount;
	}
	

	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

}
