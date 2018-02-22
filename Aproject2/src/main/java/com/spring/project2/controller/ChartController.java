package com.spring.project2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.service.ChartService;

@Controller
public class ChartController {

	private ChartService chartService;

	
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

	@RequestMapping("main")
	public String mainChart(Model model, int[] bdDate) throws Exception {
		
		double riskIndex = chartService.riskIndex();
		Map<String, Object> bdSettledPopulation = chartService.bdSettledPopulation(bdDate);
		
		ObjectMapper map = new ObjectMapper();
		String bdSettledPopulationData = map.writeValueAsString(bdSettledPopulation);
		
		
		model.addAttribute("bdSettledPopulation", bdSettledPopulationData);
		model.addAttribute("riskIndex", riskIndex);
		return "main";
	} 

	
	
	
}
