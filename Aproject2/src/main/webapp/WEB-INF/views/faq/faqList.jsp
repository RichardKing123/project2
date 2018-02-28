<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<script>
	$(function() { 
		
		
		$(".btnDelete").click(function() {
			var result = confirm("현재 FAQ를 삭제 하시겠습니까?");
			if(result) {
				var faqNo = $(this).attr("data-no");
				window.location.href="deleteFaq?faqNo=" + faqNo;
			}
		});
		
	});
</script>
<article>
<table style="width:980px; margin: 0 auto;">
<tr>
	<td>
		<h1  style="width:100%;" align="left" >FAQ 게시판</h1>
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
        	<span style="display: inline-block; width: 820px;">${ faq.faqContent }</span>
        	<c:if test="${sessionScope.isAdmin}">
        	<span><input type="button" value="수정" 
 	  onclick="javascript:window.location.href='faqUpdateForm?faqNo=${faq.faqNo}'"/>
 	  		&nbsp;&nbsp;&nbsp;
 	  		<input type="button" value="삭제" class="btnDelete" data-no="${ faq.faqNo}"/></span>
 	        </c:if>
       </div>
    </div>
  </div>
  	</c:forEach>
 	</div>
 	</td>
 </tr>
 <c:if test="${sessionScope.isAdmin}">
 <tr>
 	<td colspan="2">
 	<input type="button" value="FAQ 등록" 
 	  onclick="javascript:window.location.href='faqWriteForm'"/>
 	</td> 	
 </tr>
 </c:if>
 </table>
</article>
