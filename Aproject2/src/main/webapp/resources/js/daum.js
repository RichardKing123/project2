$(document).ready(function(){	
/*
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.509525, 126.981482), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };	
	*/
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
	        fillColor: 'transparent',
	        fillOpacity: 0.7 
	    });
	
	    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
	    daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
	        polygon.setOptions({fillColor: 'pink'});
	
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
	        polygon.setOptions({fillColor:'transparent'});
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

