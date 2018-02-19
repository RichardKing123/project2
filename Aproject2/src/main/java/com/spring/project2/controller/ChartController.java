package com.spring.project2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project2.domain.FoundationRiskIndex;
import com.spring.project2.service.ChartService;

@Controller
public class ChartController {

	private ChartService chartService;
	
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}
	
	public String riskIndex(Model model) {
		
		FoundationRiskIndex riskIndex = chartService.riskIndex();
		
		model.addAttribute("riskIndex", riskIndex);
		return "redirect:main";
	} 
	
	
}
