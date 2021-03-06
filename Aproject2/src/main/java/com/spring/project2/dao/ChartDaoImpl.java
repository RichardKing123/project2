package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.BdIndex;
import com.spring.project2.domain.BdSettledPopulation;
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
	public double riskIndex() {		
		
		return sqlSession.selectOne(NAME_SPACE + ".riskIndex");
	}


	@Override
	public List<Integer> bdSettledPopulation(int[] bdDate) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bdDate", bdDate);
		return sqlSession.selectList(NAME_SPACE + ".bdSettledPopulation", params);
	}


	@Override
	public List<BdIndex> bdIndex(int bdDate) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bdDate", bdDate);
		
		return sqlSession.selectList(NAME_SPACE + ".bdIndex",params);
	}


	@Override
	public List<Object> bdApt() {
		
		return sqlSession.selectList(NAME_SPACE + ".bdApt");
	}

	@Override
	public List<Object> bdFacilities() {
		
		return sqlSession.selectList(NAME_SPACE + ".bdFacilities");
	}

	@Override
	public List<Object> bdFloatingPopulation() {

		return sqlSession.selectList(NAME_SPACE + ".bdFloatingPopulation");
	}

	@Override
	public List<Object> oneBdSettled() {

		return sqlSession.selectList(NAME_SPACE + ".oneBdSettled");
	}

	@Override
	public List<Object> totalIndex() {

		return sqlSession.selectList(NAME_SPACE + ".totalIndex");
	}

	@Override
	public List<Object> estimatedSales() {
		
		return sqlSession.selectList(NAME_SPACE + ".estimatedSales");
	}

	@Override
	public List<Object> dataCrawled() {
		return sqlSession.selectList(NAME_SPACE + ".dataCrawled");
	}

	@Override
	public List<Object> syarosu() {
		
		return sqlSession.selectList(NAME_SPACE + ".syarosu");
	}

	@Override
	public List<Object> gyunglidan() {
		
		return sqlSession.selectList(NAME_SPACE + ".gyunglidan");
	}

	@Override
	public List<Object> hongdae() {
		
		return sqlSession.selectList(NAME_SPACE + ".hongdae");
	}

}
