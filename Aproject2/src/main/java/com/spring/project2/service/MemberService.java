package com.spring.project2.service;

import com.spring.project2.domain.Member;

public interface MemberService {

	//로그인 처리를 정수로 반환하는 메소드
	public int login(String id, String password);
	
	//회원 정보 반환 메소드
	public Member getMember(String id);
	
	//아이디 중복 체크 메소드
	public boolean overlapIdCheck(String id);
	
	//회원 추가 메소드
	public void addMember(Member member);
	
	//회원 수정 시 비밀번호 체크 메소드
	public boolean memberPassCheck(String id, String password);
	
	//회원정보 업데이트 메소드
	public void updateMember(Member member);
	
}
