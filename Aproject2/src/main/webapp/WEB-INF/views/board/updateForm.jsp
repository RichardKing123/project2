<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
<form name="updateForm" id="updateForm" action="update"
	method="post">
	<input type="hidden" name="board_no" value="${ board.board_no }" />
	<input type="hidden" name="pageNum" value="${ pageNum }" />
<table class="readTable">
	<tr>
		<td colspan="4" class="boardTitle">
			
			<h2><spring:message code="bbs.update.title" /></h2>
		</td>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
		<th class="readTh">글쓴이</th>
		<td class="readTd">
			<input type="text" name="writer" id="writer" size="30" 
				maxlength="10" value="${ board.writer }" readonly/>
		</td>
	</tr>
	<tr>
		<th class="readTh">제&nbsp;&nbsp;목</th>
		<td class="readTd" colspan="3">
			<input type="text" name="title" id="title" size="50" 
				maxlength="50" value="${ board.title }"/>
		</td>				
	</tr>
	<tr>
		<th class="readTh">내&nbsp;&nbsp;용</th>
		<td class="readTd" colspan="3">
			<textarea name="content" id="content" rows="20" 
				cols="72">${ board.content } </textarea>
		</td>				
	</tr>
	<tr>
			<td colspan="4">&nbsp;</td></tr>
	<tr>
	<tr>		
		<td class="tdSpan" colspan="4">
			<input type="reset" class="btn btn-default" value="다시쓰기" />
			
			&nbsp;&nbsp;<input type="submit" class="btn btn-default" value="수정하기" />
			&nbsp;&nbsp;<input type="button" class="btn btn-default" value="목록보기" onclick=
				"javascript:window.location.href='boardList?pageNum=${pageNum}'"/>			
		</td>
	</tr>
</table>
</form>			
</article>