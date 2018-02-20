<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<a href="#home" aria-controls="home" role="tab" data-toggle="tab">개요</a>
			</li>
			<li role="presentation">
			<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
			</li>
		</ul>
		
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">${code_name }</div>
			<div role="tabpanel" class="tab-pane" id="profile">${business }</div>
		</div>
	</div>
	</div>
</body>
</html>