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
	public Map<String, String> searchList(String work, String gu) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("work", work);
		map.put("gu", gu);
		return map;
	}
	
}
