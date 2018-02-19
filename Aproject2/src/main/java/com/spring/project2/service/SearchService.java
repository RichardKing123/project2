package com.spring.project2.service;

import java.util.List;

import com.spring.project2.domain.Bd_Index;

public interface SearchService {

	public abstract List<Bd_Index> searchList(String business_type, String district);
}
