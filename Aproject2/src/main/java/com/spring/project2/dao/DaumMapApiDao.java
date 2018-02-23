package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.PolygonArea;
import com.spring.project2.domain.PolygonPoint;


public interface DaumMapApiDao {
	
	// 각 구에 해당하는 다각형을 그릴 수 있는 포인트 리스트를 가져오는 메서드
	public List<PolygonPoint> getGuPloygon(String guName);
	
	// 각 시도에 해당하는 다각형을 그릴 수 있는 리스트
	public List<PolygonArea> getPolygoAreaList(String[] guNameList);
	
	
}
