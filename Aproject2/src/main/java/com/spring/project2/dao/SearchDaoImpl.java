package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.Bd_Index;
@Repository
public class SearchDaoImpl implements SearchDao {

	private final String NAME_SPACE = "com.spring.project2.mapper.Bd_IndexMapper";
	
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}



	@Override
	public List<Bd_Index> searchList(String business_type, String district) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("business_type", business_type);
		params.put("district", district);
		
		return sqlSession.selectList(NAME_SPACE+".search", params);
	}

}
