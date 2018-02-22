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

<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9",
			"ee6b7db5b51705a13dc2339db3edaf6d"];</script>
<script>
$(function() {
	
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
		
});
</script>			

<title>검색 상세페이지</title>
</head>
<body>
<div id="container">
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
			
		</ul>
		<!-- 개업률 폐업률 -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
			<h2>-${bd_code_name }/${business_type }</h2>
			<br/>
			<h4>-개업률 및 폐업률</h4>
			<div id="shopChart"></div>
			<br/>
				<table id="shop_number">
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
				<h2>-${bd_code_name }/${business_type }</h2>
				<br/>
				<h4>-월 성별 매출금액 추이 분석 / (단위:천원)</h4>
				<div id="genderVolumeChart"></div>
				<br/>
				
				<table id="genderTableVolume">
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
				<h4>-월 연령별 매출금액 추이 분석 / (단위:천원)</h4>
				<div id="ageVolumeChart"></div>
				<br/>
				<table id="ageTableVolume">
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
				<table id="genderTableNo">
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
				<table id="ageTableNo">
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
			<h2>-${bd_code_name }/${business_type }</h2>
			<br/>
			<h4>-월별 총 유동인구 추이 / (단위:명)</h4>
			<table id="totalTableFolating">
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
			<table id="genderFloating">
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
			<table id="ageTableFloating">
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
			<table id="totalTableSettled">
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
			<table id="genderTableSettled">
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
			<table id="ageTableSettled">
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
		
		</div>
	</div>
	</div>
</body>
</html>