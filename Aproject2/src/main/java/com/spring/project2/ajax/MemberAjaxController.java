package com.spring.project2.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project2.domain.Member;
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
	
	@RequestMapping("/passFind.ajax")
	public Map<String, String> passFind(Model model, String id, String email, HttpServletResponse response) throws IOException {
		Map<String, String> map = new HashMap<String, String>(); 
		
		Member member = memberService.passFind(id);
		
		if(member == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디 입니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		} else if(!(member.getEmail().equals(email))) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('존재하지 않는 이메일 입니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		} else {
			map.put("pass", member.getPassword());
			return map;
		}
		
	}
}
