<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/search.css">


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1be91db11f8253de94c8895a7e92d8d"></script>
<!-- <script src="../../../resources/js/daumSearch.js"></script> -->

<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9",
			"ee6b7db5b51705a13dc2339db3edaf6d"];</script>
<script>
$(function() {
var datas = ${polygonList};
	
	var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
	mapOption = { 
        center: new daum.maps.LatLng(37.509525,126.981482), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };	
	
	var areas = []
	console.log("datas : " + datas);
	$.each(datas, function(index, values) {
		var guPoly = {}
		guPoly.name = values.name;
		guPoly.path = []
		
		$.each(values.pointList, function(i, v) {
			guPoly.path.push(new daum.maps.LatLng(v.lat, v.lng));
		});
		areas.push(guPoly);	
	}) ;
	console.log(areas);
	
	
	
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
	
	// 컨트롤러에서 직렬화된 데이터를 바로 자바스크립트 변수에 지정
	var serverDatas = ${shopData};
	//매출분석
	var salesData = ${salesData};
	 var salesDate = [];
	 var maleVolume=[];
	 var femaleVolume=[];
	 var teenVolume=[];
	 var twentyVolume=[];
	 var thirtyVolume=[];
	 var fortyVolume=[];
	 var fiftyVolume=[];
	 var sixtyVolume=[];
	 var maleNo=[];
	 var femaleNo=[];
	 var teenNo=[];
	 var twentyNo=[];
	 var thirtyNo=[];
	 var fortyNo=[];
	 var fiftyNo=[];
	 var sixtyNo=[];
	$(salesData).each(function(index, value){
		salesDate.push(value.bdDate);
		maleVolume.push(value.maleSalesVolume);
		femaleVolume.push(value.femaleSalesVolume);
		teenVolume.push(value.teenSalesVolume);
		twentyVolume.push(value.twentySalesVolume);
		thirtyVolume.push(value.thirtySalesVolume);
		fortyVolume.push(value.fortySalesVolume);
		fiftyVolume.push(value.fiftySalesVolume);
		sixtyVolume.push(value.sixtySalesVolume);
		maleNo.push(value.maleSalesNo);
		femaleNo.push(value.femaleSalesNo);
		teenNo.push(value.teenSalesNo);
		twentyNo.push(value.twentySalesNo);
		thirtyNo.push(value.thirtySalesNo);
		fortyNo.push(value.fortySalesNo);
		fiftyNo.push(value.fiftySalesNo);
		sixtyNo.push(value.sixtySalesNo);
	});
	//유동인구
	var floatingData = ${floatingData}
	var floatDate=[];
	var floatTotal=[];
	var maleFloat=[];
	var femaleFloat=[];
	var teenFloat=[];
	var twentyFloat=[];
	var thirtyFloat=[];
	var fortyFloat=[];
	var fiftyFloat=[];
	var sixtyFloat=[];
	$(floatingData).each(function(index,value){
		floatDate.push(value.bdDate);
		floatTotal.push(value.totalFloatingPopulation);
		maleFloat.push(value.totalMale);
		femaleFloat.push(value.totalFemale);
		teenFloat.push(value.totalTeen);
		twentyFloat.push(value.totalTwenty);
		thirtyFloat.push(value.totalThirty);
		fortyFloat.push(value.totalForty);
		fiftyFloat.push(value.totalFifty);
		sixtyFloat.push(value.totalSixty);
	});
	//상주인구
	var settledData = ${settledData};
	var settledDate = [];
	var settledTotal = [];
	var settledMale = [];
	var settledFemale = [];
	var settledTeen = [];
	var settledTwenty = [];
	var settledThirty = [];
	var settledForty = [];
	var settledFifty = [];
	var settledSixty = [];
	var settledDate1=[];
	$(settledData).each(function(index,value){
		settledDate.push(value.bdDate);
		settledTotal.push(value.totalPopulation);
		settledMale.push(value.totalMale);
		settledFemale.push(value.totalFemale);
		settledTeen.push(value.totalTeen);
		settledTwenty.push(value.totalTwenty);
		settledThirty.push(value.totalThirty);
		settledForty.push(value.totalForty);
		settledFifty.push(value.totalFifty);
		settledSixty.push(value.totalSixty);
		if(index>=2){
			settledDate1.push(value.bdDate);
		}
	});
	//소득소비분석
	var ioData = ${ioData};
	var ioDate = [];
	var ioAvgIncome=[];
	var ioOutcome=[];
	var ioGrocery=[];
	var ioGarment=[];
	var ioNecessaries=[];
	var ioMedical=[];
	var ioTransportation=[];
	var ioLeisure=[];
	var ioCultural=[];
	var ioEducation=[];
	var ioEntertaining=[];
	var ioDate1=[];
	$(ioData).each(function(index,value){
		ioDate.push(value.bdDate);
		ioAvgIncome.push(value.monthAvgIncome);
		ioOutcome.push(value.totalOutcome);
		ioGrocery.push(value.groceryOutcome);
		ioGarment.push(value.garmentOutcome);
		ioNecessaries.push(value.necessariesOutcome);
		ioMedical.push(value.medicalOutcome);
		ioTransportation.push(value.transportationOutcome);
		ioLeisure.push(value.leisureOutcome);
		ioCultural.push(value.culturalOutcome);
		ioEducation.push(value.educationOutcome);
		ioEntertaining.push(value.entertainingOutcome);
		if(index>=8){
			ioDate1.push(value.bdDate);
		}
	});
	
	zingchart.THEME="classic";
	//점포수_개업수_폐업수
	var shopAnal = {
	    "background-color":"#ecf2f6",
	    "graphset":[
	        {	// 세로 바 차트
	            "type":"bar",
	            
	           /*  "background-color":"#fff",
	            "border-color":"#dae5ec",
	            "border-width":"1px",
	            "height":"30%",
	            "width":"96%",
	            "x":"2%",
	            "y":"3%", */
	            "title":{
	               /*  "margin-top":"7px",
	                "margin-left":"9px",
	                "font-family":"Arial", */
	                "text":"점포수/개업수/폐업수",
	                /* "background-color":"none",
	                "shadow":0,
	                "text-align":"left",
	                "font-size":"11px",
	                "font-weight":"bold",
	                "font-color":"#707d94" */
	            },
	            "scale-y":{
	                "values":"0:10:2",
	               // "max-ticks":4,
	                "max-items":5,
	                "line-color":"none",
	                "tick":{
	                    "visible":false
	                },
	                "item":{
	                    "font-color":"#8391a5",
	                    "font-family":"Arial",
	                    "font-size":"10px",
	                    "padding-right":"5px"
	                },
	                "guide":{
	                    "rules":[
	                        {
	                          "rule":"%i == 0",
	                          "line-width":0
	                        },
	                        {
	                          "rule":"%i > 0",
	                          "line-style":"solid",
	                          "line-width":"1px",
	                          "line-color":"#d2dae2",
	                          "alpha":0.4 
	                        }
	                    
	                    ]
	                }
	            },
	            "scale-x":{
	                "items-overlap":true,
	                "max-items":9999,	// 세로 바 차트 라벨
	                "values":[2017],
	                "offset-y":"1px",
	                "line-color":"#d2dae2",
	                "item":{
	                    "font-color":"#8391a5",
	                    "font-family":"Arial",
	                    "font-size":"11px",
	                    "padding-top":"2px"
	                },
	                "tick":{
	                    "visible":false,
	                    "line-color":"#d2dae2"
	                },
	                "guide":{
	                    "visible":false
	                }
	            },
	            /*  "plotarea":{
	                "margin":"45px 20px 38px 45px"
	            },  */
	            "plot":{
	                "bar-width":"33px",
	                
	                "value-box":{
	                	"text":"%v"
	                },
	                "hover-state":{
	                    "visible":false
	                },
	                "animation":{
	                    "delay":500,
	                    "effect":"ANIMATION_SLIDE_BOTTOM"
	                },
	                "tooltip":{
	                    "font-color":"#fff",
	                    "font-family":"Arial",
	                    "font-size":"11px",
	                    "border-radius":"6px",
	                    "shadow":false,
	                    "padding":"5px 10px",
	                    "background-color":"#707e94",
	                    "text":"%t:%v"
	                }
	            },
	            "legend":{
	            	"toggle-action":"hide",
	            	/* "header": {
	            		"text":"Legend Header"
	            	}, */
	            	"item":{
	            		"cursor":"pointer"
	            	},
	            	"draggable":true,
	            	"drag-handler":"icon"
	            },
	            "series":[
	                {
	                    "values": [serverDatas.no_of_shop],// 세로 바 차트 데이터
	                    "text":"점포수"
	                    
	                },
	                {
	                	"values":[serverDatas.no_of_open],
	                	"text":"개업수"
	                	
	                },
	                {
	                	"values":[serverDatas.no_of_close],
	                	"text":"폐업수"
	                	
	                }
	            ]
	        }
	        
	        
	    ]
	};

	zingchart.render({ 
		id : 'shopChart', 
		data : shopAnal, 
		height: 500, 
		width: 800 
	});
	//매출분석 월 성별 매출금액
	var genderVolume = {
		    "background-color":"#ecf2f6",
		    "graphset":[
		        {	// 세로 바 차트
		            "type":"bar",
		            
		           /*  "background-color":"#fff",
		            "border-color":"#dae5ec",
		            "border-width":"1px",
		            "height":"30%",
		            "width":"96%",
		            "x":"2%",
		            "y":"3%", */
		            "title":{
		               /*  "margin-top":"7px",
		                "margin-left":"9px",
		                "font-family":"Arial", */
		                "text":"월 성별 매출금액",
		                /* "background-color":"none",
		                "shadow":0,
		                "text-align":"left",
		                "font-size":"11px",
		                "font-weight":"bold",
		                "font-color":"#707d94" */
		            },
		            "scale-y":{
		                "values":"0:50000000:10000000",
		               // "max-ticks":4,
		                "max-items":5,
		                "line-color":"none",
		                "exponent":true,
		                "tick":{
		                    "visible":false
		                },
		                "item":{
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "padding-right":"5px"
		                },
		                "guide":{
		                    "rules":[
		                        {
		                          "rule":"%i == 0",
		                          "line-width":0
		                        },
		                        {
		                          "rule":"%i > 0",
		                          "line-style":"solid",
		                          "line-width":"1px",
		                          "line-color":"#d2dae2",
		                          "alpha":0.4 
		                        }
		                    
		                    ]
		                }
		            },
		            "scale-x":{
		                "items-overlap":true,
		                "max-items":9999,	// 세로 바 차트 라벨
		                "values":salesDate,
		                "offset-y":"1px",
		                "line-color":"#d2dae2",
		                "item":{
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"11px",
		                    "padding-top":"2px"
		                },
		                "tick":{
		                    "visible":false,
		                    "line-color":"#d2dae2"
		                },
		                "guide":{
		                    "visible":false
		                }
		            },
		            /*  "plotarea":{
		                "margin":"45px 20px 38px 45px"
		            },  */
		            "plot":{
		                "bar-width":"33px",
		                
		                "value-box":{
		                	"text":"%v"
		                },
		                "hover-state":{
		                    "visible":false
		                },
		                "animation":{
		                    "delay":500,
		                    "effect":"ANIMATION_SLIDE_BOTTOM"
		                },
		                "tooltip":{
		                    "font-color":"#fff",
		                    "font-family":"Arial",
		                    "font-size":"11px",
		                    "border-radius":"6px",
		                    "shadow":false,
		                    "padding":"5px 10px",
		                    "background-color":"#707e94",
		                    "text":"%t:%v"
		                }
		            },
		            "legend":{
		            	"toggle-action":"hide",
		            	/* "header": {
		            		"text":"Legend Header"
		            	}, */
		            	"item":{
		            		"cursor":"pointer"
		            	},
		            	"draggable":true,
		            	"drag-handler":"icon"
		            },
		            "series":[
		                {
		                    "values": maleVolume,// 세로 바 차트 데이터
		                    "text":"남성"
		                    
		                },
		                {
		                	"values":femaleVolume,
		                	"text":"여성"
		                	
		                	
		                }
		            ]
		        }
		        
		        
		    ]
		};

		zingchart.render({ 
			id : 'genderVolumeChart', 
			data : genderVolume, 
			height: 500, 
			width: 800 
		});
	
		//매출분석 월 연령별 매출금액
		var ageVolume = {
			    "background-color":"#ecf2f6",
			    "graphset":[
			        {	// 세로 바 차트
			            "type":"bar",
			            
			           /*  "background-color":"#fff",
			            "border-color":"#dae5ec",
			            "border-width":"1px",
			            "height":"30%",
			            "width":"96%",
			            "x":"2%",
			            "y":"3%", */
			            "title":{
			               /*  "margin-top":"7px",
			                "margin-left":"9px",
			                "font-family":"Arial", */
			                "text":"월 연령별 매출금액",
			                /* "background-color":"none",
			                "shadow":0,
			                "text-align":"left",
			                "font-size":"11px",
			                "font-weight":"bold",
			                "font-color":"#707d94" */
			            },
			            "scale-y":{
			                "values":"0:100000000:25000",
			               // "max-ticks":4,
			                "max-items":4,
			                "line-color":"none",
			                "exponent":true,
			                "tick":{
			                    "visible":false
			                },
			                "item":{
			                    "font-color":"#8391a5",
			                    "font-family":"Arial",
			                    "font-size":"10px",
			                    "padding-right":"5px"
			                },
			                "guide":{
			                    "rules":[
			                        {
			                          "rule":"%i == 0",
			                          "line-width":0
			                        },
			                        {
			                          "rule":"%i > 0",
			                          "line-style":"solid",
			                          "line-width":"1px",
			                          "line-color":"#d2dae2",
			                          "alpha":0.4 
			                        }
			                    
			                    ]
			                }
			            },
			            "scale-x":{
			                "items-overlap":true,
			                "max-items":9999,	// 세로 바 차트 라벨
			                "values":salesDate,
			                "offset-y":"1px",
			                "line-color":"#d2dae2",
			                "item":{
			                    "font-color":"#8391a5",
			                    "font-family":"Arial",
			                    "font-size":"11px",
			                    "padding-top":"2px"
			                },
			                "tick":{
			                    "visible":false,
			                    "line-color":"#d2dae2"
			                },
			                "guide":{
			                    "visible":false
			                }
			            },
			            /*  "plotarea":{
			                "margin":"45px 20px 38px 45px"
			            },  */
			            "plot":{
			                "bar-width":"33px",
			                
			                "value-box":{
			                	"text":"%v"
			                },
			                "hover-state":{
			                    "visible":false
			                },
			                "animation":{
			                    "delay":500,
			                    "effect":"ANIMATION_SLIDE_BOTTOM"
			                },
			                "tooltip":{
			                    "font-color":"#fff",
			                    "font-family":"Arial",
			                    "font-size":"11px",
			                    "border-radius":"6px",
			                    "shadow":false,
			                    "padding":"5px 10px",
			                    "background-color":"#707e94",
			                    "text":"%t:%v"
			                }
			            },
			            "legend":{
			            	"toggle-action":"hide",
			            	/* "header": {
			            		"text":"Legend Header"
			            	}, */
			            	"item":{
			            		"cursor":"pointer"
			            	},
			            	"draggable":true,
			            	"drag-handler":"icon"
			            },
			            "series":[
			                {
			                    "values": teenVolume,// 세로 바 차트 데이터
			                    "text":"10대"
			                    
			                },
			                {
			                	"values":twentyVolume,
			                	"text":"20대"
			                	
			                	
			                },
			                {
			                    "values": thirtyVolume,// 세로 바 차트 데이터
			                    "text":"30대"
			                    
			                },
			                {
			                    "values": fortyVolume,// 세로 바 차트 데이터
			                    "text":"40대"
			                    
			                },
			                {
			                    "values": fiftyVolume,// 세로 바 차트 데이터
			                    "text":"50대"
			                    
			                },
			                {
			                    "values": sixtyVolume,// 세로 바 차트 데이터
			                    "text":"60대"
			                    
			                }
			            ]
			        }
			        
			        
			    ]
			};

			zingchart.render({ 
				id : 'ageVolumeChart', 
				data : ageVolume, 
				height: 500, 
				width: 800 
			});
			
			//매출분석 월 성별 매출건수
			var genderNo = {
				    "background-color":"#ecf2f6",
				    "graphset":[
				        {	// 세로 바 차트
				            "type":"bar",
				            
				           /*  "background-color":"#fff",
				            "border-color":"#dae5ec",
				            "border-width":"1px",
				            "height":"30%",
				            "width":"96%",
				            "x":"2%",
				            "y":"3%", */
				            "title":{
				               /*  "margin-top":"7px",
				                "margin-left":"9px",
				                "font-family":"Arial", */
				                "text":"월 성별 매출건수",
				                /* "background-color":"none",
				                "shadow":0,
				                "text-align":"left",
				                "font-size":"11px",
				                "font-weight":"bold",
				                "font-color":"#707d94" */
				            },
				            "scale-y":{
				                "values":"0:5000:1000",
				               // "max-ticks":4,
				                "max-items":5,
				                "line-color":"none",
				                "tick":{
				                    "visible":false
				                },
				                "item":{
				                    "font-color":"#8391a5",
				                    "font-family":"Arial",
				                    "font-size":"10px",
				                    "padding-right":"5px"
				                },
				                "guide":{
				                    "rules":[
				                        {
				                          "rule":"%i == 0",
				                          "line-width":0
				                        },
				                        {
				                          "rule":"%i > 0",
				                          "line-style":"solid",
				                          "line-width":"1px",
				                          "line-color":"#d2dae2",
				                          "alpha":0.4 
				                        }
				                    
				                    ]
				                }
				            },
				            "scale-x":{
				                "items-overlap":true,
				                "max-items":9999,	// 세로 바 차트 라벨
				                "values":salesDate,
				                "offset-y":"1px",
				                "line-color":"#d2dae2",
				                "item":{
				                    "font-color":"#8391a5",
				                    "font-family":"Arial",
				                    "font-size":"11px",
				                    "padding-top":"2px"
				                },
				                "tick":{
				                    "visible":false,
				                    "line-color":"#d2dae2"
				                },
				                "guide":{
				                    "visible":false
				                }
				            },
				            /*  "plotarea":{
				                "margin":"45px 20px 38px 45px"
				            },  */
				            "plot":{
				                "bar-width":"33px",
				                
				                "value-box":{
				                	"text":"%v"
				                },
				                "hover-state":{
				                    "visible":false
				                },
				                "animation":{
				                    "delay":500,
				                    "effect":"ANIMATION_SLIDE_BOTTOM"
				                },
				                "tooltip":{
				                    "font-color":"#fff",
				                    "font-family":"Arial",
				                    "font-size":"11px",
				                    "border-radius":"6px",
				                    "shadow":false,
				                    "padding":"5px 10px",
				                    "background-color":"#707e94",
				                    "text":"%t:%v"
				                }
				            },
				            "legend":{
				            	"toggle-action":"hide",
				            	/* "header": {
				            		"text":"Legend Header"
				            	}, */
				            	"item":{
				            		"cursor":"pointer"
				            	},
				            	"draggable":true,
				            	"drag-handler":"icon"
				            },
				            "series":[
				                {
				                    "values": maleNo,// 세로 바 차트 데이터
				                    "text":"남성"
				                    
				                },
				                {
				                	"values":femaleNo,
				                	"text":"여성"
				                	
				                	
				                
				                }
				            ]
				        }
				        
				        
				    ]
				};

				zingchart.render({ 
					id : 'genderNoChart', 
					data : genderNo, 
					height: 500, 
					width: 800 
				});
				
				//매출분석 월 연령별 매출건수
				var ageNo = {
					    "background-color":"#ecf2f6",
					    "graphset":[
					        {	// 세로 바 차트
					            "type":"bar",
					            
					           /*  "background-color":"#fff",
					            "border-color":"#dae5ec",
					            "border-width":"1px",
					            "height":"30%",
					            "width":"96%",
					            "x":"2%",
					            "y":"3%", */
					            "title":{
					               /*  "margin-top":"7px",
					                "margin-left":"9px",
					                "font-family":"Arial", */
					                "text":"월 연령별 매출건수",
					                /* "background-color":"none",
					                "shadow":0,
					                "text-align":"left",
					                "font-size":"11px",
					                "font-weight":"bold",
					                "font-color":"#707d94" */
					            },
					            "scale-y":{
					                "values":"0:5000:1000",
					               // "max-ticks":4,
					                "max-items":5,
					                "line-color":"none",
					                "tick":{
					                    "visible":false
					                },
					                "item":{
					                    "font-color":"#8391a5",
					                    "font-family":"Arial",
					                    "font-size":"10px",
					                    "padding-right":"5px"
					                },
					                "guide":{
					                    "rules":[
					                        {
					                          "rule":"%i == 0",
					                          "line-width":0
					                        },
					                        {
					                          "rule":"%i > 0",
					                          "line-style":"solid",
					                          "line-width":"1px",
					                          "line-color":"#d2dae2",
					                          "alpha":0.4 
					                        }
					                    
					                    ]
					                }
					            },
					            "scale-x":{
					                "items-overlap":true,
					                "max-items":9999,	// 세로 바 차트 라벨
					                "values":salesDate,
					                "offset-y":"1px",
					                "line-color":"#d2dae2",
					                "item":{
					                    "font-color":"#8391a5",
					                    "font-family":"Arial",
					                    "font-size":"11px",
					                    "padding-top":"2px"
					                },
					                "tick":{
					                    "visible":false,
					                    "line-color":"#d2dae2"
					                },
					                "guide":{
					                    "visible":false
					                }
					            },
					            /*  "plotarea":{
					                "margin":"45px 20px 38px 45px"
					            },  */
					            "plot":{
					                "bar-width":"33px",
					                
					                "value-box":{
					                	"text":"%v"
					                },
					                "hover-state":{
					                    "visible":false
					                },
					                "animation":{
					                    "delay":500,
					                    "effect":"ANIMATION_SLIDE_BOTTOM"
					                },
					                "tooltip":{
					                    "font-color":"#fff",
					                    "font-family":"Arial",
					                    "font-size":"11px",
					                    "border-radius":"6px",
					                    "shadow":false,
					                    "padding":"5px 10px",
					                    "background-color":"#707e94",
					                    "text":"%t:%v"
					                }
					            },
					            "legend":{
					            	"toggle-action":"hide",
					            	/* "header": {
					            		"text":"Legend Header"
					            	}, */
					            	"item":{
					            		"cursor":"pointer"
					            	},
					            	"draggable":true,
					            	"drag-handler":"icon"
					            },
					            "series":[
					                {
					                    "values": teenNo,// 세로 바 차트 데이터
					                    "text":"10대"
					                    
					                },
					                {
					                	"values":twentyNo,
					                	"text":"20대"
					                	
					                	
					                },
					                {
					                    "values": thirtyNo,// 세로 바 차트 데이터
					                    "text":"30대"
					                    
					                },
					                {
					                    "values": fortyNo,// 세로 바 차트 데이터
					                    "text":"40대"
					                    
					                },
					                {
					                    "values": fiftyNo,// 세로 바 차트 데이터
					                    "text":"50대"
					                    
					                },
					                {
					                    "values": sixtyNo,// 세로 바 차트 데이터
					                    "text":"60대"
					                    
					                }
					            ]
					        }
					        
					        
					    ]
					};

					zingchart.render({ 
						id : 'ageNoChart', 
						data : ageNo, 
						height: 500, 
						width: 800 
					});
					//총 유동인구
					var totalPeople = {
					    "background-color":"#ecf2f6",
					    "graphset":[
					        {	// 세로 바 차트
					            "type":"bar",
					            
					           /*  "background-color":"#fff",
					            "border-color":"#dae5ec",
					            "border-width":"1px",
					            "height":"30%",
					            "width":"96%",
					            "x":"2%",
					            "y":"3%", */
					            "title":{
					               /*  "margin-top":"7px",
					                "margin-left":"9px",
					                "font-family":"Arial", */
					                "text":"총 유동인구",
					                /* "background-color":"none",
					                "shadow":0,
					                "text-align":"left",
					                "font-size":"11px",
					                "font-weight":"bold",
					                "font-color":"#707d94" */
					            },
					            "scale-y":{
					                "values":"0:10000:2000",
					               // "max-ticks":4,
					                "max-items":5,
					                "line-color":"none",
					                "tick":{
					                    "visible":false
					                },
					                "item":{
					                    "font-color":"#8391a5",
					                    "font-family":"Arial",
					                    "font-size":"10px",
					                    "padding-right":"5px"
					                },
					                "guide":{
					                    "rules":[
					                        {
					                          "rule":"%i == 0",
					                          "line-width":0
					                        },
					                        {
					                          "rule":"%i > 0",
					                          "line-style":"solid",
					                          "line-width":"1px",
					                          "line-color":"#d2dae2",
					                          "alpha":0.4 
					                        }
					                    
					                    ]
					                }
					            },
					            "scale-x":{
					                "items-overlap":true,
					                "max-items":9999,	// 세로 바 차트 라벨
					                "values":floatDate,
					                "offset-y":"1px",
					                "line-color":"#d2dae2",
					                "item":{
					                    "font-color":"#8391a5",
					                    "font-family":"Arial",
					                    "font-size":"11px",
					                    "padding-top":"2px"
					                },
					                "tick":{
					                    "visible":false,
					                    "line-color":"#d2dae2"
					                },
					                "guide":{
					                    "visible":false
					                }
					            },
					            /*  "plotarea":{
					                "margin":"45px 20px 38px 45px"
					            },  */
					            "plot":{
					                "bar-width":"33px",
					                
					                "value-box":{
					                	"text":"%v"
					                },
					                "hover-state":{
					                    "visible":false
					                },
					                "animation":{
					                    "delay":500,
					                    "effect":"ANIMATION_SLIDE_BOTTOM"
					                },
					                "tooltip":{
					                    "font-color":"#fff",
					                    "font-family":"Arial",
					                    "font-size":"11px",
					                    "border-radius":"6px",
					                    "shadow":false,
					                    "padding":"5px 10px",
					                    "background-color":"#707e94",
					                    "text":"%t:%v"
					                }
					            },
					            "legend":{
					            	"toggle-action":"hide",
					            	/* "header": {
					            		"text":"Legend Header"
					            	}, */
					            	"item":{
					            		"cursor":"pointer"
					            	},
					            	"draggable":true,
					            	"drag-handler":"icon"
					            },
					            "series":[
					                {
					                    "values": floatTotal,// 세로 바 차트 데이터
					                    "text":"총 유동인구"
					                    
					                }
					                
					            ]
					        }
					        
					        
					    ]
					};

					zingchart.render({ 
						id : 'totalPeopleChart', 
						data : totalPeople, 
						height: 500, 
						width: 800 
					});
					
					//월 성별 유동인구
					var genderFloat = {
						    "background-color":"#ecf2f6",
						    "graphset":[
						        {	// 세로 바 차트
						            "type":"bar",
						            
						           /*  "background-color":"#fff",
						            "border-color":"#dae5ec",
						            "border-width":"1px",
						            "height":"30%",
						            "width":"96%",
						            "x":"2%",
						            "y":"3%", */
						            "title":{
						               /*  "margin-top":"7px",
						                "margin-left":"9px",
						                "font-family":"Arial", */
						                "text":"월 성별 유동인구",
						                /* "background-color":"none",
						                "shadow":0,
						                "text-align":"left",
						                "font-size":"11px",
						                "font-weight":"bold",
						                "font-color":"#707d94" */
						            },
						            "scale-y":{
						                "values":"0:5000:1000",
						               // "max-ticks":4,
						                "max-items":5,
						                "line-color":"none",
						                "tick":{
						                    "visible":false
						                },
						                "item":{
						                    "font-color":"#8391a5",
						                    "font-family":"Arial",
						                    "font-size":"10px",
						                    "padding-right":"5px"
						                },
						                "guide":{
						                    "rules":[
						                        {
						                          "rule":"%i == 0",
						                          "line-width":0
						                        },
						                        {
						                          "rule":"%i > 0",
						                          "line-style":"solid",
						                          "line-width":"1px",
						                          "line-color":"#d2dae2",
						                          "alpha":0.4 
						                        }
						                    
						                    ]
						                }
						            },
						            "scale-x":{
						                "items-overlap":true,
						                "max-items":9999,	// 세로 바 차트 라벨
						                "values":salesDate,
						                "offset-y":"1px",
						                "line-color":"#d2dae2",
						                "item":{
						                    "font-color":"#8391a5",
						                    "font-family":"Arial",
						                    "font-size":"11px",
						                    "padding-top":"2px"
						                },
						                "tick":{
						                    "visible":false,
						                    "line-color":"#d2dae2"
						                },
						                "guide":{
						                    "visible":false
						                }
						            },
						            /*  "plotarea":{
						                "margin":"45px 20px 38px 45px"
						            },  */
						            "plot":{
						                "bar-width":"33px",
						                
						                "value-box":{
						                	"text":"%v"
						                },
						                "hover-state":{
						                    "visible":false
						                },
						                "animation":{
						                    "delay":500,
						                    "effect":"ANIMATION_SLIDE_BOTTOM"
						                },
						                "tooltip":{
						                    "font-color":"#fff",
						                    "font-family":"Arial",
						                    "font-size":"11px",
						                    "border-radius":"6px",
						                    "shadow":false,
						                    "padding":"5px 10px",
						                    "background-color":"#707e94",
						                    "text":"%t:%v"
						                }
						            },
						            "legend":{
						            	"toggle-action":"hide",
						            	/* "header": {
						            		"text":"Legend Header"
						            	}, */
						            	"item":{
						            		"cursor":"pointer"
						            	},
						            	"draggable":true,
						            	"drag-handler":"icon"
						            },
						            "series":[
						                {
						                    "values": maleFloat,// 세로 바 차트 데이터
						                    "text":"남성"
						                    
						                },
						                {
						                	"values":femaleFloat,
						                	"text":"여성"
						                	
						                	
						                
						                }
						            ]
						        }
						        
						        
						    ]
						};

						zingchart.render({ 
							id : 'genderFloatChart', 
							data : genderFloat, 
							height: 500, 
							width: 800 
						});
						
						//월 연령별 유동인구
						var ageFloat = {
							    "background-color":"#ecf2f6",
							    "graphset":[
							        {	// 세로 바 차트
							            "type":"bar",
							            
							           /*  "background-color":"#fff",
							            "border-color":"#dae5ec",
							            "border-width":"1px",
							            "height":"30%",
							            "width":"96%",
							            "x":"2%",
							            "y":"3%", */
							            "title":{
							               /*  "margin-top":"7px",
							                "margin-left":"9px",
							                "font-family":"Arial", */
							                "text":"월 연령별 유동인구",
							                /* "background-color":"none",
							                "shadow":0,
							                "text-align":"left",
							                "font-size":"11px",
							                "font-weight":"bold",
							                "font-color":"#707d94" */
							            },
							            "scale-y":{
							                "values":"0:3000:1000",
							               // "max-ticks":4,
							                "max-items":3,
							                "line-color":"none",
							                "tick":{
							                    "visible":false
							                },
							                "item":{
							                    "font-color":"#8391a5",
							                    "font-family":"Arial",
							                    "font-size":"10px",
							                    "padding-right":"5px"
							                },
							                "guide":{
							                    "rules":[
							                        {
							                          "rule":"%i == 0",
							                          "line-width":0
							                        },
							                        {
							                          "rule":"%i > 0",
							                          "line-style":"solid",
							                          "line-width":"1px",
							                          "line-color":"#d2dae2",
							                          "alpha":0.4 
							                        }
							                    
							                    ]
							                }
							            },
							            "scale-x":{
							                "items-overlap":true,
							                "max-items":9999,	// 세로 바 차트 라벨
							                "values":salesDate,
							                "offset-y":"1px",
							                "line-color":"#d2dae2",
							                "item":{
							                    "font-color":"#8391a5",
							                    "font-family":"Arial",
							                    "font-size":"11px",
							                    "padding-top":"2px"
							                },
							                "tick":{
							                    "visible":false,
							                    "line-color":"#d2dae2"
							                },
							                "guide":{
							                    "visible":false
							                }
							            },
							            /*  "plotarea":{
							                "margin":"45px 20px 38px 45px"
							            },  */
							            "plot":{
							                "bar-width":"33px",
							                
							                "value-box":{
							                	"text":"%v"
							                },
							                "hover-state":{
							                    "visible":false
							                },
							                "animation":{
							                    "delay":500,
							                    "effect":"ANIMATION_SLIDE_BOTTOM"
							                },
							                "tooltip":{
							                    "font-color":"#fff",
							                    "font-family":"Arial",
							                    "font-size":"11px",
							                    "border-radius":"6px",
							                    "shadow":false,
							                    "padding":"5px 10px",
							                    "background-color":"#707e94",
							                    "text":"%t:%v"
							                }
							            },
							            "legend":{
							            	"toggle-action":"hide",
							            	/* "header": {
							            		"text":"Legend Header"
							            	}, */
							            	"item":{
							            		"cursor":"pointer"
							            	},
							            	"draggable":true,
							            	"drag-handler":"icon"
							            },
							            "series":[
							                {
							                    "values": teenFloat,// 세로 바 차트 데이터
							                    "text":"10대"
							                    
							                },
							                {
							                	"values":twentyFloat,
							                	"text":"20대"
							                	
							                	
							                },
							                {
							                    "values": thirtyFloat,// 세로 바 차트 데이터
							                    "text":"30대"
							                    
							                },
							                {
							                    "values": fortyFloat,// 세로 바 차트 데이터
							                    "text":"40대"
							                    
							                },
							                {
							                    "values": fiftyFloat,// 세로 바 차트 데이터
							                    "text":"50대"
							                    
							                },
							                {
							                    "values": sixtyFloat,// 세로 바 차트 데이터
							                    "text":"60대"
							                    
							                }
							            ]
							        }
							        
							        
							    ]
							};

							zingchart.render({ 
								id : 'ageFloatChart', 
								data : ageFloat, 
								height: 500, 
								width: 800 
							});
							
							//총 상주인구
							var totalSettled = {
							    "background-color":"#ecf2f6",
							    "graphset":[
							        {	// 세로 바 차트
							            "type":"bar",
							            
							           /*  "background-color":"#fff",
							            "border-color":"#dae5ec",
							            "border-width":"1px",
							            "height":"30%",
							            "width":"96%",
							            "x":"2%",
							            "y":"3%", */
							            "title":{
							               /*  "margin-top":"7px",
							                "margin-left":"9px",
							                "font-family":"Arial", */
							                "text":"총 상주인구",
							                /* "background-color":"none",
							                "shadow":0,
							                "text-align":"left",
							                "font-size":"11px",
							                "font-weight":"bold",
							                "font-color":"#707d94" */
							            },
							            "scale-y":{
							                "values":"0:3000:600",
							               // "max-ticks":4,
							                "max-items":5,
							                "line-color":"none",
							                "tick":{
							                    "visible":false
							                },
							                "item":{
							                    "font-color":"#8391a5",
							                    "font-family":"Arial",
							                    "font-size":"10px",
							                    "padding-right":"5px"
							                },
							                "guide":{
							                    "rules":[
							                        {
							                          "rule":"%i == 0",
							                          "line-width":0
							                        },
							                        {
							                          "rule":"%i > 0",
							                          "line-style":"solid",
							                          "line-width":"1px",
							                          "line-color":"#d2dae2",
							                          "alpha":0.4 
							                        }
							                    
							                    ]
							                }
							            },
							            "scale-x":{
							                "items-overlap":true,
							                "max-items":9999,	// 세로 바 차트 라벨
							                "values":settledDate,
							                "offset-y":"1px",
							                "line-color":"#d2dae2",
							                "item":{
							                    "font-color":"#8391a5",
							                    "font-family":"Arial",
							                    "font-size":"11px",
							                    "padding-top":"2px"
							                },
							                "tick":{
							                    "visible":false,
							                    "line-color":"#d2dae2"
							                },
							                "guide":{
							                    "visible":false
							                }
							            },
							            /*  "plotarea":{
							                "margin":"45px 20px 38px 45px"
							            },  */
							            "plot":{
							                "bar-width":"33px",
							                
							                "value-box":{
							                	"text":"%v"
							                },
							                "hover-state":{
							                    "visible":false
							                },
							                "animation":{
							                    "delay":500,
							                    "effect":"ANIMATION_SLIDE_BOTTOM"
							                },
							                "tooltip":{
							                    "font-color":"#fff",
							                    "font-family":"Arial",
							                    "font-size":"11px",
							                    "border-radius":"6px",
							                    "shadow":false,
							                    "padding":"5px 10px",
							                    "background-color":"#707e94",
							                    "text":"%t:%v"
							                }
							            },
							            "legend":{
							            	"toggle-action":"hide",
							            	/* "header": {
							            		"text":"Legend Header"
							            	}, */
							            	"item":{
							            		"cursor":"pointer"
							            	},
							            	"draggable":true,
							            	"drag-handler":"icon"
							            },
							            "series":[
							                {
							                    "values": settledTotal,// 세로 바 차트 데이터
							                    "text":"총 상주인구"
							                    
							                }
							                
							            ]
							        }
							        
							        
							    ]
							};

							zingchart.render({ 
								id : 'totalSettledChart', 
								data : totalSettled, 
								height: 500, 
								width: 800 
							});
							
							// 월 성별 상주인구
							var genderSettled = {
								    "background-color":"#ecf2f6",
								    "graphset":[
								        {	// 세로 바 차트
								            "type":"bar",
								            
								           /*  "background-color":"#fff",
								            "border-color":"#dae5ec",
								            "border-width":"1px",
								            "height":"30%",
								            "width":"96%",
								            "x":"2%",
								            "y":"3%", */
								            "title":{
								               /*  "margin-top":"7px",
								                "margin-left":"9px",
								                "font-family":"Arial", */
								                "text":"월 성별 상주인구",
								                /* "background-color":"none",
								                "shadow":0,
								                "text-align":"left",
								                "font-size":"11px",
								                "font-weight":"bold",
								                "font-color":"#707d94" */
								            },
								            "scale-y":{
								                "values":"0:3000:600",
								               // "max-ticks":4,
								                "max-items":5,
								                "line-color":"none",
								                "tick":{
								                    "visible":false
								                },
								                "item":{
								                    "font-color":"#8391a5",
								                    "font-family":"Arial",
								                    "font-size":"10px",
								                    "padding-right":"5px"
								                },
								                "guide":{
								                    "rules":[
								                        {
								                          "rule":"%i == 0",
								                          "line-width":0
								                        },
								                        {
								                          "rule":"%i > 0",
								                          "line-style":"solid",
								                          "line-width":"1px",
								                          "line-color":"#d2dae2",
								                          "alpha":0.4 
								                        }
								                    
								                    ]
								                }
								            },
								            "scale-x":{
								                "items-overlap":true,
								                "max-items":9999,	// 세로 바 차트 라벨
								                "values":settledDate,
								                "offset-y":"1px",
								                "line-color":"#d2dae2",
								                "item":{
								                    "font-color":"#8391a5",
								                    "font-family":"Arial",
								                    "font-size":"11px",
								                    "padding-top":"2px"
								                },
								                "tick":{
								                    "visible":false,
								                    "line-color":"#d2dae2"
								                },
								                "guide":{
								                    "visible":false
								                }
								            },
								            /*  "plotarea":{
								                "margin":"45px 20px 38px 45px"
								            },  */
								            "plot":{
								                "bar-width":"33px",
								                
								                "value-box":{
								                	"text":"%v"
								                },
								                "hover-state":{
								                    "visible":false
								                },
								                "animation":{
								                    "delay":500,
								                    "effect":"ANIMATION_SLIDE_BOTTOM"
								                },
								                "tooltip":{
								                    "font-color":"#fff",
								                    "font-family":"Arial",
								                    "font-size":"11px",
								                    "border-radius":"6px",
								                    "shadow":false,
								                    "padding":"5px 10px",
								                    "background-color":"#707e94",
								                    "text":"%t:%v"
								                }
								            },
								            "legend":{
								            	"toggle-action":"hide",
								            	/* "header": {
								            		"text":"Legend Header"
								            	}, */
								            	"item":{
								            		"cursor":"pointer"
								            	},
								            	"draggable":true,
								            	"drag-handler":"icon"
								            },
								            "series":[
								                {
								                    "values": settledMale,// 세로 바 차트 데이터
								                    "text":"남성"
								                    
								                },
								                {
								                	"values":settledFemale,
								                	"text":"여성"
								                	
								                	
								                }
								            ]
								        }
								        
								        
								    ]
								};

								zingchart.render({ 
									id : 'genderSettledChart', 
									data : genderSettled, 
									height: 500, 
									width: 800 
								});
								
								//월 연령별 상주인구
								var ageSettled = {
									    "background-color":"#ecf2f6",
									    "graphset":[
									        {	// 세로 바 차트
									            "type":"bar",
									            
									           /*  "background-color":"#fff",
									            "border-color":"#dae5ec",
									            "border-width":"1px",
									            "height":"30%",
									            "width":"96%",
									            "x":"2%",
									            "y":"3%", */
									            "title":{
									               /*  "margin-top":"7px",
									                "margin-left":"9px",
									                "font-family":"Arial", */
									                "text":"월 연령별 상주인구",
									                /* "background-color":"none",
									                "shadow":0,
									                "text-align":"left",
									                "font-size":"11px",
									                "font-weight":"bold",
									                "font-color":"#707d94" */
									            },
									            "scale-y":{
									                "values":"0:1000:250",
									               // "max-ticks":4,
									                "max-items":4,
									                "line-color":"none",
									                "tick":{
									                    "visible":false
									                },
									                "item":{
									                    "font-color":"#8391a5",
									                    "font-family":"Arial",
									                    "font-size":"10px",
									                    "padding-right":"5px"
									                },
									                "guide":{
									                    "rules":[
									                        {
									                          "rule":"%i == 0",
									                          "line-width":0
									                        },
									                        {
									                          "rule":"%i > 0",
									                          "line-style":"solid",
									                          "line-width":"1px",
									                          "line-color":"#d2dae2",
									                          "alpha":0.4 
									                        }
									                    
									                    ]
									                }
									            },
									            "scale-x":{
									                "items-overlap":true,
									                "max-items":9999,	// 세로 바 차트 라벨
									                "values":settledDate1,
									                "offset-y":"1px",
									                "line-color":"#d2dae2",
									                "item":{
									                    "font-color":"#8391a5",
									                    "font-family":"Arial",
									                    "font-size":"11px",
									                    "padding-top":"2px"
									                },
									                "tick":{
									                    "visible":false,
									                    "line-color":"#d2dae2"
									                },
									                "guide":{
									                    "visible":false
									                }
									            },
									            /*  "plotarea":{
									                "margin":"45px 20px 38px 45px"
									            },  */
									            "plot":{
									                "bar-width":"33px",
									                
									                "value-box":{
									                	"text":"%v"
									                },
									                "hover-state":{
									                    "visible":false
									                },
									                "animation":{
									                    "delay":500,
									                    "effect":"ANIMATION_SLIDE_BOTTOM"
									                },
									                "tooltip":{
									                    "font-color":"#fff",
									                    "font-family":"Arial",
									                    "font-size":"11px",
									                    "border-radius":"6px",
									                    "shadow":false,
									                    "padding":"5px 10px",
									                    "background-color":"#707e94",
									                    "text":"%t:%v"
									                }
									            },
									            "legend":{
									            	"toggle-action":"hide",
									            	/* "header": {
									            		"text":"Legend Header"
									            	}, */
									            	"item":{
									            		"cursor":"pointer"
									            	},
									            	"draggable":true,
									            	"drag-handler":"icon"
									            },
									            "series":[
									                {
									                    "values": settledTeen,// 세로 바 차트 데이터
									                    "text":"10대"
									                    
									                },
									                {
									                	"values":settledTwenty,
									                	"text":"20대"
									                	
									                	
									                },
									                {
									                    "values": settledThirty,// 세로 바 차트 데이터
									                    "text":"30대"
									                    
									                },
									                {
									                    "values":settledForty,// 세로 바 차트 데이터
									                    "text":"40대"
									                    
									                },
									                {
									                    "values": settledFifty,// 세로 바 차트 데이터
									                    "text":"50대"
									                    
									                },
									                {
									                    "values": settledSixty,// 세로 바 차트 데이터
									                    "text":"60대"
									                    
									                }
									            ]
									        }
									        
									        
									    ]
									};

									zingchart.render({ 
										id : 'ageSettledChart', 
										data : ageSettled, 
										height: 500, 
										width: 800 
									});
									
									//평균소득 및 지출
									var avgIncome = {
									    "background-color":"#ecf2f6",
									    "graphset":[
									        {	// 세로 바 차트
									            "type":"bar",
									            
									           /*  "background-color":"#fff",
									            "border-color":"#dae5ec",
									            "border-width":"1px",
									            "height":"30%",
									            "width":"96%",
									            "x":"2%",
									            "y":"3%", */
									            "title":{
									               /*  "margin-top":"7px",
									                "margin-left":"9px",
									                "font-family":"Arial", */
									                "text":"평균소득금액 및 지출총금액",
									                /* "background-color":"none",
									                "shadow":0,
									                "text-align":"left",
									                "font-size":"11px",
									                "font-weight":"bold",
									                "font-color":"#707d94" */
									            },
									            "scale-y":{
									                "values":"0:500000000:100000000",
									               // "max-ticks":4,
									                "max-items":5,
									                "line-color":"none",
									                "exponent":true,
									                "tick":{
									                    "visible":false
									                },
									                "item":{
									                    "font-color":"#8391a5",
									                    "font-family":"Arial",
									                    "font-size":"10px",
									                    "padding-right":"5px"
									                },
									                "guide":{
									                    "rules":[
									                        {
									                          "rule":"%i == 0",
									                          "line-width":0
									                        },
									                        {
									                          "rule":"%i > 0",
									                          "line-style":"solid",
									                          "line-width":"1px",
									                          "line-color":"#d2dae2",
									                          "alpha":0.4 
									                        }
									                    
									                    ]
									                }
									            },
									            "scale-x":{
									                "items-overlap":true,
									                "max-items":9999,	// 세로 바 차트 라벨
									                "values":ioDate,
									                "offset-y":"1px",
									                "line-color":"#d2dae2",
									                "item":{
									                    "font-color":"#8391a5",
									                    "font-family":"Arial",
									                    "font-size":"11px",
									                    "padding-top":"2px"
									                },
									                "tick":{
									                    "visible":false,
									                    "line-color":"#d2dae2"
									                },
									                "guide":{
									                    "visible":false
									                }
									            },
									            /*  "plotarea":{
									                "margin":"45px 20px 38px 45px"
									            },  */
									            "plot":{
									                "bar-width":"33px",
									                
									                "value-box":{
									                	"text":"%v"
									                },
									                "hover-state":{
									                    "visible":false
									                },
									                "animation":{
									                    "delay":500,
									                    "effect":"ANIMATION_SLIDE_BOTTOM"
									                },
									                "tooltip":{
									                    "font-color":"#fff",
									                    "font-family":"Arial",
									                    "font-size":"11px",
									                    "border-radius":"6px",
									                    "shadow":false,
									                    "padding":"5px 10px",
									                    "background-color":"#707e94",
									                    "text":"%t:%v"
									                }
									            },
									            "legend":{
									            	"toggle-action":"hide",
									            	/* "header": {
									            		"text":"Legend Header"
									            	}, */
									            	"item":{
									            		"cursor":"pointer"
									            	},
									            	"draggable":true,
									            	"drag-handler":"icon"
									            },
									            "series":[
									                {
									                    "values": ioAvgIncome,// 세로 바 차트 데이터
									                    "text":"평균소득금액"
									                    
									                },
									                {
									                	"values":ioOutcome,
									                	"text":"지출총금액"
									                	
									                }
									               
									            ]
									        }
									        
									        
									    ]
									};

									zingchart.render({ 
										id : 'avgIncomeChart', 
										data : avgIncome, 
										height: 500, 
										width: 800 
									});
									
									//월 소비성향 
									var outcomeAnal = {
										    "background-color":"#ecf2f6",
										    "graphset":[
										        {	// 세로 바 차트
										            "type":"bar",
										            
										           /*  "background-color":"#fff",
										            "border-color":"#dae5ec",
										            "border-width":"1px",
										            "height":"30%",
										            "width":"96%",
										            "x":"2%",
										            "y":"3%", */
										            "title":{
										               /*  "margin-top":"7px",
										                "margin-left":"9px",
										                "font-family":"Arial", */
										                "text":"월 소비성향",
										                /* "background-color":"none",
										                "shadow":0,
										                "text-align":"left",
										                "font-size":"11px",
										                "font-weight":"bold",
										                "font-color":"#707d94" */
										            },
										            "scale-y":{
										                "values":"0:150000000:30000000",
										               // "max-ticks":4,
										                "max-items":5,
										                "line-color":"none",
										                "exponent":true,
										                "tick":{
										                    "visible":false
										                },
										                "item":{
										                    "font-color":"#8391a5",
										                    "font-family":"Arial",
										                    "font-size":"10px",
										                    "padding-right":"5px"
										                },
										                "guide":{
										                    "rules":[
										                        {
										                          "rule":"%i == 0",
										                          "line-width":0
										                        },
										                        {
										                          "rule":"%i > 0",
										                          "line-style":"solid",
										                          "line-width":"1px",
										                          "line-color":"#d2dae2",
										                          "alpha":0.4 
										                        }
										                    
										                    ]
										                }
										            },
										            "scale-x":{
										                "items-overlap":true,
										                "max-items":9999,	// 세로 바 차트 라벨
										                "values":ioDate1,
										                "offset-y":"1px",
										                "line-color":"#d2dae2",
										                "item":{
										                    "font-color":"#8391a5",
										                    "font-family":"Arial",
										                    "font-size":"11px",
										                    "padding-top":"2px"
										                },
										                "tick":{
										                    "visible":false,
										                    "line-color":"#d2dae2"
										                },
										                "guide":{
										                    "visible":false
										                }
										            },
										            /*  "plotarea":{
										                "margin":"45px 20px 38px 45px"
										            },  */
										            "plot":{
										                "bar-width":"33px",
										                
										                "value-box":{
										                	"text":"%v"
										                },
										                "hover-state":{
										                    "visible":false
										                },
										                "animation":{
										                    "delay":500,
										                    "effect":"ANIMATION_SLIDE_BOTTOM"
										                },
										                "tooltip":{
										                    "font-color":"#fff",
										                    "font-family":"Arial",
										                    "font-size":"11px",
										                    "border-radius":"6px",
										                    "shadow":false,
										                    "padding":"5px 10px",
										                    "background-color":"#707e94",
										                    "text":"%t:%v"
										                }
										            },
										            "legend":{
										            	"toggle-action":"hide",
										            	/* "header": {
										            		"text":"Legend Header"
										            	}, */
										            	"item":{
										            		"cursor":"pointer"
										            	},
										            	"draggable":true,
										            	"drag-handler":"icon"
										            },
										            "series":[
										                {
										                    "values": ioGrocery,// 세로 바 차트 데이터
										                    "text":"식료품"
										                    
										                },
										                {
										                	"values":ioGarment,
										                	"text":"의류"
										                	
										                	
										                },
										                {
										                    "values": ioNecessaries,// 세로 바 차트 데이터
										                    "text":"생활용품"
										                    
										                },
										                {
										                    "values":ioMedical,// 세로 바 차트 데이터
										                    "text":"의료비"
										                    
										                },
										                {
										                    "values": ioTransportation,// 세로 바 차트 데이터
										                    "text":"교통비"
										                    
										                },
										                {
										                    "values": ioLeisure,// 세로 바 차트 데이터
										                    "text":"여가"
										                    
										                },
										                {
										                    "values": ioCultural,// 세로 바 차트 데이터
										                    "text":"문화"
										                    
										                },
										                {
										                    "values": ioEducation,// 세로 바 차트 데이터
										                    "text":"교육"
										                    
										                },
										                {
										                    "values": ioEntertaining,// 세로 바 차트 데이터
										                    "text":"유흥"
										                    
										                }
										            ]
										        }
										        
										        
										    ]
										};

										zingchart.render({ 
											id : 'outcomeChart', 
											data : outcomeAnal, 
											height: 500, 
											width: 800 
										});
										 //지도
										var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
									    mapOption = { 
									        center: new daum.maps.LatLng(37.509525, 126.981482), // 지도의 중심좌표
									        level: 9 // 지도의 확대 레벨
									    };	 
		
});
</script>			

