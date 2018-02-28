$(function() {
	//서울 상권 인덱스
	zingchart.THEME="classic";
	var bdIndexDates =  [];
	var overcrowdingAvg = [];
	var indexDistrict = [];
	var bdIndex = [];
	$(indexData).each(function(index, value){
		$(indexData.bdIndex).each(function(index, value) {
			bdIndexDates.push(value.yearMonth);
			bdIndex.push(value.bdIndexList);
			for(var i in bdIndex) {
				var list = [];
				list = bdIndex[i];
				$(list).each(function(index, value) {
					//bdIndexDates.push(value.bdDate);
					overcrowdingAvg.push(value.overcrowdingAvg);
					indexDistrict.push(value.district);
				});
			}
		});
	});
	
	var func = function(a, b) {
		var list = []
		for(i=b;i<a.length;i=i+23){
			list.push(a[i]);
		}
		return list;
	}
	var ab = [1,2,3,4,5,6,7,8,9,0];
	var totalIndex = {
	    "background-color":"white",
	    "type":"line",
	    "title":{
	        "text":"서울 상권 과밀지수",
	        "fontSize": "16px",
	        "color":"#333",
	        "background-color":"white",
	        "width":"60%",
	        "text-align":"left",
	    },
		"legend":{
	        "layout":"x1",
	        "margin-top":"5%",
	        "border-width":"0",
	        "shadow":false,
	        "marker":{
	            "cursor":"hand",
	            "border-width":"0"
	        },
	        "background-color":"white",
	        "item":{
	            "cursor":"hand"
	        },
	        "toggle-action":"remove"
	    },
		"scaleX":{
	        "values":bdIndexDates,
	        "step":1,
	        "max-items":8
		},
		"scaleY":{
			"values": "47:54:0.5",
	        "line-color":"#333"
		},
	    "tooltip":{
	        "text":"%t: %v outbreaks in %k"
	    },
		"plot":{
	        "line-width":3,
	        "marker":{
	            "size":2
	        },
	        "selection-mode":"multiple",
	        "background-mode":"graph",
	        "selected-state":{
	            "line-width":4
	        },
	        "background-state":{
	            "line-color":"#eee",
	            "marker":{
	                "background-color":"none"
	            }
	        }
		},
	    "plotarea":{
	        "margin":"15% 25% 10% 7%"
	    },
		"series":[
	        {
	            "values":func(overcrowdingAvg, 0),
	            "text":indexDistrict[0],
	            "line-color":"#a6cee3",
	            "marker":{
	                "background-color":"#a6cee3",
	                "border-color":"#a6cee3"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 1),
	            "text":indexDistrict[1],
	            "line-color":"#1f78b4",
	            "marker":{
	                "background-color":"#1f78b4",
	                "border-color":"#1f78b4"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 2),
	            "text":indexDistrict[2],
	            "line-color":"#b2df8a",
	            "marker":{
	                "background-color":"#b2df8a",
	                "border-color":"#b2df8a"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 3),
	            "text":indexDistrict[3],
	            "line-color":"#33a02c",
	            "marker":{
	                "background-color":"#33a02c",
	                "border-color":"#33a02c"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 4),
	            "text":indexDistrict[4],
	            "line-color":"#fb9a99",
	            "marker":{
	                "background-color":"#fb9a99",
	                "border-color":"#fb9a99"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 5),
	            "text":indexDistrict[5],
	            "line-color":"#e31a1c",
	            "marker":{
	                "background-color":"#e31a1c",
	                "border-color":"#e31a1c"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 6),
	            "text":indexDistrict[6],
	            "line-color":"#fdbf6f",
	            "marker":{
	                "background-color":"#fdbf6f",
	                "border-color":"#fdbf6f"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 7),
	            "text":indexDistrict[7],
	            "line-color":"#ff7f00",
	            "marker":{
	                "background-color":"#ff7f00",
	                "border-color":"#ff7f00"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 8),
	            "text":indexDistrict[8],
	            "line-color":"#cab2d6",
	            "marker":{
	                "background-color":"#cab2d6",
	                "border-color":"#cab2d6"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 9),
	            "text":indexDistrict[9],
	            "line-color":"#ffff99",
	            "marker":{
	                "background-color":"#ffff99",
	                "border-color":"#ffff99"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 10),
	            "text":indexDistrict[10],
	            "line-color":"#6a3d9a",
	            "marker":{
	                "background-color":"#6a3d9a",
	                "border-color":"#6a3d9a"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 11),
	            "text":indexDistrict[11],
	            "line-color":"#b15928",
	            "marker":{
	                "background-color":"#b15928",
	                "border-color":"#b15928"
	            }
	        },
	        {
	            "values":func(overcrowdingAvg, 12),
	            "text":indexDistrict[12]
	        },
	        {
	            "values":func(overcrowdingAvg, 13),
	            "text":indexDistrict[13]
	        },
	        {
	            "values":func(overcrowdingAvg, 14),
	            "text":indexDistrict[14]
	        },
	        {
	            "values":func(overcrowdingAvg, 15),
	            "text":indexDistrict[15]
	        },
	        {
	            "values":func(overcrowdingAvg, 16),
	            "text":indexDistrict[16]
	        },
	        {
	            "values":func(overcrowdingAvg, 17),
	            "text":indexDistrict[17]
	        },
	        {
	            "values":func(overcrowdingAvg, 18),
	            "text":indexDistrict[18]
	        },
	        {
	            "values":func(overcrowdingAvg, 19),
	            "text":indexDistrict[19]
	        },
	        {
	            "values":func(overcrowdingAvg, 20),
	            "text":indexDistrict[20]
	        },
	        {
	            "values":func(overcrowdingAvg, 21),
	            "text":indexDistrict[21]
	        },
	        {
	            "values":func(overcrowdingAvg, 22),
	            "text":indexDistrict[22]
	        }
		]
	};

	zingchart.render({ 
		id : 'totalIndex', 
		data : totalIndex, 
		height: 540, 
		width: 545 
	});
	

	
	//서울 상권 위험도 차트
	var avgRiskIndex = $("#dangerChart").data("avg");
	var dangerChart = {
		"graphset" : [ {
			"type" : "gauge",
			"background-color" : "white",
			"plot" : {
				"background-color" : "#666"
			},
			// 차트의 title 정보
			"title" : {
				"fontColor" : "black",
				"text" :'서울 전체 상권 위험지수',
				"align" : "left",
				"offsetX" : 10,
				"fontFamily" : "Open Sans",
				"fontSize" : 20,
				"background-color" :"white"
			},
			"plotarea" : {
				"margin" : "60 80 30 80"
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
		height : 540,
		width : 545
	});
	
	
	//상권 상주인구 차트
	var bdSettledPopulationDates =  $(populationDates.bdDate);
	var totalpopulations = [];
	var malepopulations = [];
	var femalepopulations = [];
	$(populationDates).each(function(index, value) {
		$(populationDates.bdSettledPopulation).each(function(index, value) {
			totalpopulations.push(value.totalpopulation);
			malepopulations.push(value.totalmale);
			femalepopulations.push(value.totalfemale);
		});
	});
	var bdSettledPopulationChart = 
	        {
	            "type": "line",
	            "background-color": "#003849",
	            "utc": true,
	            "title": {
	                "y": "7px",
	                "text": "서울 상권 상주인구",
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
	                "values": 
	                		bdSettledPopulationDates,
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
	                "values": "0:2000000:300000",
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
	                    "values": 
	                    		totalpopulations,
	                    "text": "Total Population",
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
	                    "values": 
	                       malepopulations,
	                    "text": "Total Male",
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
	                    "values": 
	                    		femalepopulations,
	                    "text": "Total Female",
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
		data : bdSettledPopulationChart, 
		height: 540, 
		width: 545 
	}); 
	
	
})

	
