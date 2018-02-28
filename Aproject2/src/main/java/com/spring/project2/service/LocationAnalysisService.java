package com.spring.project2.service;

import java.util.List;

public interface LocationAnalysisService {
	
	public List<Object> search(String district);
	
	public int stabilityIndex(String bdCodeName, String businessType);
	
	public List<Object> shopNo(String bdCodeName, String businessType);
	
	public List<Object> shopRadar(String district, String bdCodeName);
}
