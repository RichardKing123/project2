   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<article>
	<form action="updateFaq" name="faqUpdateForm" id="faqUpdateForm" method="post">
		
		<input type="hidden" name="faqNo" value="${faq.faqNo }"/>
			
	<table class="readTable"	>
		<tr>
			<td colspan="4" class="faqTitle"><h2>FAQ 수정하기</h2></td>
		</tr>
	    <tr>
				<td class="questionTh">질문글</td>
				<td class="questionTd">
					<textarea rows="5" cols="50" name="faqTitle"  id="faqTitle">${faq.faqTitle }</textarea>
				</td>	
			</tr>
			<tr>
				<td class="answerTh">답글</td>
				<td class="answerTd">
					<textarea rows="5" cols="50" name="faqContent" id="faqContent">
				    ${faq.faqContent }</textarea>
				 </td>   
			</tr>
			<tr>
			<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td colspan="2" class="tdSpan">
				<input type="submit" id="updateFaq" value="수정하기" />
				&nbsp;&nbsp;				
				<input type="button" value="목록보기" 
					onclick="javascript:window.location.href='faqList'"/></td>
		</tr>
	</table>	
		
	</form>

</article>