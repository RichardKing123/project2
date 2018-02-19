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
			$(".food").show();
			return false;
		});
		$("#service").on("click",function(){
			$("#workTable table:visible").hide();
			$(".service").show();
			return false;
		});
		$("#doso").on("click",function(){
			$("#workTable table:visible").hide();
			$(".doso").show();
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
		$("#search").on("click",function(){
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
						+"<td colspan='3'><h3>검색결과</h3></td>"
						+"</tr>";
					$("#resultTable").append(header);
					$.each(data, function(index, value){
						var result=
							"<tr>"
							+"<td>"
							+"<div>"
							+"<span>"+value.bd_code_name+"</span>"
							+"</div>"
							+"</td>"
							+"<td>"
							+"<div>"
							+"<span>"+value.business_type+"</span>"
							+"</div>"
							+"</td>"
							+"<td>"
							+"<div>"
							+'<span><a href="#" onClick="javascript:openDetail();" id="detailGo">'+value.overcrowding_index_level+"</a></span>"
							+"</div>"
							+"</td>"
							+"</tr>";
						$("#resultTable").append(result);
					});
					
				}
			});
			
		});
		
		
		

	});

function openDetail(){
	var gu = $("#detailGo").text();
	var gu1 = encodeURI(gu);
	url="searchDetail?gu="+gu1;
	window.open(url,"searchDetail","toolbar=no,location=no,status=no,width="+screen.availWidth+",height="+screen.availHeight);
}