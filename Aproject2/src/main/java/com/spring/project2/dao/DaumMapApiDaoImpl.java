package com.spring.project2.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.PolygonArea;
import com.spring.project2.domain.PolygonPoint;


@Repository
public class DaumMapApiDaoImpl implements DaumMapApiDao {
	
	private final static String NAME_SPACE = "com.daum.api.mapper.DaumMapper";
	
	private SqlSessionTemplate SqlSession;
	
	
@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		SqlSession = sqlSession;
	}

	@Override
	public List<PolygonPoint> getGuPloygon(String guName) {
		System.out.println("daumDao : "+guName);
		return SqlSession.selectList(NAME_SPACE + ".getGuPolygon", guName);
	}

	@Override
	public List<PolygonArea> getPolygoAreaList(String[] guNames) {
		
		List<PolygonArea> polygonAreaList = new ArrayList<PolygonArea>();
		
		for(String guName : guNames) {
			PolygonArea polygonArea = new PolygonArea();
			System.out.println("guName : " + guName);
			List<PolygonPoint> pointList = getGuPloygon(guName);
			System.out.println("daumDao pointList : "+pointList);
			polygonArea.setName(guName);
			polygonArea.setPointList(pointList);
			
			polygonAreaList.add(polygonArea);
		}
		
		return polygonAreaList;
	}
}
