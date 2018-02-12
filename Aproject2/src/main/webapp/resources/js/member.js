$(document).ready(function() {
	//아이디 중복확인 클릭 시 새 창 띄워서 중복 확인하는 메소
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
});