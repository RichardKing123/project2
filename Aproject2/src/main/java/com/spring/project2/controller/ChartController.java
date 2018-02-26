package com.spring.project2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.project2.domain.BdApartment;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.service.ChartService;

@Controller
public class ChartController {

	private ChartService chartService;

	
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

	@RequestMapping("/main")
	public String mainChart(Model model) throws Exception {
		
		double riskIndex = chartService.riskIndex();
		Map<String, Object> bdSettledPopulation = chartService.bdSettledPopulation();
		Map<String, Object> index = chartService.bdIndex();
		
		ObjectMapper map = new ObjectMapper();
		String bdSettledPopulationData = map.writeValueAsString(bdSettledPopulation);
		String indexData = map.writeValueAsString(index);
		
		
		System.out.println("bdpopulation :" + bdSettledPopulationData);
		System.out.println("bdIndex : " + indexData);
		
		
		model.addAttribute("indexData", indexData);
		model.addAttribute("bdSettledPopulation", bdSettledPopulationData);
		model.addAttribute("riskIndex", riskIndex);
		return "main";
	}
	
	@RequestMapping("trendIndex")
	public String trendIndex(Model model) throws Exception {
		
		List<Object> bdApt = chartService.bdApt();
		List<Object> bdFacilities = chartService.bdFacilities();
		
		ObjectMapper map = new ObjectMapper();
		
		String bdFacilitiesData = map.writeValueAsString(bdFacilities);
		String bdAptData = map.writeValueAsString(bdApt);
		
		
		System.out.println(bdAptData);
		System.out.println(bdFacilitiesData);
		model.addAttribute("bdApt", bdAptData);
		model.addAttribute("bdFacilities", bdFacilitiesData);
		
		return "forward:WEB-INF/views/chart/trendIndex.jsp";
	}

}
