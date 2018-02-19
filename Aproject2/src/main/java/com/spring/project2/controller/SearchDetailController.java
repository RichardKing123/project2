package com.spring.project2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project2.service.SearchService;

@Controller
public class SearchDetailController {
	
	@Autowired
	private SearchService searchService;
	

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}


	@RequestMapping("searchDetail")
	public String searchDetail(Model model, String bd_code_name, String business_type) throws Exception {
		
		
		
		return "forward:WEB-INF/views/search/searchDetail.jsp";
	}
}
