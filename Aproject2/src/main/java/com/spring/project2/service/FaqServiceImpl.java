package com.spring.project2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.FaqDao;
import com.spring.project2.domain.Faq;


@Service
public class FaqServiceImpl implements FaqService {
	
	
	
	private FaqDao faqDao;
	
	@Autowired
	public void setFaqDao(FaqDao faqDao) {
		this.faqDao = faqDao;
	}

	@Override
	public List<Faq> faqList() {
		
		return faqDao.faqList();
	}

	@Override
	public Faq getFaq(int faqNo) {
		
		return faqDao.getFaq(faqNo);
	}

	@Override
	public void insertFaq(Faq faq) {
		faqDao.insertFaq(faq);

	}
	
	@Override
	public boolean isAdminCheck(String adminId) {
		
		return faqDao.isAdminCheck(adminId);
	}

	@Override
	public void updateFaq(Faq faq) {
		faqDao.updateFaq(faq);

	}

	@Override
	public void deleteFaq(int faqNo) {
		faqDao.deleteFaq(faqNo);

	}

}
