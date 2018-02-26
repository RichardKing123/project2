package com.spring.project2.service;

import java.util.List;
import java.util.Map;

import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.FoundationRiskIndex;

public interface ChartService {


	// 지역별 위험지표를 반환하는 메소드
	public double riskIndex();
	
	public Map<String, Object> bdSettledPopulation();
	
	public Map<String, Object> bdIndex();
	
	public List<Object> bdApt();
	
	public List<Object> bdFacilities();
}
