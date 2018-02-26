package com.spring.project2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.SearchDao;
import com.spring.project2.domain.BdEstimatedSales;
import com.spring.project2.domain.BdFloatingPopulation;
import com.spring.project2.domain.BdIo;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;
import com.spring.project2.domain.PolygonPoint;
@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;
	
	
	
	public void setSearchDao(SearchDao searchDao) {
		this.searchDao = searchDao;
	}


//검색목록
	@Override
	public List<Bd_Index> searchList(String business_type, String district) {
		
		return searchDao.searchList(business_type, district);
	}

//상세보기 개업 폐업
	@Override
	public Bd_Shop searchDetail(String bd_code_name, String business_type) {
		
		return searchDao.searchDetail(bd_code_name, business_type);
	}

//상세보기 매출분석
	@Override
	public List<BdEstimatedSales> searchSales(String bd_code_name, String business_type) {
		
		return searchDao.searchSales(bd_code_name, business_type);
	}

//상세보기 유동인구분석
	@Override
	public List<BdFloatingPopulation> searchFloating(String bd_code_name) {
	
		return searchDao.searchFloating(bd_code_name);
	}

//상세보기 상주인구 분석
	@Override
	public List<BdSettledPopulation> searchSettled(String bd_code_name) {
		
		return searchDao.searchSettled(bd_code_name);
	}

//상세보기 소득소비
	@Override
	public List<BdIo> searchIo(String bd_code_name) {
		
		return searchDao.searchIo(bd_code_name);
	}


	@Override
	public List<PolygonPoint> getGuPloygon(String district) {
		
		return searchDao.getGuPloygon(district);
	}

}
