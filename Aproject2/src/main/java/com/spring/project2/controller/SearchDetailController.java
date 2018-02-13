package com.spring.project2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchDetailController {

	@RequestMapping("searchDetail")
	public String searchDetail(Model model, String gu) throws Exception {
		
		
		model.addAttribute("gu1",gu);
		return "search/searchDetail";
	}
}
