package com.spring.project2.dao;

import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.FoundationRiskIndex;

public interface ChartDao {
	
	//상권 아파트 현황을 BdApartment 객체로 반환하는 메소드
	public BdApartment bdApartmentData();
	
	//지역별 위험지표를 반환하는 메소드
	public double riskIndex();  
}
