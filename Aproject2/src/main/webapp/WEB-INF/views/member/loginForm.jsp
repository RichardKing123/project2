<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<article>
	<div class="container">
		<div class="loginForm">
			<form class="form-horizontal" action="login" method="post">
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="text" class="form-control" id="id"
							placeholder="Enter id" name="id">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="password" class="form-control" id="password"
							placeholder="Enter password" name="password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="submit" class="form-control" value="JOIN" />
					</div>
				</div>
			</form>
		</div>

	</div>
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naver_id_login">naver login form</div>

	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("1WiDgNpz9SVwwS4Cu_Au", "http://localhost:8080/project2/loginForm");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 3, 40);
	  	naver_id_login.setDomain("YOUR_SERVICE_URL");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
 	</script>
</article>
