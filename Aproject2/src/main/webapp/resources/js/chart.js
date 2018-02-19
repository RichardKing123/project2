$(function() {
	var myConfig = {
			type : "pie",
			backgroundColor : "#2B313B",
			plot : {
				borderColor : "#2B313B",
				borderWidth : 5,
				// slice: 90,
				valueBox : {
					placement : 'out',
					text : '%t\n%npv%',
					fontFamily : "Open Sans"
				},
				tooltip : {
					fontSize : '18',
					fontFamily : "Open Sans",
					padding : "5 10",
					text : "%npv%"
				},
				animation : {
					effect : 2,
					method : 5,
					speed : 500,
					sequence : 1
				}
			},
			source : {
				text : 'gs.statcounter.com',
				fontColor : "#8e99a9",
				fontFamily : "Open Sans"
			},
			// 차트의 title 정보
			title : {
				fontColor : "#fff",
				text : '상권 아파트 정보',
				align : "left",
				offsetX : 10,
				fontFamily : "Open Sans",
				fontSize : 25
			},
			// 차트의 subtitle 정보(text쪽에서 부제목  동적으로 변하게?)
			subtitle : {
				offsetX : 10,
				offsetY : 10,
				fontColor : "#8e99a9",
				fontFamily : "Open Sans",
				fontSize : "16",
				text : 'May 2016',
				align : "left"
			},
			plotarea : {
				margin : "20 0 0 0"
			},
			// 각 데이터의 정보를 json방식으로 받는 곳(반복문으로 돌려서 정보 받아야 할 듯)
			series : [ {
				values : [ 11.38 ],
				text : "Internet Explorer",
				backgroundColor : '#50ADF5',
			}, {
				values : [ 56.94 ],
				text : "Chrome",
				backgroundColor : '#FF7965'
			}, {
				values : [ 14.52 ],
				text : 'Firefox',
				backgroundColor : '#FFCB45'
			}, {
				text : 'Safari',
				values : [ 9.69 ],
				backgroundColor : '#6877e5'
			}, {
				text : 'Other',
				values : [ 7.48 ],
				backgroundColor : '#6FB07F'
			} ]
		};
		// chart 사이즈 조설하는 곳
		zingchart.render({
			id : 'myChart',
			data : myConfig,
			height : 410,
			width : 545
		});

	
})
