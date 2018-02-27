// DOM(Document Object Model)이 준비 되었다면
$(document).ready(function() {
	
	
	$("#commend").click(function() {
		$.ajax({			
			url: "recommend.ajax",
			
			type: "post",
			
			data : { recommend: "recommend", board_no : $("#rNo").val()},

			dataType: "json",
			success: function(data) {	
				
				alert("추천하기가 반영 되었습니다.");
				$("#commend > .recommend").text(" (" + data.recommend + ")");
				$("#thank > .recommend").text(" (" + data.thank + ")");				
			},
			error: function(xhr, status, error) {
				alert("에러났다. error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
	}).hover(function() {
		$(this).css({cursor: "pointer"});
	});
	
	$("#thank").click(function() {		
		$.ajax({			
			url: "recommend.ajax",
			
			type: "post",
			
			
			data: { "recommend": "thank", board_no : $("#rNo").val() },
			
			dataType: "json",
			success: function(data, status, xhr) {
				
				alert("땡큐가 반영 되었습니다.");
				$("#commend > .recommend").text(" (" + data.recommend + ")");
				$("#thank > .recommend").text(" (" + data.thank + ")");				
			},			
			error: function(xhr, status, error) {
				alert(xhr.statusText + ", " + status + ", " + error);
			}
		});
	}).hover(function() {
		$(this).css({cursor: "pointer"});
	});
	
	
	
	$("#replyWrite").hover(function() {
		$(this).css("cursor", "pointer");
	});
	
	$(document).on("click", "#replyWrite", function() {
		if($("#replyForm").css("display") == "block") {
			
			var $next = $(this).parent().next();
			if(! $($next).is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function(){
				$("#replyForm").insertBefore("#replyTitle").slideDown(300);
			}, 300);			
		} else {
			$("#replyForm").insertBefore("#replyTitle").slideDown(300);
		}
		
		$("#replyForm").find("form")
			.attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
	});
	
	
	
	$(document).on("submit", "#replyWriteForm", function() {
	
		if($("#replyContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
	
			return false;
		}
		
		var params = $(this).serialize();
		
		$.ajax({
			url: "replyWrite.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {								
		
				$("#replyTable").empty();
				console.log(resultData);
				$.each(resultData, function(index, value) {					

					var date = new Date(value.reg_date);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());				
										
					var result = 
						"<tr class='reply_" + value.reply_no + "'>" 
						+ "<td>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.writer + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.reply_no + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.reply_no + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href='javascript:reportReply('div_" + value.reply_no + "');'>"
						+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.reply_no + "'>"
						+ "		<pre><span>" + value.reply + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					$("#replyTable").append(result);								
				});				
		
				$("#replyForm").slideUp(300).add("#replyContent").val("");
				
				console.log("write : " + $("#replyForm").length);
			},
			error: function(xhr, status, error) {
				alert("ajax 실패eeeeee : " + status + " - " + xhr.status);
			}
		});
		
		return false;
	});
	
	
	$(document).on("click", ".modifyReply", function() {	
		
		var $next = $(this).parent().next();
		
		if($($next.children()[1]).attr("id") == undefined) {
		
			console.log(".modifyReply click : visible - " 
					+ $("#replyForm").is(":visible")
					+ ", hidden - " + $("#replyForm").is(":hidden")
					+ ", length - " + $("#replyForm").length);
			
			
			var reply = $next.first().text();			
			
			if($("#replyForm").css("display") == 'block') {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function() {				
				$("#replyContent").val($.trim(reply));
				$("#replyForm").appendTo($next)
					.slideDown(300);
			}, 300);
			
		
			$("#replyForm").find("form")
				.attr({"id": "replyUpdateForm", "data-no": $(this).attr("data-no") });
		}		
		
		return false;
	});
	
	
	
	$(document).on("submit", "#replyUpdateForm", function() {	
	
		if($("#replyContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
		
			return false;
		}
		
		
		var params = $(this).serialize() + "&no=" + $(this).attr("data-no");
		var updateForm;
		
		$.ajax({
			url: "replyUpdate.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {								
	
						
				$updateForm = $("#replyForm");
				
				console.log("update - before empty() : " + $updateForm.length);
				
				// 기존에 화면에 출력되었던 댓글을 비운다.
				$("#replyTable").empty();
			
				$.each(resultData, function(index, value) {
					// 날짜 데이터를 출력 포맷에 맞게 수정
					var date = new Date(value.regDate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());			
										
					var result = 
						"<tr class='reply_" + value.reply_no + "'>" 
						+ "<td>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.replyWriter + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.reply_nono + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.reply_nono + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href='javascript:reportReply('div_" + value.reply_nono + "');'>"
						+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.reply_nono + "'>"
						+ "		<pre><span>" + value.replyContent + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					
					// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
					$("#replyTable").append(result);					
				});	
				console.log("update after empty() : #replyForm - " 
						+ $("#replyForm").length 
						+ ", $updateFrom : " + $updateForm.length);
				
				
				$updateForm.find("form")
					.attr("id", "replyWriteForm").removeAttr("data-no")
					.end().css("display", "none").appendTo("article")
					.find("#replyContent").val("");
			},
			error: function(xhr, status, error) {
				alert("ajax 업데이트 실패 : " + status + " - " + xhr.status);
			}
		});		
	
		return false;
	});
	
	
	$(document).on("click", ".deleteReply", function() {	
		
		var reply_no = $(this).attr("data-no");
		var writer = $(this).parent().prev().find(".member").text();
		var bbs_No = $("#replyForm input[name=bbsNo]").val();
		var result = confirm(writer + "님이 작성한 " + reply_no +"번 댓글을 삭제하시겠습니까?");
		
		var params = "no=" + reply_no + "&bbsNo=" + bbs_No;	
		if(result) {
			$.ajax({
				url: "replyDelete.ajax",
				type: "post",
				data: params,
				dataType: "json",
				success: function(resultData, status, xhr) {			
					
	
					$("#replyForm").find("form")
						.attr("id", "replyWriteForm").removeAttr("data-no")
						.end().css("display", "none").appendTo("article")
						.find("#replyContent").val("");
					
					// 기존에 화면에 출력되었던 댓글을 비운다.
					$("#replyTable").empty();
					
					/* 아래는 댓글 쓰기와 댓글 수정/삭제가 동일하기 때문에 별도의
					 * 함수로 나누는 것이 중복 코드를 최소화 할 수 있다.
					 **/
					$.each(resultData, function(index, value) {
						// 날짜 데이터를 출력 포맷에 맞게 수정
						var date = new Date(value.reg_Date);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
								+ date.getDate() + "-" + ((date.getHours() < 10) 
								? "0" + date.getHours() : date.getHours()) + ":" 
								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
								: date.getMinutes()) + ":" + (date.getSeconds() < 10 
								? "0" + date.getSeconds() : date.getSeconds());
											
						var result = 
							"<tr class='reply_" + value.reply_no + "'>" 
							+ "<td>"
							+ "	<div class='replyUser'>"
							+ "		<span class='member'>" + value.writer + "</span>"
							+ "	</div>"
							+ "	<div class='replyModify'>"
							+ "		<span class='replyDate'>" + strDate + "</span>"
							+ "		<a href='#' class='modifyReply' data-no='" + value.reply_no + "'>"
							+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
							+ "		</a>"
							+ "		<a href='#' class='deleteReply' data-no='" + value.reply_no + "'>"
							+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
							+ "		</a>"
							+ "		<a href='javascript:reportReply('div_" + value.reply_no + "');'>"
							+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
							+ "		</a>"
							+ "	</div>"
							+ "	<div class='replyContent' id='div_" + value.reply_no + "'>"
							+ "		<pre><span>" + value.reply+ "</span></pre>"
							+ "	</div>"
							+ "</td>"
						+ "</tr>";
						
						$("#replyTable").append(result);					
					});
				},
				error: function(xhr, status, error) {
					alert("ajax 3333 실패 : " + status + " - " + xhr.status);
				}
			});
		}

		return false;
	});	
});


function reportReply(elemId) {
	var result = confirm("이 댓글을 신고하시겠습니까?");
	if(result == true) {
		alert("report - " + result);
	}	
}


$("#replyWrite").hover(function()  {
	$(this).css("cursor",  "pointer");
	});




$(document).on("click",  ".modifyReply",  function()  {
	
	var  $next  =  $(this).parent().next();

	if($($next.children()[1]).attr("id")  ==  undefined)  {
		console.log(".modifyReply  click  :  visible  -  " 
				+  $("#replyForm").is(":visible")
				+  ",  hidden  -  "  +  $("#replyForm").is(":hidden")
				+  ",  length  -  "  +  $("#replyForm").length);
		var  reply  =  $next.first().text();
		if($("#replyForm").css("display")  ==  'block')  {
		$("#replyForm").slideUp(300);
		}
		setTimeout(function()  {
		$("#replyContent").val($.trim(reply));
		$("#replyForm").appendTo($next)
		.slideDown(300);
		},  300);
		$("#replyForm").find("form")
		.attr({"id":  "replyUpdateForm",  "data-no":  $(this).attr("data-no")  });
		}
		return  false;
		});

$(document).on("submit",  "#replyUpdateForm",  function()  {
	if($("#replyContent").val().length  <=  5)  {
		alert("댓글은  5자 이상 입력해야 합니다.");

	return  false;
	}
	var  params  =  $(this).serialize()  +  "&no="  +  $(this).attr("data-no");
	var  updateForm;
	$.ajax({
	url:  "replyUpdate.ajax",
	type:  "post",
	data:  params,
	dataType:  "json",
	success:  function(resultData,  status,  xhr)  {

	$updateForm  =  $("#replyForm");
	
	console.log("update  -  before  empty()  :  "  +  $updateForm.length);
	// 기존에 화면에 출력되었던 댓글을 비운다.
	$("#replyTable").empty();
	/* 아래는 댓글 쓰기와 댓글 수정이 동일하기 때문에 별도의
	  * 함수로 나누는 것이 중복 코드를 최소화 할 수 있다.
	  **/
	$.each(resultData,  function(index,  value)  {
	// 날짜 데이터를 출력 포맷에 맞게 수정
		var  date  =  new  Date(value.regDate);
		var  strDate  =  date.getFullYear()  +  "-"  +  ((date.getMonth()  +  1  <  10) 
		?  "0"  +  (date.getMonth()  +  1)  :  (date.getMonth()  +  1))  +  "-"  
		+  date.getDate()  +  "-"  +  ((date.getHours()  <  10) 
		?  "0"  +  date.getHours()  :  date.getHours())  +  ":" 
		+  (date.getMinutes()  <  10  ?  "0"  +  date.getMinutes() 
		:  date.getMinutes())  +  ":"  +  (date.getSeconds()  <  10 
		?  "0"  +  date.getSeconds()  :  date.getSeconds());
		var  result  = 
		"<tr  class='reply_"  +  value.no  +  "'>" 
		+  "<td>"
		+  " <div  class='replyUser'>"
		+  " <span  class='member'>"  +  value.replyWriter  +  "</span>"
		+  " </div>"
		+  " <div  class='replyModify'>"
		+  " <span  class='replyDate'>"  +  strDate  +  "</span>"
		+  " <a  href='#'  class='modifyReply'  data-no='"  +  value.no  + 
		"'>"
		+  " <img  src='resources/images/reply_btn_modify.gif'  alt='		댓글 수정하기'/>"
		+  " </a>"
		+  " <a  href='#'  class='deleteReply'  data-no='"  +  value.no  +  "'>"
		+  " <img  src='resources/images/reply_btn_delete.gif'  alt='		댓글 삭제하기'/>"
		+  " </a>"
		+  " <a  href='javascript:reportReply('div_"  +  value.no  +  "');'>"
		+  " <img  src='resources/images/reply_btn_notify.gif'  alt='		신고하기'/>"
		+  " </a>"
		+  " </div>"
		+  " <div  class='replyContent'  id='div_"  +  value.no  +  "'>"
		+  " <pre><span>"  +  value.replyContent  +  "</span></pre>"
		+  " </div>"
		+  "</td>"
		+  "</tr>";
		// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
		$("#replyTable").append(result);
		});
	
	console.log("update  after  empty()  :  #replyForm  -  " 
	+  $("#replyForm").length 
	+  ",  $updateFrom  :  "  +  $updateForm.length);
	
	$updateForm.find("form")
	.attr("id",  "replyWriteForm").removeAttr("data-no")
	.end().css("display",  "none").appendTo("article")
	.find("#replyContent").val("");
	},
	error:  function(xhr,  status,  error)  {
	alert("ajax55555555 실패  :  "  +  status  +  "  -  "  +  xhr.status);
	}
	});
	// 폼이  submit 되는 것을 취소한다.
	return  false;
	});

$(document).on("click",  ".deleteReply",  function()  {
	var  no  =  $(this).attr("data-no");
	var  writer  =  $(this).parent().prev().find(".member").text();
	var  bbsNo  =  $("#replyForm  input[name=bbsno]").val();
	var  result  =  confirm(writer  +  "님이 작성한  "  +  reply_no  +"번 댓글을 삭제하시겠습니까?");
	var  params  =  "reply_no="  +  reply_no  +  "&bbs_No="  +  bbs_no;
	if(result)  {
	$.ajax({
	url:  "replyDelete.ajax",
	type:  "post",
	data:  params,
	dataType:  "json",
	success:  function(resultData,  status,  xhr)  {
		$("#replyForm").find("form")
		.attr("id",  "replyWriteForm").removeAttr("data-no")
		.end().css("display",  "none").appendTo("article")
		.find("#replyContent").val("");
		// 기존에 화면에 출력되었던 댓글을 비운다.
		$("#replyTable").empty();
		/* 아래는 댓글 쓰기와 댓글 수정/삭제가 동일하기 때문에 별도의
		  * 함수로 나누는 것이 중복 코드를 최소화 할 수 있다.
		  **/
		$.each(resultData,  function(index,  value)  {
		// 날짜 데이터를 출력 포맷에 맞게 수정
		var  date  =  new  Date(value.regDate);
		var  strDate  =  date.getFullYear()  +  "-"  +  ((date.getMonth()  +  1  <  10) 
		?  "0"  +  (date.getMonth()  +  1)  :  (date.getMonth()  +  1))  +  "-"  
		+  date.getDate()  +  "-"  +  ((date.getHours()  <  10) 
		?  "0"  +  date.getHours()  :  date.getHours())  +  ":" 
		+  (date.getMinutes()  <  10  ?  "0"  +  date.getMinutes() 
		:  date.getMinutes())  +  ":"  +  (date.getSeconds()  <  10 
		?  "0"  +  date.getSeconds()  :  date.getSeconds());
		var  result  = 
		"<tr  class='reply_"  +  value.no  +  "'>" 
		+  "<td>"
		+  " <div  class='replyUser'>"
		+  " <span  class='member'>"  +  value.replyWriter  + 
		"</span>"
		+  " </div>"
		+  " <div  class='replyModify'>"
		+  " <span  class='replyDate'>"  +  strDate  +  "</span>"
		+  " <a  href='#'  class='modifyReply'  data-no='"  +  value.no 
		+  "'>"
		+  " <img  src='resources/images/reply_btn_modify.gif'alt='댓글 수정하기'/>"
		+  " </a>"
		+  " <a  href='#'  class='deleteReply'  data-no='"  +  value.no  + 
		"'>"
		+  " <img  src='resources/images/reply_btn_delete.gif' " +
				"alt='댓글 삭제하기'/>"
+  " </a>"
+  " <a  href='javascript:reportReply('div_"  +  value.no  + 
"');'>"
+  " <img  src='resources/images/reply_btn_notify.gif'alt='신고하기'/>"
+  " </a>"
+  " </div>"
+  " <div  class='replyContent'  id='div_"  +  value.no  +  "'>"
+  " <pre><span>"  +  value.replyContent  +  "</span></pre>"
+  " </div>"
+  "</td>"
+  "</tr>";
// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
$("#replyTable").append(result);
});
},
error:  function(xhr,  status,  error)  {
alert("ajax 실패  :  "  +  status  +  "  -  "  +  xhr.status);
}
});
}
// 앵커 태그에 의해 페이지가 이동되는 것을 취소한다.
return  false;
});
/* 아래는 신고하기 버튼을 임시로 연결한 함수  */
function  reportReply(elemId)  {
var  result  =  confirm("이 댓글을 신고하시겠습니까?");
if(result  ==  true)  {
alert("report  -  "  +  result);
}
}
	