<title>검색 상세페이지</title>
</head>
<body>
<div id="container" class="searchDetailDG">
	<div role="tabpanel">
		<ul class="nav nav-tabs" role="tablist"> 
			<li role="presentation" class="active">
			<a href="#home" aria-controls="home" role="tab" data-toggle="tab">개업률/폐업률</a>
			</li>
			<li role="presentation">
			<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">매출분석</a>
			</li>
			<li role="presentation">
			<a href="#population" aria-controls="population" role="tab" data-toggle="tab">인구분석</a>
			</li>
			<li role="presentation">
			<a href="#io" aria-controls="io" role="tab" data-toggle="tab">소득소비 분석</a>
			</li>
		</ul>
		<!-- 개업률 폐업률 -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
			<h2>${bd_code_name } <small>${business_type }</small></h2>
			<br/>
			<div id="map2" style="width: 80%; height: 400px;"></div>
			<br/>
			<h4>-개업률 및 폐업률</h4>
			<div id="shopChart"></div>
			<br/>
				<table id="shop_number" class="table table-bordered">
					<tr>
						<th>기준년&nbsp;&nbsp;</th>
						<th>점포수&nbsp;&nbsp;</th>
						<th>개업률&nbsp;&nbsp;</th>
						<th>개업수&nbsp;&nbsp;</th>
						<th>폐업률&nbsp;&nbsp;</th>
						<th>폐업수</th>
					</tr>
					<tr>
						<td>2017&nbsp;&nbsp;</td>
						<c:if test="${empty shop.no_of_shop }">
							<td>0&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${empty shop.open_rate }">
							<td>0%&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${empty shop.no_of_open }">
							<td>0&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${empty shop.close_rate }">
							<td>0%&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${empty shop.no_of_close }">
							<td>0&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${not empty shop.no_of_shop }">
							<td>${shop.no_of_shop }&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${not empty shop.open_rate }">
							<td>${shop.open_rate }%&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${not empty shop.no_of_open }">
							<td>${shop.no_of_open }&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${not empty shop.close_rate }">
							<td>${shop.close_rate }%&nbsp;&nbsp;</td>
						</c:if>
						<c:if test="${not empty shop.no_of_close }">
							<td>${shop.no_of_close }</td>
						</c:if>
					</tr>
				</table>
			</div>
			<!-- 상세보기 매출분석 -->
			<div role="tabpanel" class="tab-pane" id="profile">
				<h2>${bd_code_name } <small>${business_type }</small></h2>
				<br/>
				<h4>-월 성별 매출금액 추이 분석 / (단위:원)</h4>
				<div id="genderVolumeChart"></div>
				<br/>
				
				<table id="genderTableVolume" class="table table-bordered">
					<tr>
						<th>년월&nbsp;&nbsp;</th>
						<th>남성&nbsp;&nbsp;</th>
						<th>여성</th>
					</tr>
					<c:if test="${not empty sales }">
					<c:forEach var="s" items="${sales }">
					<tr>
						<td>${s.bdDate }&nbsp;&nbsp;</td>
						<td>${s.maleSalesVolume }&nbsp;&nbsp;</td>
						<td>${s.femaleSalesVolume }</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty sales }">
						<tr>
							<td colspan="3">자료가 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<br/>
				<h4>-월 연령별 매출금액 추이 분석 / (단위:원)</h4>
				<div id="ageVolumeChart"></div>
				<br/>
				<table id="ageTableVolume" class="table table-bordered">
					<tr>
						<th>년월&nbsp;&nbsp;</th>
						<th>10대&nbsp;&nbsp;</th>
						<th>20대&nbsp;&nbsp;</th>
						<th>30대&nbsp;&nbsp;</th>
						<th>40대&nbsp;&nbsp;</th>
						<th>50대&nbsp;&nbsp;</th>
						<th>60대&nbsp;&nbsp;</th>
					</tr>
					<c:if test="${not empty sales }">
					<c:forEach var="s" items="${sales }">
					<tr>
						<td>${s.bdDate }&nbsp;&nbsp;</td>
						<td>${s.teenSalesVolume }&nbsp;&nbsp;</td>
						<td>${s.twentySalesVolume }&nbsp;&nbsp;</td>
						<td>${s.thirtySalesVolume }&nbsp;&nbsp;</td>
						<td>${s.fortySalesVolume }&nbsp;&nbsp;</td>
						<td>${s.fiftySalesVolume }&nbsp;&nbsp;</td>
						<td>${s.sixtySalesVolume }&nbsp;&nbsp;</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty sales }">
						<tr>
							<td colspan="3">자료가 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<br/>
				<h4>-월 성별 매출건수 추이 분석 / (단위:건)</h4>
				<div id="genderNoChart"></div>
				<br/>
				<table id="genderTableNo" class="table table-bordered">
					<tr>
						<th>년월&nbsp;&nbsp;</th>
						<th>남성&nbsp;&nbsp;</th>
						<th>여성</th>
					</tr>
					<c:if test="${not empty sales }">
					<c:forEach var="s" items="${sales }">
						<tr>
							<td>${s.bdDate }&nbsp;&nbsp;</td>
						<td>${s.maleSalesNo }&nbsp;&nbsp;</td>
						<td>${s.femaleSalesNo }</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty sales }">
						<tr>
							<td colspan="3">자료가 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<br/>
				<h4>-월 연령별 매출건수 추이 분석 / (단위:건)</h4>
				<div id="ageNoChart"></div>
				<br/>
				<table id="ageTableNo" class="table table-bordered">
					<tr>
						<th>년월&nbsp;&nbsp;</th>
						<th>10대&nbsp;&nbsp;</th>
						<th>20대&nbsp;&nbsp;</th>
						<th>30대&nbsp;&nbsp;</th>
						<th>40대&nbsp;&nbsp;</th>
						<th>50대&nbsp;&nbsp;</th>
						<th>60대&nbsp;&nbsp;</th>
					</tr>
					<c:if test="${not empty sales }">
					<c:forEach var="s" items="${sales }">
						<tr>
							<td>${s.bdDate }&nbsp;&nbsp;</td>
						<td>${s.teenSalesNo }&nbsp;&nbsp;</td>
						<td>${s.twentySalesNo }&nbsp;&nbsp;</td>
						<td>${s.thirtySalesNo }&nbsp;&nbsp;</td>
						<td>${s.fortySalesNo }&nbsp;&nbsp;</td>
						<td>${s.fiftySalesNo }&nbsp;&nbsp;</td>
						<td>${s.sixtySalesNo }&nbsp;&nbsp;</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty sales }">
						<tr>
							<td colspan="3">자료가 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		<!-- 상세보기 인구분석 -->
		<div role="tabpanel" class="tab-pane" id="population">
			<h2>${bd_code_name } <small>${business_type }</small></h2>
			<br/>
			<h4>-월별 총 유동인구 추이 / (단위:명)</h4>
			<div id="totalPeopleChart"></div>
			<br/>
			<table id="totalTableFolating" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
					<th>총 유동인구</th>
				</tr>
				<c:forEach var="f" items="${floating }">
				<tr>
					<td>${f.bdDate }&nbsp;&nbsp;</td>
					<td>${f.totalFloatingPopulation }</td>
				</tr>
				</c:forEach>
			</table>
			<br/>
			<h4>-월 성별 유동인구 추이 / (단위:명)</h4>
			<div id="genderFloatChart"></div>
			<br/>
			<table id="genderFloating" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
						<th>남성&nbsp;&nbsp;</th>
						<th>여성</th>
				</tr>
				<c:forEach var="f" items="${floating }">
					<tr>
							<td>${f.bdDate }&nbsp;&nbsp;</td>
						<td>${f.totalMale }&nbsp;&nbsp;</td>
						<td>${f.totalFemale }</td>
					</tr>
				</c:forEach>
			</table>
			<br/>
			<h4>-월 연령별 유동인구 추이 / (단위:명)</h4>
			<div id="ageFloatChart"></div>
			<br/>
			<table id="ageTableFloating" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
						<th>10대&nbsp;&nbsp;</th>
						<th>20대&nbsp;&nbsp;</th>
						<th>30대&nbsp;&nbsp;</th>
						<th>40대&nbsp;&nbsp;</th>
						<th>50대&nbsp;&nbsp;</th>
						<th>60대&nbsp;&nbsp;</th>
				</tr>
				<c:forEach var="f" items="${floating }">
					<tr>
							<td>${f.bdDate }&nbsp;&nbsp;</td>
						<td>${f.totalTeen }&nbsp;&nbsp;</td>
						<td>${f.totalTwenty }&nbsp;&nbsp;</td>
						<td>${f.totalThirty }&nbsp;&nbsp;</td>
						<td>${f.totalForty }&nbsp;&nbsp;</td>
						<td>${f.totalFifty }&nbsp;&nbsp;</td>
						<td>${f.totalSixty }&nbsp;&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<br/>
			<h4>-월별 총 상주인구 추이 / (단위:명)</h4>
			<div id="totalSettledChart"></div>
			<br/>
			<table id="totalTableSettled" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
					<th>총 상주인구</th>
				</tr>
				<c:forEach var="s" items="${settled }">
				<tr>
					<td>${s.bdDate }&nbsp;&nbsp;</td>
					<td>${s.totalPopulation }</td>
				</tr>
				</c:forEach>
			</table>
			<br/>
			<h4>-월 성별 상주인구 추이 / (단위:명)</h4>
			<div id="genderSettledChart"></div>
			<br/>
			<table id="genderTableSettled" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
						<th>남성&nbsp;&nbsp;</th>
						<th>여성</th>
				</tr>
				<c:forEach var="s" items="${settled }">
				<tr>
						<td>${s.bdDate }&nbsp;&nbsp;</td>
						<td>${s.totalMale }&nbsp;&nbsp;</td>
						<td>${s.totalFemale }</td>
				</tr>
				</c:forEach>
			</table>
			<br/>
			<h4>-월 연령별 상주인구 추이 / (단위:명)</h4>
			<div id="ageSettledChart"></div>
			<br/>
			<table id="ageTableSettled" class="table table-bordered">
			<tr>
				<th>년월&nbsp;&nbsp;</th>
						<th>10대&nbsp;&nbsp;</th>
						<th>20대&nbsp;&nbsp;</th>
						<th>30대&nbsp;&nbsp;</th>
						<th>40대&nbsp;&nbsp;</th>
						<th>50대&nbsp;&nbsp;</th>
						<th>60대&nbsp;&nbsp;</th>
			</tr>
			<c:forEach var="s" items="${settled }">
			<tr>
					<td>${s.bdDate }&nbsp;&nbsp;</td>
						<td>${s.totalTeen }&nbsp;&nbsp;</td>
						<td>${s.totalTwenty }&nbsp;&nbsp;</td>
						<td>${s.totalThirty }&nbsp;&nbsp;</td>
						<td>${s.totalForty }&nbsp;&nbsp;</td>
						<td>${s.totalFifty }&nbsp;&nbsp;</td>
						<td>${s.totalSixty }&nbsp;&nbsp;</td>
			</tr>
			</c:forEach>
			</table>
			<br/>
		</div>
		
		<!-- 상세보기 소득소비 -->
		<div role="tabpanel" class="tab-pane" id="io">
			<h2>${bd_code_name } <small>${business_type }</small></h2>
			<br/>
			<h4>-월 평균소득금액 및 지출총금액 / (단위:원)</h4>
			<div id="avgIncomeChart"></div>
			<br/>
			<table id="avgIncomeTable" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
					<th>평균소득금액&nbsp;&nbsp;</th>
					<th>지출총금액</th>
				</tr>
				<c:if test="${not empty io }">
				<c:forEach var="io" items="${io }">
				<tr>
					<td>${io.bdDate }&nbsp;&nbsp;</td>
					<td>${io.monthAvgIncome }&nbsp;&nbsp;</td>
					<td>${io.totalOutcome }</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty io }">
					<tr>
						<td colspan="3">자료가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<br/>
			<h4>-월 지출소비성향 / (단위:원)</h4>
			<div id="outcomeChart"></div>
			<br/>
			<table id="outcomeTable" class="table table-bordered">
				<tr>
					<th>년월&nbsp;&nbsp;</th>
					<th>식료품 지출 총 금액&nbsp;&nbsp;</th>
					<th>의류 신발 지출 총 금액&nbsp;&nbsp;</th>
					<th>생활용품 지출 총 금액&nbsp;&nbsp;</th>
					<th>의료비 지출 총 금액&nbsp;&nbsp;</th>
					<th>교통 지출 총 금액&nbsp;&nbsp;</th>
					<th>여가 지출 총 금액&nbsp;&nbsp;</th>
					<th>문화 지출 총 금액&nbsp;&nbsp;</th>
					<th>교육 지출 총 금액&nbsp;&nbsp;</th>
					<th>유흥 지출 총 금액</th>
				</tr>
				<c:if test="${not empty io }">
				<c:forEach var="io" items="${io }">
				<tr>
					<td>${io.bdDate }</td>
					<td>${io.groceryOutcome }</td>
					<td>${io.garmentOutcome }</td>
					<td>${io.necessariesOutcome }</td>
					<td>${io.medicalOutcome }</td>
					<td>${io.transportationOutcome }</td>
					<td>${io.leisureOutcome }</td>
					<td>${io.culturalOutcome }</td>
					<td>${io.educationOutcome }</td>
					<td>${io.entertainingOutcome }</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty io }">
				<tr>
					<td colspan="10">
					자료가 없습니다.
					</td>
				</tr>
				</c:if>
			</table>
		</div>
		
		</div>
	</div>
	</div>
</body>
</html>