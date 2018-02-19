package com.spring.project2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2.dao.MemberDao;
import com.spring.project2.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	
	private MemberDao memberDao;
	
	@Autowired
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int login(String id, String password) {
		
		System.out.println("memberId : " + id + "password : " + password);
		return memberDao.login(id, password);
	}

	@Override
	public Member getMember(String id) {
		
		return memberDao.getMember(id);
	}

	@Override
	public boolean overlapIdCheck(String id) {
		
		Member member = memberDao.getMember(id);
		//아이디 중복 체크 콘솔에서 확인
		System.out.println("overlapCheck - member : " + member);
		
		if (member == null) {
			return false;
		}
		
		return true;
	}

	@Override
	public void addMember(Member member) {
		
		memberDao.addMember(member);

	}

	@Override
	public boolean memberPassCheck(String id, String password) {
		
		return memberDao.memberPassCheck(id, password);
	}

	@Override
	public void updateMember(Member member) {
		
		memberDao.updateMember(member);

	}

}
