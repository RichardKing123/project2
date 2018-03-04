<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ page isErrorPage="true" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>	
	<!-- 
		스프링 태그 라이브러리를 이용해 root-context.xml에서 설정한
		titleMessages.properties 메시지 자원에 접근해 code 속성 지정한
		키에 해당하는 메시지를 출력한다.
	-->
	
	<%-- <div id="testId">
		<h2>Null Point Exception Error</h2>	
		<h2>${title}</h2>
		<p><%= exception.getClass().getName() %><br/>
		<%= exception.getMessage() %>
		<% exception.printStackTrace(); %></p>
	</div> --%>
	<div style="margin-top:30px;text-align:center">
		<h2><i>${title }</i></h2>
		<a href="locationAnalysis">	
			<img src="resources/images/exceptionImg.jpg" style="border-radius:5px;width:500px;margin-top:30px"/>
		</a>
	</div>
</article>