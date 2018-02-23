package com.spring.project2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.project2.dao.DaumMapApiDao;
import com.spring.project2.domain.PolygonArea;

@Controller
public class DaumMapApiController {
	
	@Autowired
	private DaumMapApiDao dao;	
	
	private static String[] guNames = { 
			"용산구", "중구", "종로구", "서대문구", "동대문구", "성북구", "성동구", "마포구", 
			"중랑구", "은평구", "영등포구", "양천구", "송파구", "서초구", "동작구",
			"도봉구", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구" };
	
	@RequestMapping("/main")
	public String main(Model model) throws JsonProcessingException {
		
		List<PolygonArea> polygonAreaList = dao.getPolygoAreaList(guNames);
		
		// 직렬화 -> 자바스크립트에서 바로 사용할 수 있도록
		ObjectMapper mapper = new ObjectMapper();
		String polygonList = mapper.writeValueAsString(polygonAreaList);
		System.out.println(polygonList);
		
		model.addAttribute("polygonList", polygonList);
				
		return "main";
	}
	
	
	@RequestMapping("/daum")	
	public String index(Model model) throws JsonProcessingException {		
		List<PolygonArea> polygonAreaList = dao.getPolygoAreaList(guNames);
		
		// 직렬화 -> 자바스크립트에서 바로 사용할 수 있도록
		ObjectMapper mapper = new ObjectMapper();
		String polygonList = mapper.writeValueAsString(polygonAreaList);
		System.out.println(polygonList);
		
		model.addAttribute("polygonList", polygonList);
		return "daum";
	}
	
	@RequestMapping("/sh")	
	public String index1(Model model, float lat, float lng) throws JsonProcessingException {		
		List<PolygonArea> polygonAreaList = dao.getPolygoAreaList(guNames);
		
		// 직렬화 -> 자바스크립트에서 바로 사용할 수 있도록
		ObjectMapper mapper = new ObjectMapper();
		String polygonList = mapper.writeValueAsString(polygonAreaList);
		System.out.println(polygonList);
		
		model.addAttribute("polygonList", polygonList);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		return "sh";
	}
	
	@RequestMapping("/detail")	
	public String index2(Model model,  float lat, float lng) throws JsonProcessingException {		
		List<PolygonArea> polygonAreaList = dao.getPolygoAreaList(guNames);
		
		// 직렬화 -> 자바스크립트에서 바로 사용할 수 있도록
		ObjectMapper mapper = new ObjectMapper();
		String polygonList = mapper.writeValueAsString(polygonAreaList);
		System.out.println(polygonList);
		
		model.addAttribute("polygonList", polygonList);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		return "detail";
	}
	
	
}

