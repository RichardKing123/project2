package com.spring.project2.dao;

import java.util.List;

public interface LocationAnalysisDao {
	
	public List<Object> search(String district);
	
	public int stabilityIndex(String bdCodeName, String businessType);
	
	public List<Object> shopNo(String bdCodeName, String businessType);
	
	public List<Object> shopRadar(String district, String bdCodeName);
}
