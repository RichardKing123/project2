<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
	<div id="memberJoinForm">
	<h3 id="joinFormTitle">회원 정보 수정 확인</h3>
		<div id="memberInputDefault">			
			<div class="memberInputText">
				<span class="memberSpan">* 아이디 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.id }</span>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 비밀번호 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.password }</span>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 이 메 일 : </span>
				<span class="inputInfoSpan">${ sessionScope.m.email }</span>
			</div>
		</div>
		<div id="memberInputOption">
			<div class="memberInputText">
				<span class="memberSpan">메일 수신여부 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.emailGet ? 
					"메일 받음" : "메일 받지 않음" }</span></div>
			<div class="memberInputText">
				<span class="memberSpan"> 자택전화 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.phone }</span>
			</div>
		</div>
		<div class="submitbutton">
			<input type="button" value="RETURN FORM" class="btn btn-default"
				onclick="document.location.href='memberUpdateForm?id=${sessionScope.m.id}'"/>
			<input type="submit" value="MODIFY" class="btn btn-default"
				onclick="document.location.href='memberUpdateResult'"/>
		</div>						
	</div>	
</article>