package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.BdIndex;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.FoundationRiskIndex;

public interface ChartDao {
	
	//지역별 위험지표를 반환하는 메소드
	public double riskIndex();
	
	public List<Integer> bdSettledPopulation(int[] bdDate);
	
	public List<BdIndex> bdIndex(int bdDate);
	
	public List<Object> bdApt();
	
	public List<Object> bdFacilities();
	
	public List<Object> bdFloatingPopulation();
}
