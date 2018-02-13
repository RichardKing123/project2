<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<article>
	<div class="container">
		<div id="memberJoinForm">
			<h3 id="memberInfoInput">회원 정보 입력</h3>
			<form class="form-horizontal" action="joinInfo" name="joinForm" method="post" id="joinForm">
			<!-- 회원 아이디 중복검사 여부를 히든으로 저장 -->
			<input type="hidden" name="isIdCheck" id="isIdCheck" value="false">
				<div class="form-group">
					<label class="control-label col-sm-2" for="id">Id:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userId"
							placeholder="Enter id" name="id"> 
						<input type="button"
							class="btn btn-default" id="overlapIdCheck" value="중복확인" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password1">Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password1"
							placeholder="Enter password" name="password1" pattern="[A-Za-z0-9]*">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password2">Password Check:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password2"
							placeholder="Enter password again" name="password2" pattern="[A-Za-z0-9]*">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
					
						<!-- <input type="email" class="form-control" id="email"
							placeholder="Enter email" name="email"> -->
					
						<input type="text" name="emailId" size="10" id="emailId" class="form-control" style="width:30%"
							value="${ sessionScope.member.email.split('@')[0] }"/>@ 
						<input type="text" name="emailDomain" size="10" id="emailDomain" class="form-control" style="width:30%"					
							value="${ sessionScope.member.email.split('@')[1] }"/>
						<select name="selectDomain" id="selectDomain" class="selectpicker">
							<option>직접입력</option>
							<option>네이버</option>
							<option>다음</option>
							<option>한메일</option>
							<option>구글</option>										
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="control-group">
							<label class="control control--radio">Accept Email Notification
								<input type="radio" name="emailGet" value="true"
									${ sessionScope.member.emailGet ? "checked" : "" }/>
								<span class="control__indicator"></span>
							</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control control--radio">Do not Accept Notification
								<input type="radio" name="emailGet" value="false"
									${ sessionScope.member.emailGet ? "" : "checked" }/>
								<span class="control__indicator"></span>
							</label>
						</div>
					</div>
				</div><br/><br/><br/>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 submitbutton">
						<input type="reset" value="RESET" class="btn btn-default"/>
						<input type="submit" value="JOIN" class="btn btn-default"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</article>