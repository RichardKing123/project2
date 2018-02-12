<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="js/jquery-1.11.3.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<article>
<table style="width:80%", align="center">
<tr>
	<td>
		<h1  style="width:100%", align="left">FAQ 게시판</h1>
	</td>
</tr>
<tr>
	<td>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
 	<c:forEach var="faq" items="${ faqList }" varStatus="status">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading0${ status.count }">
      <h4 class="panel-title">
        <a data-toggle="collapse" 
        data-parent="#accordion" 
        href="#collapse0${ status.count }" aria-expanded="false" 
        aria-controls="collapse0${ status.count }">
          ${ faq.faqTitle }
        </a>
      </h4>
    </div>
      <div id="collapse0${ status.count }" class="panel-collapse collapse" 
    role="tabpanel" aria-labelledby="heading0${ status.count }">
       <div class="panel-body">
        ${ faq.content }
       </div>
    </div>
  </div>
  	</c:forEach>
 	</div>
 	</td>
 </tr>
 <c:if test="${sessionScope.isAdminCheck}">
 <tr>
 	<td>
 	<input type="button" value="FAQ 등록" 
 	  onclick="javascript:window.location.href='faqWriteForm.jsp'"/>
 	</td>
 </tr>
 </c:if>
 </table>
</article>
