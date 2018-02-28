package com.spring.project2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.Board;
import com.spring.project2.domain.Reply;

@Repository
public class BoardDaoImpl implements BoardDao {

	private final String NAME_SPACE = "com.spring.project2.mapper.BoardMapper";
	
	private SqlSessionTemplate sqlSession;
		
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<Reply> replyList(int board_no){
		return  sqlSession.selectList(NAME_SPACE  +  ".replyList",  board_no);
	}
	
	@Override
	public  void  updateReply(Reply  reply)  {
		sqlSession.update(NAME_SPACE  +  ".updateReply",  reply);
		}
	
	@Override
	public  void  addReply(Reply  reply)  {
		sqlSession.insert(NAME_SPACE  +  ".addReply",  reply);
		}
	
	@Override
	public  void  deleteReply(int  reply_no)  {
		sqlSession.delete(NAME_SPACE  +  ".deleteReply",  reply_no);
	}
	
	@Override
	public  void  updateRecommend(int  board_no,  String  recommend)  {
		System.out.println("boardDao"+board_no);
		System.out.println("boardDao"+recommend);
	Map<String,  Object>  params  =  new  HashMap<String,  Object>();
	params.put("borad_no",  board_no);
	params.put("recommend",  recommend);
	sqlSession.update(NAME_SPACE  +  ".updateRecommend",  params);
	}
	
	@Override
	public  Board  getRecommend(int  board_no)  {
		return  sqlSession.selectOne(NAME_SPACE  +  ".getRecommend",  board_no);
	}
	
	@Override
	public List<Board> boardList(int startRow, int num) {
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE + ".boardList", params);
	}

	@Override
	public int getBoardCount(String  type,  String  keyword) {
		Map<String,  String>  params  =  new  HashMap<String,  String>();
		params.put("type",  type);
		params.put("keyword",  keyword);
		return  sqlSession.selectOne(NAME_SPACE  +  ".getBoardCount",  params);
	}
	
	@Override
	public Board getBoard(int board_no, boolean isCount) {
		
		// 게시 글 상세보기 요청만 게시 글 읽은 횟수를 증가시킨다.
		if(isCount) {
			sqlSession.update(NAME_SPACE + ".incrementReadCount", board_no);
		}
		
		// getBoard 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.		 
		return sqlSession.selectOne(NAME_SPACE + ".getBoard", board_no);
	}

	@Override
	public void insertBoard(Board board) {
		
		// insertBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.insert(NAME_SPACE + ".insertBoard", board);
	}

	
	@Override
	public void updateBoard(Board board) {
		
		// updateBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.update(NAME_SPACE + ".updateBoard", board);
	}

	@Override
	public void deleteBoard(int board_no) {
		
		// deleteBoard 맵핑 구문을 호출하면서 no를 파라미터로 지정했다.
		sqlSession.delete(NAME_SPACE + ".deleteBoard", board_no);
	}
	
	@Override
	public  List<Board>  boardList(
	int  startRow,  int  num,  String  type,  String  keyword)  {
	//  SQL 파라미터가 여러 개일 경우 Map을 이용하여 지정한다.
	Map<String,  Object>  params  =  new  HashMap<String,  Object>();
	params.put("startRow",  startRow);
	params.put("num",  num);
	params.put("type",  type);
	params.put("keyword",  keyword);
	return  sqlSession.selectList(NAME_SPACE  +  ".boardList",  params);
	}
	
}
