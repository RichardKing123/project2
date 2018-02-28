package com.spring.project2.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.BoardDao;
import com.spring.project2.domain.Board;
import com.spring.project2.domain.Reply;

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
	public  void  updateReply(Reply  reply)  {
		boardDao.updateReply(reply);
		}
	@Override
	public  void  deleteReply(int  reply_no)  {
		boardDao.deleteReply(reply_no);
		}
	
	@Override
	public  void  addReply(Reply  reply)  {
		boardDao.addReply(reply);
		}
	
	@Override
	public Map<String, Object> boardList(int pageNum,  String  type,  String  keyword) {
		
		// 요청 파라미터의 pageNum을 현재 페이지로 설정
		int currentPage = pageNum;
				
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount=0;
		
		boolean  searchOption  =  (type.equals("null") 
				||  keyword.equals("null"))  ?  false  :  true; 
		
		// BoardDao를 이용해 전체 게시 글 수를 얻어온다.		
		listCount = boardDao.getBoardCount(type,keyword);		
		
		if(listCount > 0) {
			
			List<Board> boardList = boardDao.boardList(startRow, PAGE_SIZE,type,keyword);
			
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
			modelMap.put("pageGroup", PAGE_GROUP);
			modelMap.put("searchOption",  searchOption);
			
			if(searchOption) {
				try  {
					modelMap.put("keyword",  URLEncoder.encode(keyword,  "utf-8"));
					}  catch  (UnsupportedEncodingException  e)  {
					e.printStackTrace();
					}
					modelMap.put("word",  keyword);
					modelMap.put("type",  type);
			}
			return modelMap;			
		} else {
			return null;
		}
	}
	@Override
	public  List<Reply>  replyList(int  reply_no)  {
		return  boardDao.replyList(reply_no);
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
	
	@Override
	public Map<String,  Integer>  recommend(int  board_no,  String  recommend)  {
		boardDao.updateRecommend(board_no,  recommend);
		Board  board  =  boardDao.getRecommend(board_no);
		System.out.println("recommend : " + board.getRecommend());
		Map<String,  Integer> map  =  new  HashMap<String,  Integer>(); 
		map.put("recommend",  board.getRecommend());
		map.put("thank",  board.getThank());
		return map;
		}
}
