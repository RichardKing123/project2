<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('99250836fc8d3100e792c6aa85d55572');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      url://이동할 url 주소
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<article>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout">로그아웃</a>

</article>