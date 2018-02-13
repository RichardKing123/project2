<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>proeject2</title>
<!-- 부트스트랩 + 구현용 기타 library -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 내부 css, js -->
<link rel="stylesheet" type="text/css" href="resources/css/mainpagecss.css" />
<link rel="stylesheet" type="text/css" href="resources/css/member.css" />
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/search.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>

</head>
<body>
	<%@ include file="template/nav.jsp" %>
	<%@ include file="template/header.jsp" %>
	<jsp:include page="${ param.body }" />
	<%@ include file="template/footer.jsp" %>
</body>
</html>