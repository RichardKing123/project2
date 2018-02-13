<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<article>
	<form name="faqWrite" action="faqWrite.mvc" id="faqWrite" method="post">
		<table class="readTable">
			<tr>
				<td colspan="2" class="faqTitle"><h2>FAQ 글쓰기</h2></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td class="questionTh">질문글</td>
				<td class="questionTd">
					<input type="text" name="question" size="16" id="question"	maxlength="50"/> 		
				</td>	
			</tr>
			<tr>
				<td class="answerTh">답글</td>
				<td class="answerTd">
					<textarea rows="4" cols="50" name="answer" form="answer">
				    </textarea>
				</td>    
			</tr>
			<tr>
			<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td colspan="2" class="tdSpan">
			<input type="reset" value="다시쓰기"/>
				&nbsp;&nbsp;
				<input type="submit" value="등록하기" />
				&nbsp;&nbsp;
				<input type="button" value="목록보기" 
					onclick="javascript:window.location.href='faqList.jsp'"/></td>
		</tr>
			
		</table>
	
	</form>

</article>    
    