<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="main">CodeLaw</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="main">Home</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href='${pageContext.servletContext.contextPath}/
					${ sessionScope.isLogin ? "logout" : "loginForm" }' class="dropdown-toggle glyphicon glyphicon-log-in" data-toggle="dropdown" role="button" aria-expanded="false">&nbsp;${ sessionScope.isLogin ? "로그아웃" : "로그인" }<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href='${ sessionScope.isLogin ? "logout" : "loginForm" }' id="login_property">${ sessionScope.isLogin ? "로그아웃" : "로그인" }</a></li>
            <li><c:if test="${ not sessionScope.isLogin }" >	
					<a href="joinForm">회원가입</a>
				</c:if>
				<c:if test="${ sessionScope.isLogin }" >
					<a href="memberUpdateForm?id=${ sessionScope.member.id }">정보수정</a>
				</c:if></li>
            <li><a href="#">비밀번호 찾기</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>