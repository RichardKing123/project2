package com.spring.project2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.Faq;

@Repository
public class FaqDaqImpl implements FaqDao {
	
	
	private final String NAME_SPACE = "com.springs.project2.mapper.FaqMapper";
    
	
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	public void setSqlSesssion(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
			
	@Override
	public List<Faq> faqList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Faq getFaq(int faqNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFaq(Faq faq) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public boolean isAdminCheck(String adminId) {
		
		boolean result = false;
		
		String admin = sqlSession.selectOne(
				NAME_SPACE + ".isAdminCheck", adminId);
		
		if(admin.equals(admin)) {
			result = true;
		}
		return result;
	}

	@Override
	public void updateFaq(Faq faq) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFaq(int faqNo) {
		// TODO Auto-generated method stub

	}

}
