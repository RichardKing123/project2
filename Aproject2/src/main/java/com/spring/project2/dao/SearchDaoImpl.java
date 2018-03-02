package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.BdEstimatedSales;
import com.spring.project2.domain.BdFloatingPopulation;
import com.spring.project2.domain.BdIo;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;
import com.spring.project2.domain.PolygonPoint;
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

//상세보기 매출분석
	@Override
	public List<BdEstimatedSales> searchSales(String bd_code_name, String business_type) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bd_code_name", bd_code_name);
		params.put("business_type", business_type);
		return sqlSession.selectList(NAME_SPACE+".selectSales", params);
	}

//상세보기시 유동인구
	@Override
	public List<BdFloatingPopulation> searchFloating(String bd_code_name) {
		
		return sqlSession.selectList(NAME_SPACE+".selectFloating", bd_code_name);
	}

	
//상세보기시 상주인구
	@Override
	public List<BdSettledPopulation> searchSettled(String bd_code_name) {
		
		return sqlSession.selectList(NAME_SPACE+".selectSettled", bd_code_name);
	}

//상세보기 소득소비
	@Override
	public List<BdIo> searchIo(String bd_code_name) {
		
		return sqlSession.selectList(NAME_SPACE+".selectIo",bd_code_name);
	}

//상세보기 지도 위도경도
	@Override
	public List<PolygonPoint> getGuPloygon(String district) {
		
		return sqlSession.selectList(NAME_SPACE+".getGuPolygon", district);
	}

}
