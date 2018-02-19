$(function() {
	//파이차트
	var pieChart = {
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
		// 차트의 subtitle 정보(text쪽에서 부제목 동적으로 변하게?)
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
		id : 'pieChart',
		data : pieChart,
		height : 410,
		width : 545
	});

	
	//위험도 차트
	zingchart.THEME = "classic";
	var avgRiskIndex = document.getElementById("dangerChart");
	var dangerChart = {
		"graphset" : [ {
			"type" : "gauge",
			"background-color" : "#fff #eee",
			"plot" : {
				"background-color" : "#666"
			},
			"plotarea" : {
				"margin" : "0 0 0 0"
			},
			"scale" : {
				"size-factor" : 1.25,
				"offset-y" : 120
			},
			"tooltip" : {
				"background-color" : "black"
			},
			"scale-r" : {
				"values" : "30:70:1",
				"border-color" : "#b3b3b3",
				"border-width" : "2",
				"background-color" : "#eeeeee,#b3b3b3",
				"ring" : {
					"size" : 20,
					"offset-r" : "130px",
					"rules" : [ {
						"rule" : "%v >=30 && %v < 40",
						"background-color" : "#348D00"
					}, {
						"rule" : "%v >= 40 && %v < 51",
						"background-color" : "#B1AD00"
					}, {
						"rule" : "%v >= 51 && %v < 60",
						"background-color" : "#EC7928"
					}, {
						"rule" : "%v >= 60",
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
				"text" : "고위험",
				"backgroundColor" : "#FB0A02",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#ea0901",
					"text" : "위험지수 60 이상",
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
				"text" : "위험",
				"backgroundColor" : "#EC7928",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#da6817",
					"text" : "위험지수 51이상 60미만",
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
				"text" : "의심",
				"backgroundColor" : "#B1AD00",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#e9b000",
					"text" : "위험지수 40이상 51미만",
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
				"text" : "주의",
				"backgroundColor" : "#348D00",
				"tooltip" : {
					"padding" : 10,
					"backgroundColor" : "#237b00",
					"text" : "위험지수 40미만",
					"shadow" : 0
				}
			} ],
			"series" : [ {
				"values" : [ avgRiskIndex.dataset.avg ],
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
		id : 'dangerChart',
		data : dangerChart,
		height : 410,
		width : 545
	});

})
