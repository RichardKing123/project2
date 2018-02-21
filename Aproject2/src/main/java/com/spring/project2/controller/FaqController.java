package com.spring.project2.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.project2.domain.Faq;
import com.spring.project2.service.FaqService;


@Controller
public class FaqController {
	
	
	private FaqService faqService;
	
	@Autowired
	public void setFaqService(FaqService faqService) {
		this.faqService = faqService;
	}
	
	@RequestMapping(value= {"/faqList"}, method=RequestMethod.GET)
	public String faqList(Model model) {
		
		List<Faq> faqList = faqService.faqList();
		
		model.addAttribute("faqList", faqList);
		
		
		
		return "faq/faqList";
		
	}
	
	@RequestMapping("/faqDetail")
	public String faqDetail(Model model, int faqNo) {
		
		Faq faq = faqService.getFaq(faqNo);
		
		model.addAttribute("faq", faq);
		
		return "faq/faqDetail";
	}
	
	@RequestMapping(value="/faqWrite", method=RequestMethod.POST)
	public String insertFaq(Faq faq) {
		faqService.insertFaq(faq);
		
		return "redirect:faq/faqList";
	}
	
	@RequestMapping(value="/faqUpdate")
	public String updateBoard(Model model, HttpServletResponse response,
			PrintWriter out, int faqNo) {
		
		Faq faq = faqService.getFaq(faqNo);
		
		model.addAttribute("faq", faq);
		
		return "faq/faqUpdateForm";
	}
	
	@RequestMapping(value="faqUpdate", method=RequestMethod.POST)
	public String updateFaq(HttpServletResponse response,
			PrintWriter out, Faq faq) {
		
		faqService.updateFaq(faq);
		
		return "redirect:faq/faqList";
		
	}
	
	@RequestMapping("/deleteFaq")
	public String deleteFaq(HttpServletResponse Response,
			PrintWriter out, int faqNo) {
		
	faqService.deleteFaq(faqNo);
	
	return "redirect:faq/faqList";
	}
	
	
	

}
