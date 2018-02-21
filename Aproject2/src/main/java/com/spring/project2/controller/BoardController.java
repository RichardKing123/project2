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
			@RequestParam(
					 value="pageNum", required=false, 
			defaultValue="1") int pageNum) {
		

		// Service 클래스를 이용해 게시 글 리스트를 가져온다.
		Map<String, Object> modelMap = boardService.boardList(pageNum);
			
		model.addAllAttributes(modelMap);
		
		return "board/boardList";
	}
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, int board_no, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
		
		Board board = boardService.getBoard(board_no, true);
		
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/boardDetail";
	}
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(Board board) {
		
		boardService.insertBoard(board);	
		
		return "redirect:boardList";
	}	
	
	@RequestMapping(value="/update")
	public String updateBoard(Model model, HttpServletResponse response, 
			PrintWriter out, int board_no,
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 

		Board board = boardService.getBoard(board_no, false);
		
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/updateForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, 
			PrintWriter out, Board board,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
	
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		boardService.updateBoard(board);
		
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:board/boardList";
	}
	
	@RequestMapping({"/delete", "deleteBoard"})
	public String deleteBoard(HttpServletResponse response, 
			PrintWriter out, int board_no,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") 
			int pageNum) {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 

		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		boardService.deleteBoard(board_no);
	
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:board/boardList";
	}	
}
