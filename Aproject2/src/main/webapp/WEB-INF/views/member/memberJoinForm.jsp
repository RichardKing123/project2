<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<article>
	<div class="container">
		<div id="memberJoinForm">
			<h3 id="memberInfoInput">회원 정보 입력</h3>
			<form class="form-horizontal" action="joinInfo" name="joinForm" method="post" id="joinForm">
				<div class="form-group">
					<label class="control-label col-sm-2" for="id">Id:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userId"
							placeholder="Enter id" name="id"> <input type="button"
							class="btn btn-default" id="overlapIdCheck" value="중복확인" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pwd"
							placeholder="Enter password" name="pwd">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd2">Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pwd2"
							placeholder="Enter password again" name="pwd2">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email"
							placeholder="Enter email" name="email">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" name="emailGet">
								Get a notification</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">JOIN</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</article>