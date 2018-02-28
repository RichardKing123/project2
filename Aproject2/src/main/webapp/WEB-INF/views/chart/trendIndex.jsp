<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리, 부트스트랩 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/chart.css" />
<script type="text/javascript" src="resources/js/trendIndex.js"></script>
<!-- 다음 지도 출력 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1be91db11f8253de94c8895a7e92d8d"></script>
<script src="resources/js/daum.js"></script>
<!-- 징차트 라이브러리 -->
<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9",
			"ee6b7db5b51705a13dc2339db3edaf6d"];</script>
<script type="text/javascript">
var bdApt = ${bdApt};
var bdFacilities = ${bdFacilities};
var floatingPopulation = ${bdFloatingPopulation};
var oneBdSettled = ${oneBdSettled};
var totalIndex = ${totalIndex};
var estimatedSales = ${estimatedSales};
var datas = ${polygonList};
</script>
<title>동향지표</title>
</head>
<body>
<div class="center">
    <div class="left">
      <div class="map">
        <h2 id="map_title">서울특별시</h2>
        <div id="map" style="width: 498px; height: 470px;"></div>
      </div>

      <div class="sales">
      	<span id="contain1-title" class="first">요일별 추정매출</span>
        <div class="line_2"></div>
        <div id='estimatedSales'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
      
      <div class="floating">
      <span id="contain1-title" class="first">서울시 유동인구</span>
        <div class="line_2"></div>
        <div id='bdFloatingPopulation'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
      
    </div>
    
    <div class="right">
      <h1 id="standard_date" class="title_1">동향자료분석</h1>
		<div class="apt">
		  <span id="contain1-title" class="first">아파트 가격 변화</span>            
		  <div class="line_3"></div>            
		  <div id="contain_1" class="m_contain">
		    <div id='bdApt'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
		  </div>
		</div>
        <div class="facilities">
          <span id="contain3-title" class="first">상권 집객시설</span>
          <div class="line_3"></div>
          <div id="contain_3" class="m_contain">
          	<div id='bdFacilities'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
          </div>
        </div>
        <div class="totalIndex">
          <span id="contain3-title" class="first">지수지표</span>
          <div class="line_3"></div>
          <div id="contain_3" class="m_contain">
          	<div id='totalIndex'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
          </div>
        </div>
    </div>
</div>
</body>
</html>