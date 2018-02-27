<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<article>
	<table class="table table-striped">
		<tr>
			<td class="boardTitle" colspan="5">
			
				<h2>
					<spring:message code="bbs.list.title" />
				</h2>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<form name="searchForm" id="searchForm" action="#">
					<select name="type">
						<option value="title">제목</option>
						<option value="writer">아이디</option>
						<option value="content">내용</option>
					</select> <input type="text" name="keyword" /> <input type="submit" class="btn btn-default"
						value="검색" />
				</form>
			</td>
		</tr>
		<c:if test="${  searchOption  }">
			<tr>
				<td colspan="5" id="searchComment">"${  word   }" 검색 결과</td>
			</tr>
			<tr>
				<%-- 검색 요청일 경우 일반 게시 글 리스트로 이동할 수 있도록 링크를 설정했다.  --%>
				<td colspan="2" class="boardListLink"><a href="boardList">리스트</a></td>
				<td colspan="3" class="listWrite"><a href="writeForm">글쓰기</a></td>
			</tr>
		</c:if>
		<c:if test="${  not  searchOption  }">
			<tr>
			<c:if test="${ not sessionScope.isLogin }" >	
				</c:if>
				<c:if test="${ sessionScope.isLogin }" >
							<td colspan="5" class="listWrite"><a href="writeForm">글쓰기</a></td>
				</c:if>

			</tr>
		</c:if>
		<tr>
			<th class="listThNo">NO</th>
			<th class="listThTitle">제목</th>
			<th class="listThWriter">작성자</th>
			<th class="listThRegDate">작성일</th>
			<th class="listThReadCount">조회수</th>
		</tr>
		<c:if test="${searchOption  and not empty boardList }">
			<c:forEach var="b" items="${ boardList }" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo" >${ b.board_no  }</td>
					<td class="listTdTitle"><a
						href="boardDetail?board_no=${  b.board_no  }&pageNum=${  currentPage  }
					&type=${  type  }&keyword=${  keyword  }">${  b.title  }</a>
					</td>
					<td class="listTdWriter" >${  b.writer  }</td>
					<td class="listTdRegDate"><fmt:formatDate
							value="${  b.regDate  }" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
					<td class="listTdReadCount">${  b.readCount  }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" class="listPage"><c:if
						test="${ startPage > pageGroup }">
						<a
							href="boardList?pageNum=${ startPage - pageGroup }&
						type=${type}&keyword=${keyword}">
							[이전]</a>
					</c:if> <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ i == currentPage }">
					[ ${ i } ]
				</c:if>
						<c:if test="${ i != currentPage }">
							<a
								href="boardList?pageNum=${  i  }&type=${  type  }
							&keyword=${  keyword  }">[
								${  i  } ]</a>
						</c:if>
					</c:forEach> <c:if test="${ endPage < pageCount }">
						<a
							href="boardList?pageNum=${ startPage + pageGroup }
						&type=${  type  }&keyword=${  keyword  }">
							[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
		<c:if test="${  not  searchOption  and  not  empty  boardList  }">
			<c:forEach var="b" items="${  boardList  }" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo">${  b.board_no   }</td>
					<td class="listTdTitle"><a
						href="boardDetail?board_no=
${  b.board_no  }&pageNum=${  currentPage  }">${  b.title  }</a>
					</td>
					<td class="listTdWriter">${  b.writer  }</td>
					<td class="listTdRegDate"><fmt:formatDate
							value="${  b.regDate  }" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
					<td class="listTdReadCount">${  b.readCount  }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" class="listPage"><c:if
						test="${  startPage  >  pageGroup  }">
						<a href="boardList?pageNum=${  startPage  -  pageGroup  }">
							[이전]</a>
					</c:if> <c:forEach var="i" begin="${  startPage  }" end="${  endPage  }">
						<c:if test="${  i  ==  currentPage  }">
[  ${  i  }  ]
</c:if>
						<c:if test="${  i  !=  currentPage  }">
							<a href="boardList?pageNum=${  i  }">[ ${  i  } ]</a>
						</c:if>
					</c:forEach> <c:if test="${  endPage  <  pageCount  }">
						<a href="boardList?pageNum=${  startPage  +  pageGroup  }">
							[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
		<%-- 검색 요청이면서 검색된 리스트가 존재하지 않을 경우  --%>
		<c:if test="${  searchOption  and  empty  boardList  }">
			<tr>
				<td colspan="5" class="listTdSpan">"${  keyword  }"가 포함된 게시 글이
					존재하지 않습니다.</td>
			</tr>
		</c:if>
		<%-- 일반 게시 글 리스트 요청이면서 게시 글 리스트가 존재하지 않을 경우  --%>
		<c:if test="${  not  searchOption  and  empty  boardList  }">
			<tr>
				<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</article>

