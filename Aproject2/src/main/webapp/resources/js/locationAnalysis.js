$(function() {
	$(".gangnam").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".gangdong").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".gangbook").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".gangseo").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".gwanak").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".gwanjin").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".guro").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".geumchun").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".nowon").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".dobong").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".dongdaemun").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".dongjak").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".mapo").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".seodaemun").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".seocho").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".sungdong").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".sungbuk").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".songpa").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".yangchun").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".youngdeungpo").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".yongsan").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".eunpyeong").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".jongro").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".junggu").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});
	$(".jungranggu").on("click", function() {
		var work = $(this).text();
		$("#selectGu").text(work);
		$("#gu").val(work);
		return false;
	});

	$("#locationSearch").on("click", function() {
		var selectGu = $("#gu").val();
		if(selectGu.length <= 0) {
			alert("지역을 선택해주세요");
			return false;
		}
		
		$.ajax({
			url:"location.ajax",
			type:"post",
			data:{"district":selectGu},
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
					
						+'<a href="locationAnalysisDetail?bdCodeName='+encodeURI(value.bd_code_name)+'&businessType='+encodeURI(value.business_type)+'&district='+encodeURI(value.district)+'" class="btn btn-primary btn-xs" role="button">상세보기</a>'
						
						+"</td>"
						+"</tr>";
					$("#resultTable").append(result);
				});
				
			}
		});
	});

	
	
	//서울 상권 안정도 차트
	var stabilityChart = {
		"graphset" : [ {
			"type" : "gauge",
			"background-color" : "white",
			"plot" : {
				"background-color" : "#666"
			},
			// 차트의 title 정보
			"title" : {
				"fontColor" : "black",
				"text" :'상권 안정도 지수',
				"align" : "left",
				"offsetX" : 10,
				"fontFamily" : "Open Sans",
				"fontSize" : 20,
				"background-color" :"white"
			},
			"plotarea" : {
				"margin" : "0 0 0 0",
				"y": -100
			},
			"scale" : {
				"size-factor" : 0.8,
				"offset-y" : 120
			},
			"tooltip" : {
				"background-color" : "black"
			},
			"scale-r" : {
				"values" : "0.5:4.5:1",
				"border-color" : "#b3b3b3",
				"border-width" : "2",
				"background-color" : "#eeeeee,#b3b3b3",
				"ring" : {
					"size" : 20,
					"offset-r" : "130px",
					"rules" : [ {
						"rule" : "%v >= 0.5 && %v < 1.5",
						"background-color" : "#348D00"
					}, {
						"rule" : "%v >= 1.5 && %v < 2.5",
						"background-color" : "#B1AD00"
					}, {
						"rule" : "%v >= 2.5 && %v < 3.5",
						"background-color" : "#EC7928"
					}, {
						"rule" : "%v >= 3.5",
						"background-color" : "#FB0A02"
					} ]
				}
			},
			"images" : [
			// {
			// "src":"gaugle_scale_mini.png",
			// "position":"50% 80%"
			// }
			],
			"labels" : [ {
				"id" : "lbl1",
				"x" : "50%",
				"y" : "90%",
				"width" : 80,
				"offsetX" : 120,
				"textAlign" : "center",
				"padding" : 10,
				"anchor" : "c",
				"text" : "낮음",
				"backgroundColor" : "#FB0A02",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#ea0901",
					"text" : "안정성 지수 4",
					"shadow" : 0
				}
			}, {
				"id" : "lbl2",
				"x" : "50%",
				"y" : "90%",
				"width" : 80,
				"offsetX" : 40,
				"textAlign" : "center",
				"padding" : 10,
				"anchor" : "c",
				"text" : "보통",
				"backgroundColor" : "#EC7928",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#da6817",
					"text" : "안정성 지수 3",
					"shadow" : 0
				}
			}, {
				"id" : "lbl3",
				"x" : "50%",
				"y" : "90%",
				"width" : 80,
				"offsetX" : -40,
				"textAlign" : "center",
				"padding" : 10,
				"anchor" : "c",
				"text" : "약간높음",
				"backgroundColor" : "#B1AD00",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#e9b000",
					"text" : "안정성 지수 2",
					"shadow" : 0
				}
			}, {
				"id" : "lbl4",
				"x" : "50%",
				"y" : "90%",
				"width" : 80,
				"offsetX" : -120,
				"textAlign" : "center",
				"padding" : 10,
				"anchor" : "c",
				"text" : "높음",
				"backgroundColor" : "#348D00",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#237b00",
					"text" : "안정성 지수 1",
					"shadow" : 0
				}
			} ],
			"series" : [ {
				"values" : [ stability ],
				"animation" : {
					"method" : 5,
					"effect" : 2,
					"speed" : 2500
				}
			} ],
			"alpha" : 1
		} ] 
	};

	zingchart.render({
		id : 'stability',
		data : stabilityChart,
		height : 400,
		width : 420
	});
	
	//상권 점포수
	var shopCount = shopNo[0].no_of_shop;
	var close = shopNo[0].no_of_close;
	var similar = shopNo[0].similar_shop;
	var open = shopNo[0].no_of_open;
	var businessType = shopNo[0].business_type;
	var shop = 
	        {
	            "type": "radar",
	            "background-color": "white",
	            "title": {
	                "text": "상권 점포 정보",
	                "background-color": "none",
	                "font-color": "000",
	                "font-size": "22px"
	            },
	            "tooltip": {
	                "text": "%t<br>%k Is %v",
	                "shadow": 0,
	                "border-radius": 3
	            },
	            "scale-k": {
	                "background-color": "none",
	                "values": [
	                    "폐업 점포 수",
	                    "유사 업종 점포 수",
	                    "해당 업종 점포 수",
	                    "창업 점포 수"
	                ],
	                "item": {
	                    "font-size": "14px",
	                    "padding-left": "30px",
	                    "padding-bottom": "15px"
	                },
	                "guide": {
	                    "line-color": "#818181",
	                    "line-style": "solid",
	                    "line-width": "2px",
	                    "items": [
	                        {
	                            "background-color": "#fff"
	                        }
	                    ]
	                },
	                "tick": {
	                    "visible": false
	                }
	            },
	            "scale-v": {
	                "values": [close, open, similar, shopCount],
	                "ref-line": {
	                    "line-width": "1px",
	                    "line-color": "#818181"
	                },
	                "guide": {
	                    "line-width": ".5px",
	                    "line-style": "dashed"
	                },
	                "tick": {
	                    "size": 10,
	                    "line-width": ".5px",
	                    "line-length": 0.55,
	                    "line-color": "#818181"
	                },
	                "item": {
	                    "padding-left": "9.5px",
	                    "font-size": "8px"
	                }
	            },
	            "series": [
	                {
	                    "values": [
	                        close,
	                        similar,
	                        shopCount,
	                        open
	                    ],
	                    "aspect": "line",
	                    "text": businessType,
	                    "line-color": "red",
	                    "background-color": "none",
	                    "line-width": "4px",
	                    "alpha": "0.35",
	                    "marker": {
	                        "background-color": "#999999",
	                        "size": "4",
	                        "border-color": "#999999",
	                        "alpha": "0.55"
	                    }
	                }
	            ]
	        };

	zingchart.render({ 
		id : 'noOfShop', 
		data : shop, 
		height: 500, 
		width: 725 
	});
	
	//해당 지역구의 비지니스 타입에 따른 점포 수
	var noOfShop = [];
	var business = [];
	$(shopRadar).each(function(index, value) {
		noOfShop.push(value.noOfShop);
		business.push(value.business_type);
	});
	var shopCircle = {
		    "backgroundColor":'white',
		    "type": "radar",
		    "plot": {
		      "aspect": "area",
		       "background-color":'#FBFCFE',
		       "active-area":true
		    },
		    "plotarea":{
		      "margin":'dynamic'
		    },
		    "scale-v": {
		        "values": "0:25:5",
		        "labels": ["", "", "", "", ""],
		        "ref-line": {
		            "line-color": "none"
		        },
		        "guide": {
		            "line-style": "solid",
		            "line-color":'#D7D8D9'
		        }
		    },
		    "scale-k": {
		        "values": business,
		        "format": "%v",
		        "aspect": "circle", //To set the chart shape to circular.
		        "guide": {
		            "line-style": "solid",
		            "line-color" : "#1E5D9E",
		        },
		     	  "item": {
		     	    "padding": 5,
		     	    "font-color" : "#1E5D9E",
		     	    "font-family": 'Montserrat'
		     	  },
		    },
		    "series": [		  
		      {
		          "values": noOfShop,
		          "backgroundColor": "#00BAF2",
		          "lineColor": "#00BAF2"
		      }
		    ]
		};

		zingchart.render({ 
			id : 'shopRadar', 
			data : shopCircle, 
			height: 700, 
			width: 540
		});
		
		//지도 출력하는 코드문
		var mapContainer = document.getElementById('map3'), // 지도를 표시할 div  
		mapOption = { 
	        center: new daum.maps.LatLng(37.509525,126.981482), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };	
		
		var areas = []
		$.each(datas, function(index, values) {
			var guPoly = {}
			guPoly.name = values.name;
			guPoly.path = []
			
			$.each(values.pointList, function(i, v) {
				guPoly.path.push(new daum.maps.LatLng(v.lat, v.lng));
			});
			areas.push(guPoly);	
		}) ;

		
		
		
		var map = new daum.maps.Map(mapContainer, mapOption),
			customOverlay = new daum.maps.CustomOverlay({}),
			infowindow = new daum.maps.InfoWindow({removable: true});
		

		
		//다각형을 생상하고 이벤트를 등록하는 함수입니다
		function displayArea(area) {
		
		    // 다각형을 생성합니다 
		    var polygon = new daum.maps.Polygon({
		        map: map, // 다각형을 표시할 지도 객체
		        path: area.path,
		        strokeWeight: 2,
		        strokeColor: 'black',
		        strokeOpacity: 0.8,
		        fillColor: 'pink',
		        fillOpacity: 0.7 
		    });
		
		    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		    daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
		        polygon.setOptions({fillColor: 'pink',fillOpacity:0.8});
		
		        customOverlay.setContent('<div class="area">' + area.name + '</div>');
		        
		        customOverlay.setPosition(mouseEvent.latLng); 
		        customOverlay.setMap(map);
		    });
		
		    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		    daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		        
		        customOverlay.setPosition(mouseEvent.latLng); 
		    });
		
		    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		    // 커스텀 오버레이를 지도에서 제거합니다 
		    daum.maps.event.addListener(polygon, 'mouseout', function() {
		        polygon.setOptions({fillColor:'pink',fillOpacity:0.7});
		        customOverlay.setMap(null);
		    }); 
		
		    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 페이지로 이동. 
		    daum.maps.event.addListener(polygon, 'click', function(mouseEvent) {
		    	
		    	var latlng = mouseEvent.latLng;
		  
		    	var lats = [];
		    	var lngs = [];
		    	
		    	$.each(polygon.Bg, function(i, v) {
		    		lngs.push(v.ib);
		    		lats.push(v.jb);
		    	});
		   
		    	var xline = (Math.max.apply(null, lats)+Math.min.apply(null, lats))/2;
		    	var yline = (Math.max.apply(null, lngs)+Math.min.apply(null, lngs))/2;
		    
		    	location.href = "sh?lat=" + xline + "&lng=" + yline;
		    });
		}
		
		
		for (var i = 0, len = areas.length; i < len; i++) {
		    displayArea(areas[i]);
		}
	
});