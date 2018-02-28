package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.Board;
import com.spring.project2.domain.Reply;

public interface BoardDao {
	
	public abstract List<Board> boardList(int startRow, int num);
	
	public abstract Board getBoard(int board_no, boolean isCount);
	
	public abstract void insertBoard(Board board);
	
	public abstract void updateBoard(Board board);
	
	public abstract void deleteBoard(int board_no);
	
	public abstract int getBoardCount(String  type,  String  keyword);
	
	public abstract List<Board> boardList(
			int startRow, int num, String type, String keyword);
	
	public abstract List<Reply> replyList(int board_no);
	
	public  abstract  void  updateRecommend(int board_no,  String  recommend);
	
	public  abstract  Board  getRecommend(int  board_no);

	public void addReply(Reply reply);
	
	public  void  updateReply(Reply  reply);
	
	public  void  deleteReply(int  reply_no);
}
