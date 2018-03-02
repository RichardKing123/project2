package com.spring.project2.domain;

import java.sql.Timestamp;

public class Reply {
	private int reply_no;
	private String writer;
	private String reply;
	private Timestamp reg_date;
	private int bbs_no;
	
	public Reply() {}

	
	
	public Reply(String writer, String reply, int bbs_no) {
		super();
		this.writer = writer;
		this.reply = reply;
		this.bbs_no = bbs_no;
	}

	public Reply(int reply_no, String writer, String reply, Timestamp reg_date, int bbs_no) {
		super();
		this.reply_no = reply_no;
		this.writer = writer;
		this.reply = reply;
		this.reg_date = reg_date;
		this.bbs_no = bbs_no;
	}



	public int getReply_no() {
		return reply_no;
	}



	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getReply() {
		return reply;
	}



	public void setReply(String reply) {
		this.reply = reply;
	}



	public Timestamp getReg_date() {
		return reg_date;
	}



	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}



	public int getBbs_no() {
		return bbs_no;
	}



	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	
	
}
