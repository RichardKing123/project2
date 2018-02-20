package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;

public interface SearchDao {

	//검색시 검색목록
	public abstract List<Bd_Index> searchList(String business_type ,String district);
	//상세보기시 개업 폐업
	public abstract Bd_Shop searchDetail(String bd_code_name, String business_type);
	
}
