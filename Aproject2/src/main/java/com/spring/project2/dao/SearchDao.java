package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.Bd_Index;

public interface SearchDao {

	public abstract List<Bd_Index> searchList(String business_type ,String district);
	
	
}
