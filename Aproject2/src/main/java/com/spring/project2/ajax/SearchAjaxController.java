package com.spring.project2.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchAjaxController {

	@RequestMapping("/search.ajax")
	@ResponseBody
	public Map<String, String> searchList(String business_type, String district) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("work", business_type);
		map.put("gu", district);
		return map;
	}
	
}
