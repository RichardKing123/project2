<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="resources/js/reply.js"></script>
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
			<td colspan="6" class="tdSpan"><c:if
					test="${sessionScope.member.id == board.writer}">
					<input type="button" id="detailUpdate" value="수정하기" />
				&nbsp;&nbsp;<input type="button" id="detailDelete" value="삭제하기" />
						&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='boardList?pageNum=${pageNum}'" />
				</c:if> <c:if test="${ sessionScope.member.id ne board.writer }">			
			&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='boardList?pageNum=${pageNum}'" />
				</c:if></td>
		</tr>
		
		
		<tr>
			<td colspan="6" class="replyHeader">
				<div id="recommend">
					<span id="commend"> <img
						src="resources/images/recommend.png" alt="추천하기" />&nbsp;추천 <span
						class="recommend">(${board.recommend })</span>
					</span> | <span id="thank"> <img src="resources/images/smile.png"
						alt="땡큐" />&nbsp;땡큐 <span class="recommend">(${  board.thank  })</span>
					</span> | <span id="replyWrite"> &nbsp;댓글쓰기 </span>
				</div>
				<div id="replyTitle">
					<h3>이 글에 대한 댓글 리스트</h3>
				</div>
			</td>
		</tr>
		<c:if test="${  empty  replyList  }">
			<tr id="replyList">
				<td colspan="6">
					<div id="notReply">이 게시 글에 대한 댓글이 존재하지 않습니다.</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${  not  empty  replyList  }">
			<tr id="replyList">
				<td colspan="6">
					<table id="replyTable">
						<c:forEach var="reply" items="${  replyList  }">
							<tr id="reply_${  reply.reply_no  }">
								<td>
									<div class="replyUser">
										<span class="member">${reply.writer}</span>
									</div>
									<div class="replyModify">
										<span class="reply_date"> 
										<fmt:formatDate
												value="${  reply.reg_date}" pattern="yyyy-MM-dd  HH:mm:ss" /></span>
										<a href="#" class="modifyReply" data-no="${  reply.reply_no  }">
											<img src="resources/images/reply_btn_modify.gif"
											alt="댓글  수정하기" />
										</a> <a href="#" class=deleteReply data-no="${  reply.reply_no  }">
											<img src="resources/images/reply_btn_delete.gif"
											alt="댓글  삭제하기" />
										</a> <a href="javascript:reportReply('${  reply.reply_no  }')"> <img
											src="resources/images/reply_btn_notify.gif" alt="신고하기" /></a>
									</div>
									<div class="replyContent" id="div_${  reply.reply_no  }">
										<pre>
											<span>${reply.reply}</span>
										</pre>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</c:if>
	</table>	
	<div id="replyForm">
		<form name="replyWriteForm" id="replyWriteForm">
			<input type="hidden" name="bbs_no" value="${  board.board_no  }" />
			 <input
				type="hidden" name="writer"
				value="${ sessionScope.member.id }" />
			<table id="replyWriteTable">
				<tr>
					<td id="replyWriteTitle" colspan="2"><span>악의적인 댓글은 예고
							없이 삭제될 수 있으며 글쓰기 제한과 아이 디 삭제 처리됩니다.</span></td>
				</tr>
				<tr>
					<td id="replyWriteContent"><textarea name="reply"
							id="replyContent" rows="4"></textarea></td>
					<td id="replyWriteImage"><input type="image"
						src="resources/images/reply_btn_write.gif" id="replyWriteButton"
						alt="댓글 입력" /></td>
				</tr>
			</table>
		</form>
	</div>
</article>