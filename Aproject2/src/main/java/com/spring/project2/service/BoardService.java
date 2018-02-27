package com.spring.project2.service;

import java.util.List;
import java.util.Map;

import com.spring.project2.domain.Board;
import com.spring.project2.domain.Reply;

public interface BoardService {
	
	public abstract Map<String, Object> boardList(int pageNum,  String  type,  String  keyword);
	
	public abstract Board getBoard(int board_no, boolean isCount);
	
	// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
	public abstract void insertBoard(Board board);

	
	// BoardDao를 이용해 게시 글을 수정하는 메서드
	public abstract void updateBoard(Board board);
	
	// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드
	public abstract void deleteBoard(int board_no);
	
	public abstract List<Reply> replyList(int reply_no);
	
	public Map<String,  Integer>  recommend(int board_no,  String  recommend);
	
	public  void  addReply(Reply  reply);
	
	public  void  updateReply(Reply  reply);
	
	public  void  deleteReply(int  reply_no);
}
