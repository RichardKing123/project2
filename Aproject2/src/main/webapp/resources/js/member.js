$(document).ready(function() {
	
//	$("#bd_analyse").on("click", loginPls);
//	$("#location_analyse").on("click", loginPls);
//	$("#trend_index").on("click", loginPls);


		
	/* 회원 가입 폼, 회원정보 수정 폼에서 폼 컨트롤에서 키보드 입력을 체크해
	 * 유효한 값을 입력 받을 수 있도록 keypress와 keyup 이벤트 처리를 했다. 
	 **/
	$("#userId").on("keypress", inputCheck);
	$("#userId").on("keyup", inputCharReplace);
	$("#password1").on("keypress", inputCheck);
	$("#password1").on("keyup", inputCharReplace);
	$("#password2").on("keypress", inputCheck);
	$("#password2").on("keyup", inputCharReplace);
	$("#emailId").on("keypress", inputCheck);
	$("#emailId").on("keyup", inputCharReplace);
	$("#emailDomain").on("keypress", inputEmailDomainCheck);
	$("#emailDomain").on("keyup", inputEmailDomainReplace);
	
	//아이디 중복확인 클릭 시 새 창 띄워서 중복 확인하는 메소드
	$("#overlapIdCheck").on("click", function() {
		var id = $("#userId").val();
		url="overlapIdCheck?id=" + id;
		
		if(id.length == 0) {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, location=no, " 
				+  "status=no, memubar=no, width=400, height=200");
	});
	//중복확인 새 창에서 중복확인 버튼 클릭시 유효성 검사
	$("#idCheckForm").on("submit", function() {
		var id = $("#checkId").val();	
		
		if(id.length == 0)  {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
	});
	//중복확인 창에서 아이디 사용버튼 클릭 시 입력된 아이디를 회원가입폼에 전송하는 메소드 
	$("#btnIdCheckClose").on("click", function() {
		var id = $(this).attr("data-id-value");
		opener.document.joinForm.id.value = id;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	});
	
	// 회원 가입 폼이 서브밋 될 때 이벤트 처리 - 폼 유효성 검사
	$("#joinForm").on("submit", function() {
		
		/* joinFormChcek() 함수에서 폼 유효성 검사를 통과하지 못하면
		 * false가 반환되기 때문에 그대로 반환하면 폼이 서브밋 되지 않는다.
		 **/ 
		return joinFormCheck();
	});
	
	//회원가입 시 이메일 셀렉트 창 구현 쿼리
	$("#selectDomain").on("change", function() {
		var str = $(this).val();
		
		if(str == "직접입력") {	
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);
		} else if(str == "네이버"){	
			$("#emailDomain").val("naver.com");			
			$("#emailDomain").prop("readonly", true);
			
		} else if(str == "다음") {		
			$("#emailDomain").val("daum.net");
			$("#emailDomain").prop("readonly", true);
			
		} else if(str == "한메일"){	
			$("#emailDomain").val("hanmail.net");
			$("#emailDomain").prop("readonly", true);
			
		} else if(str == "구글") {		
			$("#emailDomain").val("gmail.com");
			$("#emailDomain").prop("readonly", true);
		}
	});
	
	//회원정보 변경 시 비밀번호 체크
	$("#btnPassCheck").click(function() {
		var oldId = $("#userId").val();
		var oldPass = $("#oldPass").val();
		if($.trim(oldPass).length == 0) {
			alert("기존 비밀번호가 입력되지 않았습니다. \n기본 비밀번호를 입력해주세요");
			return false;
		}
		var data = "id=" + oldId + "&password=" + oldPass;
		$.post("passCheck.ajax", data, function(resultData, status, xhr) {
			console.log(resultData.result + (Boolean(resultData.result) == true));
			if(resultData.result) {
				alert("비밀번호가 확인되었습니다 \n비밀번호를 수정해주세요");
				$("#btnPassCheck").prop("disabled", true);
				$("#password1").focus();
			} else {
				alert("비밀번호가 일치하지 않습니다");
			}
		});
		
	});
	
	//비밀번호 찾기
	$("#passFindForm").on("submit", passFind);
	
	//비밀번호 출력
	
	
});



