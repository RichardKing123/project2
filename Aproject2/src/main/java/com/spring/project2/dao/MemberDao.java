package com.spring.project2.dao;

import com.spring.project2.domain.Member;

public interface MemberDao {
	
	//회원 로그인 처리 메소드, 로그인 결과를 int로 반환 
	public int login(String id, String password)	;
	
	//id에 해당하는 회원정보를 반환하는 메소드 
	public Member getMember(String id);
	
	//회원정보를 회원 테이블에 저장하는 메소드 
	public void addMember(Member member);
	
	//회원 정보 수정 시에 기존 비밀번호가 맞는지 확인하는 메소드 
	public boolean memberPassCheck(String id, String pass);
	
	//회원 정보를 테이블에서 수정하는 메소드
	public void updateMember(Member member);
	
}
