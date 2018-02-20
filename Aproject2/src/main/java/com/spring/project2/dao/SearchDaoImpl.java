package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;
@Repository
public class SearchDaoImpl implements SearchDao {

	private final String NAME_SPACE = "com.spring.project2.mapper.Bd_IndexMapper";
	
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	//검색시 검색목록
	@Override
	public List<Bd_Index> searchList(String business_type, String district) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("business_type", business_type);
		params.put("district", district);
		
		return sqlSession.selectList(NAME_SPACE+".search", params);
	}


	//상세보기 개업 폐업
	@Override
	public Bd_Shop searchDetail(String bd_code_name, String business_type) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bd_code_name", bd_code_name);
		params.put("business_type", business_type);
		return sqlSession.selectOne(NAME_SPACE+".selectShop",params);
	}

}
