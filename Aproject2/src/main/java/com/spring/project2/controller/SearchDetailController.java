package com.spring.project2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project2.domain.BdEstimatedSales;
import com.spring.project2.domain.Bd_Shop;
import com.spring.project2.service.SearchService;

@Controller
public class SearchDetailController {
	
	@Autowired
	private SearchService searchService;
	

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	//상세보기
	@RequestMapping("searchDetail")
	public String searchDetail(Model model, String bd_code_name, String business_type) throws Exception {
		System.out.println(bd_code_name);
		System.out.println(business_type);
		Bd_Shop shop = searchService.searchDetail(bd_code_name, business_type);
		List<BdEstimatedSales> sales = searchService.searchSales(bd_code_name, business_type);
		
		
		model.addAttribute("shop", shop);
		model.addAttribute("sales", sales);
		model.addAttribute("bd_code_name",bd_code_name);
		model.addAttribute("business_type",business_type);
		
		
		return "forward:WEB-INF/views/search/searchDetail.jsp";
	}
}
