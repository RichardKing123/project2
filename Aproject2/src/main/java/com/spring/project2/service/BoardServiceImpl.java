package com.spring.project2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.BoardDao;
import com.spring.project2.domain.Board;

// 이 클래스가 서비스 계층(비즈니스 로직)의 컴포넌트(Bean) 임을 선언하고 있다.
@Service
public class BoardServiceImpl implements BoardService {

	// 한 페이지에 보여 줄 게시 글의 수를 상수로 선언
	private static final int PAGE_SIZE = 10;
	
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@Override
	public Map<String, Object> boardList(int pageNum) {
		
		// 요청 파라미터의 pageNum을 현재 페이지로 설정
		int currentPage = pageNum;
				
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		// BoardDao를 이용해 전체 게시 글 수를 얻어온다.		
		int listCount = boardDao.getBoardCount();		
		
		if(listCount > 0) {
			
			List<Board> boardList = boardDao.boardList(startRow, PAGE_SIZE);
			
			int pageCount = 
					listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);		
						
			// 현재 페이지 그룹의 마지막 페이지 : 10, 20, 30...
			int endPage = startPage + PAGE_GROUP - 1;
		
			if(endPage > pageCount) {
				endPage = pageCount;
			}	
			
			Map<String, Object> modelMap = new HashMap<String, Object>();		
			
			modelMap.put("boardList", boardList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("PAGE_GROUP", PAGE_GROUP);
			
			return modelMap;			
		} else {
			return null;
		}
	}

	@Override
	public Board getBoard(int board_no, boolean isCount) {
		return boardDao.getBoard(board_no, isCount);
	}

	// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}
	
	// BoardDao를 이용해 게시 글을 수정하는 메서드
	@Override
	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}

	// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드
	@Override
	public void deleteBoard(int board_no) {
		boardDao.deleteBoard(board_no);
	}
}
