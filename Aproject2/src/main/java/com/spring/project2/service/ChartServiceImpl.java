package com.spring.project2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.ChartDao;
import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.FoundationRiskIndex;

@Service
public class ChartServiceImpl implements ChartService {
	
	private ChartDao chartDao;
	
	@Autowired
	public void setChartDao(ChartDao chartDao) {
		this.chartDao = chartDao;
	}

	@Override
	public BdApartment bdApartmentData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoundationRiskIndex riskIndex() {
		return chartDao.riskIndex();
	}

}
