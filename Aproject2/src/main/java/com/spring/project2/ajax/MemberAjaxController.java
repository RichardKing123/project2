package com.spring.project2.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project2.service.MemberService;

@Controller
public class MemberAjaxController {
	
	private MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("/passCheck.ajax")
	@ResponseBody
	public Map<String, Boolean> memberPassCheck(String id, String password) {
		
		boolean result = memberService.memberPassCheck(id, password);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", result);
		return map;
	}
}
