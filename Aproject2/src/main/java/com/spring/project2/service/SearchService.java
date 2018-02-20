package com.spring.project2.service;

import java.util.List;

import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;

public interface SearchService {
	//검색시 검색목록
	public abstract List<Bd_Index> searchList(String business_type, String district);
	//상세보기 개업 폐업
	public abstract Bd_Shop searchDetail(String bd_code_name, String business_type);
}
