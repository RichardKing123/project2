<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<article>
	<div class="container">
		<div id="memberJoinForm">
		<h3 id="joinFormTitle">회원 정보 입력 확인</h3>
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
				<span class="memberSpan">* 이&nbsp;&nbsp;름 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.name }</span>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 이 메 일 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.email }</span>
			</div>
		</div>
		<div id="memberInputOption">
			<div class="memberInputText">
				<span class="memberSpan">메일 수신여부 : </span>
				<span class="inputInfoSpan">${ sessionScope.member.emailGet ? 
					"메일 받음" : "메일 받지 않음" }</span>
			</div>
		</div>
		<div class="submitbutton">
			<input type="button" value="수정하기"
				onclick="document.location.href='joinForm'" class="btn btn-default"/>
			<input type="submit" value="가입완료" 
				onclick="document.location.href='joinResult'" class="btn btn-default"/>
		</div>			
	</div>	
	</div>
</article>