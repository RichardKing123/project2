package com.spring.project2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.SearchDao;
import com.spring.project2.domain.Bd_Index;
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

}
