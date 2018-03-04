package com.spring.project2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
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
		List<Object> oneBdSettled = chartService.oneBdSettled();
		List<Object> totalIndex = chartService.totalIndex();
		List<Object> estimatedSales = chartService.estimatedSales();
		List<PolygonArea> polygonAreaList = dao.getPolygoAreaList(guNames);
		
		ObjectMapper map = new ObjectMapper();
		
		String bdFacilitiesData = map.writeValueAsString(bdFacilities);
		String bdAptData = map.writeValueAsString(bdApt);
		String bdFloatingPopulationData = map.writeValueAsString(bdFloatingPopulation);
		String oneBdSettledData = map.writeValueAsString(oneBdSettled);
		String totalIndexData = map.writeValueAsString(totalIndex);
		String estimatedSalesData = map.writeValueAsString(estimatedSales);
		String polygonList = map.writeValueAsString(polygonAreaList);

		model.addAttribute("bdApt", bdAptData);
		model.addAttribute("bdFacilities", bdFacilitiesData);
		model.addAttribute("bdFloatingPopulation", bdFloatingPopulationData);
		model.addAttribute("oneBdSettled", oneBdSettledData);
		model.addAttribute("totalIndex", totalIndexData);
		model.addAttribute("estimatedSales", estimatedSalesData);
		model.addAttribute("polygonList", polygonList);
		
		return "forward:WEB-INF/views/chart/trendIndex.jsp";
	}

	@RequestMapping("/dataCrawled")
	public String dataCrawled(Model model) throws Exception {
		
		List<Object> garosu = chartService.dataCrawled();
		List<Object> syarosu = chartService.syarosu();
		/*List<Object> hongdae = chartService.hongdae();
		List<Object> gyunglidan = chartService.gyunglidan();*/
		
		ObjectMapper map = new ObjectMapper();
		
		String garosuData = map.writeValueAsString(garosu);
		String syarosuData = map.writeValueAsString(syarosu);
		/*String hongdaeData = map.writeValueAsString(hongdae);
		String gyunglidanData = map.writeValueAsString(gyunglidan);*/
		
		model.addAttribute("garosu", garosuData);
		model.addAttribute("syarosu", syarosuData);
		/*model.addAttribute("hongdae", hongdaeData);
		model.addAttribute("gyunglidan", gyunglidanData);*/
		return "chart/dataCrawled";
	}
	
	
}
