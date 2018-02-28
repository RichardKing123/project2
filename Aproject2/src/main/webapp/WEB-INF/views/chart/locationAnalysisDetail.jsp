<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1be91db11f8253de94c8895a7e92d8d"></script>
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script>
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = [ "569d52cefae586f634c54f86dc99e6a9",
			"ee6b7db5b51705a13dc2339db3edaf6d" ];
</script>
<script src="resources/js/locationAnalysis.js"></script>
<script>
	var stability = ${stabilityIndex};
	var shopNo = ${shopNo};
	var shopRadar = ${shopRadar};
	var datas = ${polygonList};
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
</script>
<article>
	<div id="container" class="searchDetailDG">
		<div role="tabpanel">
			<!-- 개업률 폐업률 -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">
					<h2>${district } ${bdCodeName }
						<small>${businessType }</small>
					</h2>
					<br />
					<div id="map3" style="width: 400px; height: 400px;"></div>
					<br />
					<h4>상권안정도</h4>
					<br />
					<div id='stability'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
					<br />
					<h4>상권 점포 수</h4>
					<br />
					<div id='noOfShop'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
					<h4>해당 지역의 각 업종 수</h4>
					<br />
					<div id='shopRadar'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
				</div>
			</div>
		</div>
	</div>
</article>