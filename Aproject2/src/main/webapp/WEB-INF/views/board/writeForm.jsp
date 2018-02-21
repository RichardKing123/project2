<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<article>
<form name="writeForm" action="writeProcess" id="writeForm" 
	method="post">
	<table class="readTable">
		<tr>
			<td colspan="4" class="boardTitle">
				
				<h2><spring:message code="bbs.write.title" /></h2>
			</td>
		</tr>
		<tr>
			<td colspan="6">&nbsp;</td>
		</tr>
		<tr>
			<td class="readTh">글쓴이</td>
			<td class="readTd">
				<input type="text" style="border:0px" name="writer" value="${sessionScope.member.id }" readonly size="10" id="writer" maxlength="10"/> 
			</td>
		</tr>		
		<tr>
			<td class="readTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			<td class="readTd" colspan=3>
				<input type="text" name="title" size="90" id="title" maxlength="50"/>
			</td>
		</tr>			
		<tr>
			<td class="readTh">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			<td class="readTd" colspan="3">
				<textarea name="content" id="content" rows="20" cols="92"></textarea>
			</td>
		</tr>		
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" class="tdSpan"><input type="reset" value="다시쓰기"/>
				&nbsp;&nbsp;<input type="submit" value="등록하기" />
				&nbsp;&nbsp;<input type="button" value="목록보기" 
					onclick="javascript:window.location.href='board/boardList'"/></td>
		</tr>
	</table>
</form>
</article>