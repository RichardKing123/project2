package com.spring.project2.domain;

import java.sql.Timestamp;

public class Faq {
	
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqWriter;
	private int faqCount;
	private Timestamp regDate;
	private String adminId;
	
	
	public Faq() {}
	public Faq(int faqNo, String faqTitle, String faqContent, String faqWriter,
			int faqCount, Timestamp regDate, String adminId) {
		
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqWriter = faqWriter;
		this.faqCount = faqCount;
		this.regDate = regDate;
		this.adminId = adminId;
		
		
		
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getFaqWriter() {
		return faqWriter;
	}
	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}
	public int getFaqCount() {
		return faqCount;
	}
	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	

}
