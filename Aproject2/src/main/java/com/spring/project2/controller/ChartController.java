package com.spring.project2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.project2.dao.DaumMapApiDao;
import com.spring.project2.domain.PolygonArea;
import com.spring.project2.service.ChartService;

@Controller
public class ChartController {

	private ChartService chartService;

	
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

	@Autowired
	private DaumMapApiDao dao;	
	
	private static String[] guNames = { 
			"용산구", "중구", "종로구", "서대문구", "동대문구", "성북구", "성동구", "마포구", 
			"중랑구", "은평구", "영등포구", "양천구", "송파구", "서초구", "동작구",
			"도봉구", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구" };
	
	
	@RequestMapping("/main")
	public String mainChart(Model model) throws Exception {
		
		double riskIndex = chartService.riskIndex();
		Map<String, Object> bdSettledPopulation = chartService.bdSettledPopulation();
		Map<String, Object> index = chartService.bdIndex();		
		List<PolygonArea> polygonAreaList = dao.getPolygoAreaList(guNames);
		
		
		ObjectMapper map = new ObjectMapper();
		String bdSettledPopulationData = map.writeValueAsString(bdSettledPopulation);
		String indexData = map.writeValueAsString(index);
		String polygonList = map.writeValueAsString(polygonAreaList);
		
		System.out.println("bdpopulation :" + bdSettledPopulationData);
		System.out.println("bdIndex : " + indexData);
		System.out.println(polygonList);
		
		
		model.addAttribute("polygonList", polygonList);
		model.addAttribute("indexData", indexData);
		model.addAttribute("bdSettledPopulation", bdSettledPopulationData);
		model.addAttribute("riskIndex", riskIndex);
		return "main";
	}
	
	@RequestMapping("trendIndex")
	public String trendIndex(Model model) throws Exception {
		
		List<Object> bdApt = chartService.bdApt();
		List<Object> bdFacilities = chartService.bdFacilities();
		List<Object> bdFloatingPopulation = chartService.bdFloatingPopulation();
		
		ObjectMapper map = new ObjectMapper();
		
		String bdFacilitiesData = map.writeValueAsString(bdFacilities);
		String bdAptData = map.writeValueAsString(bdApt);
		String bdFloatingPopulationData = map.writeValueAsString(bdFloatingPopulation);
		
		
		System.out.println(bdAptData);
		System.out.println(bdFacilitiesData);
		System.out.println(bdFloatingPopulationData);
		
		model.addAttribute("bdApt", bdAptData);
		model.addAttribute("bdFacilities", bdFacilitiesData);
		model.addAttribute("bdFloatingPopulation", bdFloatingPopulationData);
		
		return "forward:WEB-INF/views/chart/trendIndex.jsp";
	}

	
	
	
}
