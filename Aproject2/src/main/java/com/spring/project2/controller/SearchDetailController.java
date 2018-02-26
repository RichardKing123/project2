package com.spring.project2.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.project2.domain.BdEstimatedSales;
import com.spring.project2.domain.BdFloatingPopulation;
import com.spring.project2.domain.BdIo;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.Bd_Shop;
import com.spring.project2.domain.PolygonArea;
import com.spring.project2.domain.PolygonPoint;
import com.spring.project2.service.SearchService;

@Controller
public class SearchDetailController {
	
	@Autowired
	private SearchService searchService;
	

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	//상세보기
	@RequestMapping("searchDetail")
	public String searchDetail(Model model, String bd_code_name, String business_type, String district) throws Exception {
		System.out.println(bd_code_name);
		System.out.println(business_type);
		ObjectMapper mapper = new ObjectMapper();
		Bd_Shop shop = searchService.searchDetail(bd_code_name, business_type);
		List<BdEstimatedSales> sales = searchService.searchSales(bd_code_name, business_type);
		List<BdFloatingPopulation> floating = searchService.searchFloating(bd_code_name);
		List<BdSettledPopulation> settled = searchService.searchSettled(bd_code_name);
		List<BdIo> Io = searchService.searchIo(bd_code_name);
		

		List<PolygonArea> polygonAreaList = new ArrayList<PolygonArea>();
		
		List<PolygonPoint> pointList = searchService.getGuPloygon(district);
		PolygonArea polygonArea = new PolygonArea();
		
		polygonArea.setName(district);
		polygonArea.setPointList(pointList);
		polygonAreaList.add(polygonArea);
		String polygonList = mapper.writeValueAsString(polygonAreaList);
		model.addAttribute("polygonList", polygonList);
		System.out.println(polygonList);

		
		String shopData = mapper.writeValueAsString(shop);
		
		String salesData = mapper.writeValueAsString(sales);
		String floatingData = mapper.writeValueAsString(floating);
		String settledData = mapper.writeValueAsString(settled);
		String ioData = mapper.writeValueAsString(Io);
		model.addAttribute("shopData", shopData);
		model.addAttribute("salesData", salesData);
		model.addAttribute("floatingData", floatingData);
		model.addAttribute("settledData", settledData);
		model.addAttribute("ioData", ioData);
		
		
		
		model.addAttribute("shop", shop);
		model.addAttribute("sales", sales);
		model.addAttribute("floating", floating);
		model.addAttribute("settled", settled);
		model.addAttribute("io", Io);
		
		model.addAttribute("bd_code_name",bd_code_name);
		model.addAttribute("business_type",business_type);
		
		return "forward:WEB-INF/views/search/searchDetail.jsp";
	}
}
