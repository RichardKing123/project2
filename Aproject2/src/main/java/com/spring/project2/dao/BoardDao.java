package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.Board;

public interface BoardDao {
	
	public abstract List<Board> boardList(int startRow, int num);
	
	public abstract Board getBoard(int board_no, boolean isCount);
	
	public abstract void insertBoard(Board board);
	
	public abstract void updateBoard(Board board);
	
	public abstract void deleteBoard(int board_no);
	
	public abstract int getBoardCount();
}
