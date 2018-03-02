<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="container">
		<div class="passFind" id="passFind">
			<form class="form-horizontal" id="passFindForm" method="post">
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="text" class="form-control" id="id"
							placeholder="Enter id" name="id">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="text" class="form-control" id="email"
							placeholder="Enter email" name="email">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="submit" class="form-control" value="find password" />
					</div>
				</div>
			</form>
		</div>
		<!-- 비밀번호가 출력되는 폼 -->
		<%-- <div id="passBox" class="passBox">
			<span class="innerPassBox" id="innerPassBox">${id }님의 비밀번호는 [${ passFind}]입니다</span>
		</div> --%>
	</div>
</article>