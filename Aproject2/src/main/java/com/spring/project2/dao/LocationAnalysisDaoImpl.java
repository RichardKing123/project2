package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class LocationAnalysisDaoImpl implements LocationAnalysisDao {

	private final String NAME_SPACE = "com.spring.project2.mapper.LocationMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	//구 선택시 상세지역 선택테이블 출력
	@Override
	public List<Object> search(String district) {
		System.out.println("입지 구 선택 :" + district);
		return sqlSession.selectList(NAME_SPACE + ".search2", district);
	}
	
	//해당 입지의 안정성 출력 
	@Override
	public int stabilityIndex(String bdCodeName, String businessType) {
		System.out.println("Dao - bdCodename: " + bdCodeName + ", businessType: " + businessType);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bdCodeName", bdCodeName);
		params.put("businessType", businessType);
		return sqlSession.selectOne(NAME_SPACE + ".stabilityIndex", params);
	}

	@Override
	public List<Object> shopNo(String bdCodeName, String businessType) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bdCodeName", bdCodeName);
		params.put("businessType", businessType);
		return sqlSession.selectList(NAME_SPACE + ".shopNo", params);
	}

	@Override
	public List<Object> shopRadar(String district, String bdCodeName) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("district", district);
		params.put("bdCodeName", bdCodeName);
		return sqlSession.selectList(NAME_SPACE + ".shopRadar", params);
	}

}
