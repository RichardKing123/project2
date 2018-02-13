package com.spring.project2.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project2.domain.Board;
import com.spring.project2.service.BoardService;

//스프링 MVC의 컨트롤러임을 선언하고 있다.
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value= {"/boardList", "/list"}, method=RequestMethod.GET)
	public String boardList(Model model, 
			@RequestParam(value="pageNum", required=false, 
			defaultValue="1") int pageNum) {
		

		// Service 클래스를 이용해 게시 글 리스트를 가져온다.
		Map<String, Object> modelMap = boardService.boardList(pageNum);
			
		model.addAllAttributes(modelMap);
		
		return "boardList";
	}
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, int no, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
		
		Board board = boardService.getBoard(no, true);
		
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "boardDetail";
	}
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(Board board) {
		
		boardService.insertBoard(board);	
		
		return "redirect:boardList";
	}	
	
	@RequestMapping(value="/update")
	public String updateBoard(Model model, HttpServletResponse response, 
			PrintWriter out, int no, String pass,
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		boolean result = boardService.isPassCheck(no, pass);
		
		// 비밀번호가 맞지 않으면
		if(! result) {

			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		}
		Board board = boardService.getBoard(no, false);
		
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "updateForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, 
			PrintWriter out, Board board,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
	
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		boolean result = boardService.isPassCheck(board.getNo(), board.getPass());
		
		// 비밀번호가 맞지 않으면
		if(! result) {

			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		}
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		boardService.updateBoard(board);
		
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:boardList";
	}
	
	@RequestMapping({"/delete", "deleteBoard"})
	public String deleteBoard(HttpServletResponse response, 
			PrintWriter out, int no, String pass,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		boolean result = boardService.isPassCheck(no, pass);
		
		// 비밀번호가 맞지 않으면
		if(! result) {

			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		}
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		boardService.deleteBoard(no);
	
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:boardList";
	}	
}
