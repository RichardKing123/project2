package com.spring.project2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.ChartDao;
import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.BdSettledPopulation;
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
	public double riskIndex() {
		
		double riskIndex = chartDao.riskIndex();

		return riskIndex;
	}

	@Override
	public Map<String, Object> bdSettledPopulation(int[] bdDate) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		bdDate = new int[] {201401,201402,201403,201404,
	                    201405,201406,201407,201408,201409,201410,
	                    201411,201412,201501,201502,201503,201504,201505,
	                    201506,201507,201508,201509,201510,201511,201512,
	                    201601,201602,201603,201604,201605,201606,201607,
	                    201608,201609,201610,201611,201612,201701,201702,
	                    201703,201704,201705,201706,201707,201708};
		List<Integer> bdSettledPopulation = chartDao.bdSettledPopulation(bdDate);
		
		map.put("bdDate", bdDate);
		map.put("bdSettledPopulation", bdSettledPopulation);
		
		return map;
	}
}
