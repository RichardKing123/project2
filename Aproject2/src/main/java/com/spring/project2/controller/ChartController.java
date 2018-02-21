package com.spring.project2.controller;

import java.util.List;
import java.util.Map;

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
	private Map<String, Object> result;
	
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

	@ResponseBody
	@RequestMapping("main")
	public Model mainChart(Model model) {
		
		double riskIndex = chartService.riskIndex();
		Map<String, Object> bdSettledPopulation = chartService.bdSettledPopulation();

		result.put("riskIndex", riskIndex);
		result.put("bdSettledPopulation", bdSettledPopulation);
		
		
		return model.addAllAttributes(result);
	} 

	
	
	
}
