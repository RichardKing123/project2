package com.spring.project2.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.ChartDao;
import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.BdIndex;
import com.spring.project2.domain.BdIndexList;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.FoundationRiskIndex;

@Service
public class ChartServiceImpl implements ChartService {
	
	private ChartDao chartDao;

	private static final int[] bdDate = new int[] {
			201401,201402,201403,201404,201405,201406,201407,
			201408,201409,201410,
            201411,201412,201501,201502,201503,201504,201505,
            201506,201507,201508,201509,201510,201511,201512,
            201601,201602,201603,201604,201605,201606,201607,
            201608,201609,201610,201611,201612,201701,201702,
            201703,201704,201705,201706,201707,201708};
	@Autowired
	public void setChartDao(ChartDao chartDao) {
		this.chartDao = chartDao;
	}

	@Override
	public double riskIndex() {
		
		double riskIndex = chartDao.riskIndex();

		return riskIndex;
	}

	@Override
	public Map<String, Object> bdSettledPopulation() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> bdSettledPopulation = chartDao.bdSettledPopulation(bdDate);
		
		map.put("bdDate", bdDate);
		map.put("bdSettledPopulation", bdSettledPopulation);
		
		return map;
	}

	@Override
	public Map<String, Object> bdIndex() {
		Map<String, Object> map = new HashMap<String, Object>();
		int[] indexDate = new int[] {
	            201506,201507,201508,201509,201510,201511,201512,
	            201601,201602,201603,201604,201605,201606,201607,
	            201608,201609,201610,201611,201612,201701,201702,
	            201703,201704,201705,201706,201707,201708};
		
		List<BdIndexList> indexList = new ArrayList<BdIndexList>();
		
		for(int bdDate : indexDate) {
			BdIndexList bdIndexList = new BdIndexList();
			bdIndexList.setBdIndexList(chartDao.bdIndex(bdDate));
			bdIndexList.setYearMonth(bdDate);
			indexList.add(bdIndexList);
		}
		
		map.put("bdIndex", indexList);
		return map;
		
		
		
	}

	@Override
	public List<Object> bdApt() {
		List<Object> list = chartDao.bdApt();
		return list;
	}

	@Override
	public List<Object> bdFacilities() {
		List<Object> list = chartDao.bdFacilities();
		return list;
	}

	@Override
	public List<Object> bdFloatingPopulation() {
		List<Object> list= chartDao.bdFloatingPopulation();
		return list;
	}

	@Override
	public List<Object> oneBdSettled() {
		List<Object> list = chartDao.oneBdSettled();
		return list;
	}

	@Override
	public List<Object> totalIndex() {
		List<Object> list = chartDao.totalIndex();
		return list;
	}

	@Override
	public List<Object> estimatedSales() {
		List<Object> list = chartDao.estimatedSales();
		return list;
	}

	@Override
	public List<Object> dataCrawled() {
		List<Object> list = chartDao.dataCrawled();
		return list;
	}
}
