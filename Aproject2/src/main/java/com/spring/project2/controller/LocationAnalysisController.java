package com.spring.project2.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.project2.dao.DaumMapApiDao;
import com.spring.project2.domain.PolygonArea;
import com.spring.project2.domain.PolygonPoint;
import com.spring.project2.service.LocationAnalysisService;
import com.spring.project2.service.SearchService;

@Controller
public class LocationAnalysisController {
	
	private LocationAnalysisService locationAnalysisService;
	
	@Autowired
	public void setLocationAnalysisService(LocationAnalysisService locationAnalysisService) {
		this.locationAnalysisService = locationAnalysisService;
	}

	@Autowired
	private SearchService searchService;
	
	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	@RequestMapping("/locationAnalysisDetail")
	public String locationAnalysisMethod(Model model, String businessType, String bdCodeName, String district) throws Exception {
		
		int stabilityIndex = locationAnalysisService.stabilityIndex(bdCodeName, businessType);
		if(Integer.valueOf(stabilityIndex) == null) {
			model.addAttribute("stabilityIndex", 0);
		} else {
			model.addAttribute("stabilityIndex", stabilityIndex);
		}
		
		List<PolygonArea> polygonAreaList = new ArrayList<PolygonArea>();
		
		List<PolygonPoint> pointList = searchService.getGuPloygon(district);
		PolygonArea polygonArea = new PolygonArea();
		
		polygonArea.setName(district);
		polygonArea.setPointList(pointList);
		polygonAreaList.add(polygonArea);
		
		
		List<Object> shopNo = locationAnalysisService.shopNo(bdCodeName, businessType);
		List<Object> shopRadar = locationAnalysisService.shopRadar(district, bdCodeName);
		
		ObjectMapper map = new ObjectMapper();
		
		String shopNoData = map.writeValueAsString(shopNo);
		String shopRadarData = map.writeValueAsString(shopRadar);
		String polygonList = map.writeValueAsString(polygonAreaList);
		

		
		model.addAttribute("polygonList", polygonList);
		model.addAttribute("shopRadar", shopRadarData);
		model.addAttribute("shopNo", shopNoData);
		model.addAttribute("bdCodeName", bdCodeName);
		model.addAttribute("businessType", businessType);
		model.addAttribute("district", district);
		return "chart/locationAnalysisDetail";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String nullPointException(Model model) {
		model.addAttribute("title", "OOPS! There is no data for this business area.<br>"
				+ "Plz click image to select again");
		return "errors/nullPointException";
	}
	
}
