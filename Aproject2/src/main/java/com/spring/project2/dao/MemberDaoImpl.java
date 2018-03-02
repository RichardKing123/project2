package com.spring.project2.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	private SqlSessionTemplate sqlSession;
	
	//member mapper namespace
	private final String NAME_SPACE = "com.spring.project2.mapper.MemberMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int login(String id, String password) {
		
		Member member = sqlSession.selectOne(NAME_SPACE + ".login", id);
		int result = -1;
		
		//해당 유저가 없으면 null반
		if (member == null) {
			return result;
		}
		//유저 있으면 1 반환 
		if (member.getPassword().equals(password)) {
			result = 1;
		} else {
			//유저 없으면 0 반환 
			result = 0;
		}
		
		return result;
	}

	@Override
	public Member getMember(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}

	@Override
	public void addMember(Member member) {
		
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	@Override
	public boolean memberPassCheck(String id, String password) {
		boolean result = false;
		
		//디비에서 해당 아이디에 상응하는 비밀번호 대응
		String dbPass = sqlSession.selectOne(NAME_SPACE + ".memberPassCheck", id);
		if (dbPass.equals(password)) {
			//맞으면 true 반환 
			result = true;
		}
		
		return result;
	}

	@Override
	public void updateMember(Member member) {
		sqlSession.update(NAME_SPACE + ".updateMember", member);

	}

	@Override
	public String passFind(String id, String email) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		return sqlSession.selectOne(NAME_SPACE + ".passFind", params);
	}

	@Override
	public String idCheckForPass(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".idCheckForPass", id);
	}

	@Override
	public String emailCheckForPass(String email) {
		
		return sqlSession.selectOne(NAME_SPACE +".emailCheckForPass", email);
	}

}
