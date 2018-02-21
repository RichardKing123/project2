<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>검색 상세페이지</title>
</head>
<body>
<div id="container">
	<div role="tabpanel">
		<ul class="nav nav-tabs" role="tablist"> 
			<li role="presentation" class="active">
			<a href="#home" aria-controls="home" role="tab" data-toggle="tab">개업률/폐업률</a>
			</li>
			<li role="presentation">
			<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">매출분석</a>
			</li>
		</ul>
		<!-- 개업률 폐업률 -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
			<h2>${bd_code_name }/${business_type }</h2>
				<table id="shop_number">
					<tr>
						<th>기준년</th>
						<th>점포수</th>
						<th>개업률</th>
						<th>개업수</th>
						<th>폐업률</th>
						<th>폐업수</th>
					</tr>
					<tr>
						<td>2017</td>
						<c:if test="${empty shop.no_of_shop }">
							<td>0</td>
						</c:if>
						<c:if test="${empty shop.open_rate }">
							<td>0%</td>
						</c:if>
						<c:if test="${empty shop.no_of_open }">
							<td>0</td>
						</c:if>
						<c:if test="${empty shop.close_rate }">
							<td>0%</td>
						</c:if>
						<c:if test="${empty shop.no_of_close }">
							<td>0</td>
						</c:if>
						<c:if test="${not empty shop.no_of_shop }">
							<td>${shop.no_of_shop }</td>
						</c:if>
						<c:if test="${not empty shop.open_rate }">
							<td>${shop.open_rate }%</td>
						</c:if>
						<c:if test="${not empty shop.no_of_open }">
							<td>${shop.no_of_open }</td>
						</c:if>
						<c:if test="${not empty shop.close_rate }">
							<td>${shop.close_rate }%</td>
						</c:if>
						<c:if test="${not empty shop.no_of_close }">
							<td>${shop.no_of_close }</td>
						</c:if>
					</tr>
				</table>
			</div>
			<!-- 상세보기 매출분석 -->
			<div role="tabpanel" class="tab-pane" id="profile">
				<h2>${bd_code_name }/${business_type }</h2>
				<h1>월 성별 매출건수 추이 분석</h1>
				<table id="genderTable">
					<tr>
						<th>년월</th>
						<th>남성</th>
						<th>여성</th>
					</tr>
					<c:if test="${not empty sales }">
					<c:forEach var="s" items="${sales }">
					<tr>
						<td>${s.bdDate }</td>
						<td>${s.maleSalesVolume }</td>
						<td>${s.femaleSalesVolume }</td>
					</tr>
					</c:forEach>
					</c:if>
				</table>
			</div>
		
		</div>
	</div>
	</div>
</body>
</html>