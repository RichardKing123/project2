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
	var avgRiskIndex = $("#dangerChart").data("avg");
	var dangerChart = {
		"graphset" : [ {
			"type" : "gauge",
			"background-color" : "#fff #eee",
			"plot" : {
				"background-color" : "#666"
			},
			// 차트의 title 정보
			"title" : {
				"fontColor" : "#fff",
				"text" :'서울 전체 상권 위험지수',
				"align" : "left",
				"offsetX" : 10,
				"fontFamily" : "Open Sans",
				"fontSize" : 20,
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
				"values" : [ avgRiskIndex ],
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
	
	
	//상권 상주인구 차트
	zingchart.THEME="classic";
	var bdSettledPopulation = 
	        {
	            "type": "line",
	            "background-color": "#003849",
	            "utc": true,
	            "title": {
	                "y": "7px",
	                "text": "상권 상주인구",
	                "background-color": "#003849",
	                "font-size": "24px",
	                "font-color": "white",
	                "height": "25px"
	            },
	            "plotarea": {
	                "margin": "20% 8% 14% 12%",
	                "background-color": "#003849"
	            },
	            "legend": {
	                "layout": "float",
	                "background-color": "none",
	                "border-width": 0,
	                "shadow": 0,
	                "width":"75%",
	                "text-align":"middle",
	                "x":"25%",
	                "y":"10%",
	                "item": {
	                    "font-color": "#f6f7f8",
	                    "font-size": "14px"
	                }
	            },
	            "scale-x": {
	                "values": [
	                	201401,201402,201403,201404,
	                    201405,201406,201407,201408,201409,201410,
	                    201411,201412,201501,201502,201503,201504,201505,
	                    201506,201507,201508,201509,201510,201511,201512,
	                    201601,201602,201603,201604,201605,201606,201607,
	                    201608,201609,201610,201611,201612,201701,201702,
	                    201703,201704,201705,201706,201707,201708
	                ],
	                "shadow": 0,
	                "step": 1,
	                "line-color": "#f6f7f8",
	                "tick": {
	                    "line-color": "#f6f7f8"
	                },
	                "guide": {
	                    "line-color": "#f6f7f8"
	                },
	                "item": {
	                    "font-color": "#f6f7f8"
	                },
	                "transform": {
	                    "guide": {
	                        "visible": false
	                    },
	                    "item": {
	                        "visible": false
	                    }
	                },
	                "label": {
	                    "visible": false
	                },
	                "minor-ticks": 0
	            },
	            "scale-y": {
	                "values": "0:9000:3000",
	                "line-color": "#f6f7f8",
	                "shadow": 0,
	                "tick": {
	                    "line-color": "#f6f7f8"
	                },
	                "guide": {
	                    "line-color": "#f6f7f8",
	                    "line-style": "dashed"
	                },
	                "item": {
	                    "font-color": "#f6f7f8"
	                },
	                "label": {
	                    "text": "Page Views",
	                    "font-color": "#f6f7f8"
	                },
	                "minor-ticks": 0,
	                "thousands-separator": ","
	            },
	            "crosshair-x": {
	                "line-color": "#f6f7f8",
	                "plot-label": {
	                    "border-radius": "5px",
	                    "border-width": "1px",
	                    "border-color": "#f6f7f8",
	                    "padding": "10px",
	                    "font-weight": "bold"
	                },
	                "scale-label": {
	                    "font-color": "#00baf0",
	                    "background-color": "#f6f7f8",
	                    "border-radius": "5px"
	                }
	            },
	            "tooltip": {
	                "visible": false
	            },
	            "plot": {
	                "tooltip-text": "%t views: %v<br>%k",
	                "shadow": 0,
	                "line-width": "3px",
	                "marker": {
	                    "type": "circle",
	                    "size": 3
	                },
	                "hover-marker": {
	                    "type": "circle",
	                    "size": 4,
	                    "border-width": "1px"
	                }
	            },
	            "series": [
	                {
	                    "values": [
	                        149.2,
	                        174.3,
	                        187.7,
	                        147.1,
	                        129.6,
	                        189.6,
	                        230,
	                        164.5,
	                        171.7,
	                        163.4,
	                        194.5,
	                        200.1,
	                        193.4,
	                        254.4,
	                        287.8,
	                        246,
	                        199.9,
	                        218.3,
	                        244,
	                        312.2,
	                        284.5,
	                        249.2,
	                        305.2,
	                        286.1,
	                        347.7,
	                        278,
	                        240.3,
	                        212.4,
	                        237.1,
	                        253.2,
	                        186.1,
	                        153.6,
	                        168.5,
	                        140.9,
	                        86.9,
	                        49.4,
	                        24.7,
	                        64.8,
	                        114.4,
	                        137.4
	                    ],
	                    "text": "Pricing",
	                    "line-color": "#007790",
	                    "legend-marker": {
	                        "type": "circle",
	                        "size": 5,
	                        "background-color": "#007790",
	                        "border-width": 1,
	                        "shadow": 0,
	                        "border-color": "#69dbf1"
	                    },
	                    "marker": {
	                        "background-color": "#007790",
	                        "border-width": 1,
	                        "shadow": 0,
	                        "border-color": "#69dbf1"
	                    }
	                },
	                {
	                    "values": [
	                        714.6,
	                        656.3,
	                        660.6,
	                        729.8,
	                        731.6,
	                        682.3,
	                        654.6,
	                        673.5,
	                        700.6,
	                        755.2,
	                        817.8,
	                        809.1,
	                        815.2,
	                        836.6,
	                        897.3,
	                        896.9,
	                        866.5,
	                        835.8,
	                        797.9,
	                        784.7,
	                        802.8,
	                        749.3,
	                        722.1,
	                        688.1,
	                        730.4,
	                        661.5,
	                        609.7,
	                        630.2,
	                        633,
	                        604.2,
	                        558.1,
	                        581.4,
	                        511.5,
	                        556.5,
	                        542.1,
	                        599.7,
	                        664.8,
	                        725.3,
	                        694.2,
	                        690.5
	                    ],
	                    "text": "Documentation",
	                    "line-color": "#009872",
	                    "legend-marker": {
	                        "type": "circle",
	                        "size": 5,
	                        "background-color": "#009872",
	                        "border-width": 1,
	                        "shadow": 0,
	                        "border-color": "#69f2d0"
	                    },
	                    "marker": {
	                        "background-color": "#009872",
	                        "border-width": 1,
	                        "shadow": 0,
	                        "border-color": "#69f2d0"
	                    }
	                },
	                {
	                    "values": [
	                        536.9,
	                        576.4,
	                        639.3,
	                        669.4,
	                        708.7,
	                        691.5,
	                        681.7,
	                        673,
	                        701.8,
	                        636.4,
	                        637.8,
	                        640.5,
	                        653.1,
	                        613.7,
	                        583.4,
	                        538,
	                        506.7,
	                        563.1,
	                        541.4,
	                        489.3,
	                        434.7,
	                        442.1,
	                        482.3,
	                        495.4,
	                        556.1,
	                        505.4,
	                        463.8,
	                        434.7,
	                        377.4,
	                        325.4,
	                        351.7,
	                        343.5,
	                        333.2,
	                        332,
	                        378.9,
	                        415.4,
	                        385,
	                        412.6,
	                        445.9,
	                        441.5
	                    ],
	                    "text": "Support",
	                    "line-color": "#da534d",
	                    "legend-marker": {
	                        "type": "circle",
	                        "size": 5,
	                        "background-color": "#da534d",
	                        "border-width": 1,
	                        "shadow": 0,
	                        "border-color": "#faa39f"
	                    },
	                    "marker": {
	                        "background-color": "#da534d",
	                        "border-width": 1,
	                        "shadow": 0,
	                        "border-color": "#faa39f"
	                    }
	                }
	            ]
	        };

	zingchart.render({ 
		id : 'bdSettledPopulation', 
		data : bdSettledPopulation, 
		height: 500, 
		width: 725 
	});
	
	
})

