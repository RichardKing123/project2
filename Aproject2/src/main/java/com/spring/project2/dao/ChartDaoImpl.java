package com.spring.project2.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.FoundationRiskIndex;

@Repository
public class ChartDaoImpl implements ChartDao {
	
	private final String NAME_SPACE ="com.spring.project2.mapper.ChartMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public BdApartment bdApartmentData() {
		
		return null;
	}

	@Override
	public FoundationRiskIndex riskIndex() {		
		
		return sqlSession.selectOne(NAME_SPACE + ".riskIndex");
	}

}