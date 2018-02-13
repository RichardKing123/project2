package com.spring.project2.service;

import java.util.Map;

import com.spring.project2.domain.Board;

public interface BoardService {
	
	public abstract Map<String, Object> boardList(int pageNum);
	
	public abstract Board getBoard(int no, boolean isCount);
	
	// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
	public abstract void insertBoard(Board board);

	public boolean isPassCheck(int no, String pass);
	
	// BoardDao를 이용해 게시 글을 수정하는 메서드
	public abstract void updateBoard(Board board);
	
	// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드
	public abstract void deleteBoard(int no);
}
