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
		
		return sqlSession.selectList(NAME_SPACE + ".faqList");
	}

	@Override
	public Faq getFaq(int faqNo) {

		return sqlSession.selectOne(NAME_SPACE + ".getFaq", faqNo);
	}

	@Override
	public void insertFaq(Faq faq) {

		sqlSession.insert(NAME_SPACE + ".insertFaq", faq);

	}
	
	@Override
	public boolean isAdminCheck(String id) {
		
		boolean result = false;
		
		String admin = sqlSession.selectOne(
				NAME_SPACE + ".isAdminCheck", id);
		
		if(admin != null && admin.equals(admin)) {
			result = true;
		}
		return result;
	}

	@Override
	public void updateFaq(Faq faq) {

		sqlSession.update(NAME_SPACE + ".updateFaq", faq);
	}

	@Override
	public void deleteFaq(int faqNo) {

		sqlSession.delete(NAME_SPACE + ".deleteFaq", faqNo);

	}

}
