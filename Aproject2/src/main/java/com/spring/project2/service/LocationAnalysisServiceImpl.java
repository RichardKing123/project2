package com.spring.project2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.LocationAnalysisDao;
@Service
public class LocationAnalysisServiceImpl implements LocationAnalysisService {

	private LocationAnalysisDao locationAnalysisDao;

	@Autowired
	public void setLocationAnalysisDao(LocationAnalysisDao locationAnalysisDao) {
		this.locationAnalysisDao = locationAnalysisDao;
	}


	//검색목록 출력 메소드
	@Override
	public List<Object> search(String district) {
		
		return locationAnalysisDao.search(district);
	}

	//지역, 업종에 따른 안정도 출력
	@Override
	public int stabilityIndex(String bdCodeName, String businessType) {
		System.out.println("Service - bdCodeName : " + bdCodeName + ", businessType : " + businessType);
		return locationAnalysisDao.stabilityIndex(bdCodeName, businessType);
	}


	@Override
	public List<Object> shopNo(String bdCodeName, String businessType) {
		
		return locationAnalysisDao.shopNo(bdCodeName, businessType);
	}


	@Override
	public List<Object> shopRadar(String district, String bdCodeName) {
		
		return locationAnalysisDao.shopRadar(district, bdCodeName);
	}

}
