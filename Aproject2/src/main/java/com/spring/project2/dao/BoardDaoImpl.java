package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.Board;

// 이 클래스가 데이터 액세스(데이터 저장소) 계층의 컴포넌트(Bean) 임을 선언한다.
@Repository
public class BoardDaoImpl implements BoardDao {

	private final String NAME_SPACE = "com.spring.project2.mapper.BoardMapper";
	
	private SqlSessionTemplate sqlSession;
		
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<Board> boardList(int startRow, int num) {
		
		// SQL 파라미터가 여러 개일 경우 Map을 이용하여 지정한다.
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE + ".boardList", params);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount");
	}
	
	@Override
	public Board getBoard(int no, boolean isCount) {
		
		// 게시 글 상세보기 요청만 게시 글 읽은 횟수를 증가시킨다.
		if(isCount) {
			sqlSession.update(NAME_SPACE + ".incrementReadCount", no);
		}
		
		// getBoard 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.		 
		return sqlSession.selectOne(NAME_SPACE + ".getBoard", no);
	}

	@Override
	public void insertBoard(Board board) {
		
		// insertBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.insert(NAME_SPACE + ".insertBoard", board);
	}
	
	public boolean isPassCheck(int no, String pass) {	

		boolean result = false;
		
		// isPassCheck 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.
		String dbPass = sqlSession.selectOne(
				NAME_SPACE + ".isPassCheck",	no);

		// 비밀번호가 맞으면 true가 반환된다.
		if(dbPass.equals(pass)) {
			result = true;		
		}
		return result;
	}
	
	@Override
	public void updateBoard(Board board) {
		
		// updateBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.update(NAME_SPACE + ".updateBoard", board);
	}

	@Override
	public void deleteBoard(int no) {
		
		// deleteBoard 맵핑 구문을 호출하면서 no를 파라미터로 지정했다.
		sqlSession.delete(NAME_SPACE + ".deleteBoard", no);
	}
}