function passFind(e) {
	var id = $("#id").val();
	var email = $("#email").val();
	
	e.preventDefault();
	if(id.length == 0) {		
		alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
		return false;
	}		
	if(email.length == 0) {		
		alert("이메일이 입력되지 않았습니다.\n이메일을 입력해주세요");
		return false;
	}
	$.ajax({
		url:"passFind.ajax",
		type:"post",
		data: {"id":id, "email":email},
		dataType: "json",
		success: function(resultData, status, xhr) {
			var passbox =  
				"<div id='passBox' class='form-group'>"
					+"<div class='col-sm-10' style='float: none;'>"
					+"<input type='text' class='form-control' value='" +id + "님의 비밀번호는 [" + resultData.pass + "]입니다' readonly>"
					+"</div>"
				+ "</div>";
			$("#passFindForm").append(passbox);
		},
		error: function(xhr, status, error) {
			alert("error: " + xhr.statusText + ", " + status + ", " + error);
		}
	});
	//return false;
}







function joinFormCheck() {
	var id = $("#userId").val();
	var pass1 = $("#password1").val();
	var pass2 = $("#password2").val();
	var emailId = $("#emailId").val();
	var emailDomain = $("#emailDomain").val();
	var isIdCheck = $("#isIdCheck").val();
	
	if(id.length == 0) {		
		alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
		return false;
	}		
	if(isIdCheck == 'false') {		
		alert("아이디 중복 체크를 하지 않았습니다.\n아이디 중복 체크를 해주세요");
		return false;
	}	
	if(pass1.length == 0) {		
		alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
		return false;
	}
	
	if(pass2.length == 0) {		
		alert("비밀번호 확인이 입력되지 않았습니다.\n비밀번호 확인을 입력해주세요");
		return false;
	}
	if(pass1 != pass2) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return false;
	}	
	if(emailId.length == 0) {		
		alert("이메일 아이디가 입력되지 않았습니다.\n이메일 아이디를 입력해주세요");
		return false;
	}	
	if(emailDomain.length == 0) {		
		alert("이메일 도메인이 입력되지 않았습니다.\n이메일 도메인을 입력해주세요");
		return false;
	}	
}



function inputCheck() {

	if(! (event.keyCode >= 48 && event.keyCode <= 57 ||
			event.keyCode >= 65 && event.keyCode <= 90 ||
			event.keyCode >= 97 && event.keyCode <= 122)) {
		
		alert(this);
		
		alert("아이디는 영문 대소문자와 숫자만 사용할 수 있습니다.");
		
		return false;
	}
}

//아이디, 비밀번호, 비밀번화 확인, 이메일 아이디 폼 컨트롤에 사용자가 입력한 값이 영문 대소문자, 숫자 만 입력되도록 수정하는 함수
function inputCharReplace() {
	var regExp = /[^A-Za-z0-9]/gi;	
	if(regExp.test($(this).val())) {
		alert("영문 대소문자, 숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

//이 메일 도메인 입력 폼 컨트롤에 사용자가 입력한 값이 영문 대소문자, 숫자, 점(.)인지를 체크하는 함수 
function inputEmailDomainCheck() {
	if(! (event.keyCode >= 48 && event.keyCode <= 57 ||			
			event.keyCode >= 97 && event.keyCode <= 122 ||
			event.keyCode == 46)) {
		alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력할 수 있습니다.");
		

		return false;
	}
}

function inputEmailDomainReplace() {
	var regExp = /[^a-z0-9\.]/gi;	
	if(regExp.test($(this).val())) {
		alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

//로그인 안 했을 시 게시판 이용 제한하는 함
function loginPls() {
	var login = $("#login_property").attr("href");
	if(login != "logout") {
		alert("로그인 후 이용하여 주십시오");
		return false;
	}
}


