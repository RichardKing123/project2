<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
<table class="listTable">
	<tr>
		<td class="boardTitle" colspan="5">
			<%-- 
			 스프링 태그 라이브러리를 이용해 root-context.xml에서 설정한
			 titleMessages.properties 메시지 자원에 접근해 code 속성 지정한
			 키에 해당하는 메시지를 출력한다.
			--%>
			<h2><spring:message code="bbs.list.title" /></h2>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<form name="searchForm" id="searchForm" action="#">
				<select name="type">
					<option value="titlle">제목</option>
					<option value="writer">아이디</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="keyword" />
				<input type="submit" value="검색" />
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="5" class="listWrite"><a href="writeForm">글쓰기</a></td>
	</tr>
	<tr>
		<th class="listThNo">NO</th>
		<th class="listThTitle">제목</th>
		<th class="listThWriter">작성자</th>
		<th class="listThRegDate">작성일</th>
		<th class="listThReadCount">조회수</th>
	</tr>	
<c:if test="${ not empty boardList }">
<c:forEach var="b" items="${ boardList }" varStatus="status">		
	<tr class="listTr">
		<td class="listTdNo">${ b.board_no  }</td>
		<td class="listTdTitle">
			<a href="boardDetail?board_no=${ b.board_no }&pageNum=${currentPage}" >
				${ b.title }</a></td>
		<td class="listTdWriter">${ b.writer }</td>
		<td class="listTdRegDate"><fmt:formatDate value="${ b.regDate }" 
			pattern="yyyy-MM-dd HH:mm:ss" /></td>
		<td class="listTdReadCount">${ b.readCount }</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="5" class="listPage">
			
		 	<c:if test="${ startPage > pageGroup }"> 
				<a href="boardList?pageNum=${ startPage - pageGroup }">
					[이전]</a>
			</c:if>	
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					[ ${ i } ]
				</c:if>			
				<c:if test="${ i != currentPage }">
					<a href="boardList?pageNum=${ i }">[ ${ i } ]</a>
				</c:if>			
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<a href="boardList?pageNum=${ startPage + pageGroup }">
					[다음]</a>
			</c:if>		
		</td>
	</tr>
</c:if>
<c:if test="${ empty boardList }">
	<tr>
		<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
	</tr>
</c:if>
</table>
</article>



