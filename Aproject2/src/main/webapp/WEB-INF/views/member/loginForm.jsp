<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<article>
	<div class="container">
		<div class="loginForm">
			<form class="form-horizontal" action="/action_page.php">
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="text" class="form-control" id="id"
							placeholder="Enter id" name="id">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10" style="float: none;">
						<input type="password" class="form-control" id="pwd"
							placeholder="Enter password" name="pwd">
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
		var naver_id_login = new naver_id_login("1WiDgNpz9SVwwS4Cu_Au",
				"http://localhost:8080/loginForm");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("YOUR_SERVICE_URL");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("1WiDgNpz9SVwwS4Cu_Au",
				"http://localhost:8080/loginForm");
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
		}
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
	</script>
</article>
