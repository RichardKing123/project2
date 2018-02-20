package com.spring.project2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.service.ChartService;

@Controller
public class ChartController {

	private ChartService chartService;
	
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}
	
	@ResponseBody
	@RequestMapping("main")
	public Model riskIndex(Model model) {
		
		double riskIndex = chartService.riskIndex();
		
		return model.addAttribute("riskIndex", riskIndex);
	} 
	
	@ResponseBody
	@RequestMapping("main")
	public Model bdSettledPopulation(Model model) {
		
		BdSettledPopulation population = chartService.bdSettledPopulation();
	
		return model.addAttribute("bdSettledPopulation", population); 
	}
	
}
