package com.spring.project2.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.project2.domain.Member;
import com.spring.project2.service.MemberService;




@Controller
@SessionAttributes("member")
public class MemberController {

	private MemberService memberService;
	
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)	
	public String login(Model model, @RequestParam("id") String id, 
			@RequestParam("password") String password, 
			HttpSession session, HttpServletResponse response) 
					throws ServletException, IOException {
		
		int result = memberService.login(id, password);
		
		if(result == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디 입니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
			
		} else if(result == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 다릅니다.');");
			out.println("	location.href='loginForm'");
			out.println("</script>");
			
			return null;
		}		
		
		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);	
		
		if(member.getId().equals("admin")) {
			session.setAttribute("isAdmin", true);
		}

		model.addAttribute("member", member);
		System.out.println("member.name : " + member.getName());
	
		return "redirect:/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {	
		
		// 현재 세션을 종료하고 새로운 세션을 시작
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@RequestMapping("/joinInfo")
	public String joinInfo(Model model, Member member,
			String password1, String emailId, String emailDomain,
			@RequestParam(value="emailGet", required=false, 
				defaultValue="false")boolean emailGet) {
		System.out.println("joinInfo 기동");
		
		member.setPassword(password1);
		member.setEmail(emailId + "@" + emailDomain);

		member.setEmailGet(Boolean.valueOf(emailGet));

		model.addAttribute("member", member);	
		return "member/memberInfo";
	}
	
	@RequestMapping("/joinResult")
	public String joinResult(SessionStatus sessionStatus, Member member) {
		
		System.out.println("joinResult : " + member.getName());
		memberService.addMember(member);
		
		/* 세션 영역에서 객체를 삭제
		 * 세션 영역에서만 삭제되고 모델에는 삭제되지 않는다.
		 * 세션을 다시 시작하지 않기 때문에 세션이 계속해서 유지된다.
		 **/
		sessionStatus.setComplete();

		//현재 세션 종료하고 싶으면 invalidate쓰면 됨
			
		return "redirect:main";
	}
	
	@RequestMapping("/overlapIdCheck")	
	public String overlapIdCheck(Model model, String id) {		
		
		// 회원 아이디 중복 여부를 받아온다.
		boolean overlap = memberService.overlapIdCheck(id);
		
		// model에 id와 회원 아이디 중복 여부를 저장 한다. 
		model.addAttribute("id", id);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}	
	
	@RequestMapping("/memberUpdateForm")
	public String updateForm(Model model, String id) {
		
		Member member = memberService.getMember(id);
		model.addAttribute("member", member);
		
		return "member/memberUpdateForm";
	}	
	
	@RequestMapping("/memberUpdateInfo")
	public String memberUpdateInfo(Model model, Member member,
			String password1, String emailId, String emailDomain,
			@RequestParam(value="emailGet", required=false, 
				defaultValue="false")boolean emailGet) {
		System.out.println("/memberUpdateInfo ");
		
		member.setPassword(password1);
		member.setEmail(emailId + "@" + emailDomain);				
			
		member.setEmailGet(Boolean.valueOf(emailGet));
		

		model.addAttribute("member", member);	
		return "member/memberUpdateInfo";
	}
	
	@RequestMapping("/memberUpdateResult")
	public String updateResult(Model model, HttpSession session, SessionStatus sessionStatus, 
			@ModelAttribute("member") Member member) {
		
		System.out.println("updateResult : " + member.getId());
		memberService.updateMember(member);
		
		return "redirect:main";
	}
	
	
}
