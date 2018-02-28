package com.spring.project2.domain;

public class Faq {
	
	private int faqNo;
	private String faqTitle;
	private String faqContent;

	
	
	public Faq() {}
	
	public Faq(int faqNo, String faqTitle, String faqContent,
			 String adminId) {
		
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		
		
		
		
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

	

}
