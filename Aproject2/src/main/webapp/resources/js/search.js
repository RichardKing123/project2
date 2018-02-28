//상권 검색 페이지
$(document).ready(function(){
	
		//토글버튼
		//$("#choiceWork1").on("mouseover",function(){
			//$("#choiceWork1").css("cursor","pointer");
		//});
		$("#choiceWork1").on("click",function(){
			
			$("#workTable").toggle();
			return false;
		});
		$("#choiceRegion1").on("click",function(){
			
			$("#regionTable").toggle();
			return false;
		});
		//업종선택시 글자뜨고 데이터보내기
		//외식업
		$(".korea").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		
		$(".japan").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		
		$(".bunsik").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		
		$(".chik").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".hof").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".chinese").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".westFood").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".fastFood").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".bread").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".coffe").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		//서비스
		$(".singing").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".cutter").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".study").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".oriental").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".pcRoom").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".skinCare").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".YBM").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".silverCare").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".billard").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".nail").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".artPhysical").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".carRepair").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".golf").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".health").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".childCare").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".carBeauty").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".motel").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".interior").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".hospital").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".clean").on("click",function(){
			var work = $(this).text();
			
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".daBang").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".dentist").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		//도소매
		$(".super").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".cu").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".repair_com").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".iphone").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".butcher").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".fruit").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".cloth").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".fashion").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".pharmacy").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".stationary").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});
		$(".cosmetic").on("click",function(){
			var work = $(this).text();
			$("#selectWork").text(work);
			$("#selWork").val(work);
			return false;
		});

		
		
		//메뉴마다 누를때 다른 테이블 불러오기
		$("#food").on("click",function(){
			$("#workTable table:visible").hide();
			$("#resFood").show();
			return false;
		});
		$("#service").on("click",function(){
			$("#workTable table:visible").hide();
			$("#resService").show();
			return false;
		});
		$("#doso").on("click",function(){
			$("#workTable table:visible").hide();
			$("#resDoso").show();
			return false;
		});
		$("#allWork").on("click",function(){
			$("#workTable table:visible").hide();
			$("#workTable table").show();
			return false;
		});

//지역선택
	$(".gangnam").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
	$(".gangdong").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".gangbook").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".gangseo").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".gwanak").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".gwanjin").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".guro").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".geumchun").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".nowon").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".dobong").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".dongdaemun").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".dongjak").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".mapo").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".seodaemun").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".seocho").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".sungdong").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".sungbuk").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".songpa").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".yangchun").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".youngdeungpo").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".yongsan").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".eunpyeong").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".jongro").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".junggu").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		$(".jungranggu").on("click",function(){
			var work = $(this).text();
			$("#selectGu").text(work);
			$("#gu").val(work);
			return false;
		});
		
		//검색시
		$('#myButton').on('click',function(){
			var $btn = $(this).button('loading')
			
			var selectWork = $("#selWork").val();
			var selectGu = $("#gu").val();
			if(selectWork.length <= 0){
				alert("업종을 선택해주세요");
				return false;
			}
			if(selectGu.length <= 0){
				alert("지역구를 선택해주세요");
				return false;
			}
			$.ajax({
				url:"search.ajax",
				type:"post",
				data:{"business_type":selectWork, "district":selectGu},
				dataType:"json",
				success:function(data){
					$("#resultTable").empty();
					var header = "<tr>"
						+"<td colspan='4'><h3>검색결과</h3></td>"
						+"</tr>"
						+"<tr>"
						+"<th>길이름</th>"
						+"<th>업종</th>"
						+"<th>점포수</th>"
						+"<th></th>"
						+"</tr>";
					$("#resultTable").append(header);
					$.each(data, function(index, value){
						
						var result=
							"<tr>"
							+"<td>"
							
							+value.bd_code_name
							
							+"</td>"
							+"<td>"
							
							+value.business_type
							
							+"</td>"
							+"<td>"
							
							+value.no_of_shop
							
							+"</td>"
							+"<td>"
						
							+'<a href="searchDetail?bd_code_name='+encodeURI(value.bd_code_name)+'&business_type='+encodeURI(value.business_type)+'&district='+encodeURI(value.district)+'" target="_blank" class="btn btn-primary btn-xs" role="button">상세보기</a>'
							
							+"</td>"
							+"</tr>";
						$("#resultTable").append(result);
					});
					
				}
			});
			$btn.button('reset')
		});
		
		
		
		
		

	});




