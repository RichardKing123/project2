<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<article>
	<form name="checkForm" id="checkForm">
		<input type="hidden" name="board_no" id="rNo"
			value="${ board.board_no }" /> <input type="hidden" name="pageNum"
			value="${ pageNum }" />
	</form>
	<table class="contentTable">
		<tr>
			<td colspan="4" class="boardTitle">

				<h2>
					<spring:message code="bbs.detail.title" />
				</h2>
			</td>
		</tr>
		<tr>
			<td colspan="6">&nbsp;</td>
		</tr>
		<tr>
			<td class="contentTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			<td class="contentTd" colspan="5">${ board.title }</td>
		</tr>
		<tr>
			<td class="contentTh">글쓴이</td>
			<td class="contentTd">${ board.writer }</td>
			<td class="contentTh">작성일</td>
			<td class="contentTd"><fmt:formatDate value="${ board.regDate }"
					pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td class="contentTh">조회수</td>
			<td class="contentTd">${ board.readCount }</td>
		</tr>

		<tr>
			<td class="readContent" colspan="6"><pre>${ board.content }</pre>
			</td>
		</tr>
		<tr>
			<td colspan="6">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="6" class="tdSpan">
			<c:if	test="${sessionScope.member.id == board.writer}">
					<input type="button" id="detailUpdate" value="수정하기" />
			&nbsp;&nbsp;<input type="button" id="detailDelete" value="삭제하기" />
						&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='boardList?pageNum=${pageNum}'" />
				</c:if> <c:if test="${ sessionScope.member.id ne board.writer }">			
			&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='boardList?pageNum=${pageNum}'" />
				</c:if></td>
		</tr>
	</table>
</article>