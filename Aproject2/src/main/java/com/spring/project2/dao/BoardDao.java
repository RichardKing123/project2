package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.Board;

public interface BoardDao {
	
	public abstract List<Board> boardList(int startRow, int num);
	
	public abstract Board getBoard(int no, boolean isCount);
	
	public abstract void insertBoard(Board board);
	
	public boolean isPassCheck(int no, String pass);
	
	public abstract void updateBoard(Board board);
	
	public abstract void deleteBoard(int no);
	
	public abstract int getBoardCount();
}
