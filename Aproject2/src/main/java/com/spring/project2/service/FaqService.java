package com.spring.project2.service;

import java.util.List;

import com.spring.project2.domain.Faq;

public interface FaqService {
	
	public abstract List<Faq> faqList();
	
	public abstract Faq getFaq(int faqNo);
	
	public abstract void insertFaq(Faq faq);
	
	public boolean isAdminCheck(String adminId);
	
	public abstract void updateFaq(Faq faq);
	
	public abstract void deleteFaq(int faqNo);
	
	

}
