<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<article>
	<form action="updateFaq.mvc" name="updateForm" id="updateForm" method="post">
		
		<input type="hidden" name="no" value="${faq.faqNo }"/>
			
	<table class="readTable"	>
		<tr>
			<td colspan="4" class="faqTitle"><h2>FAQ 수정하기</h2></td>
		</tr>
	    <tr>
				<td class="questionTh">질문글</td>
				<td class="questionTd">
					<input type="text" name="question" size="16" id="question"	maxlength="50" value="${faq.faqTitle }"/> 		
				</td>	
			</tr>
			<tr>
				<td class="answerTh">답글</td>
				<td class="answerTd">
					<textarea rows="5" cols="50" name="answer" id="answer">
				    ${faq.faqContent }</textarea>
				 </td>   
			</tr>
			<tr>
			<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td colspan="2" class="tdSpan">
			<input type="reset" value="다시쓰기"/>
				&nbsp;&nbsp;
				<input type="submit" value="수정하기" />
				&nbsp;&nbsp;
				<input type="button" value="목록보기" 
					onclick="javascript:window.location.href='faqList.jsp'"/></td>
		</tr>
	</table>	
		
	</form>

</article>