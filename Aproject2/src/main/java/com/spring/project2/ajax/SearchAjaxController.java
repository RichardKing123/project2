package com.spring.project2.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project2.domain.Bd_Index;
import com.spring.project2.service.SearchService;

@Controller
public class SearchAjaxController {
	
	@Autowired
	SearchService searchService;

	//검색목록
	@RequestMapping("/search.ajax")
	@ResponseBody
	public List<Bd_Index> searchList(Model model, String business_type, String district) {
		
		model.addAttribute("district", district);
	
		
		return searchService.searchList(business_type, district);
	}
	
}
