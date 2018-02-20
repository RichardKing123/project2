package com.spring.project2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.SearchDao;
import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;
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

}
