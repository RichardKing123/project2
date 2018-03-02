$(function() {
	// 서울 아파트 날짜별 평균
	zingchart.THEME = "classic";
	var aptDate = [];
	var aptAvg = [];
	$(bdApt).each(function(index, value) {
		aptDate.push(value.bd_date);
		aptAvg.push(value.avgPrice);
	});
	var bdApt1 = {
		"type" : "bullet",
		"background-color" : "white",
		"title" : {
			"text" : "서울 아파트 평균 가격　변화",
			"background-color" : "none",
			"color" : "#333"
		},
		"plotarea" : {

		},
		"scaleX" : {
			"guide" : {
				"visible" : false
			},
			"values" : aptDate,
			"tick" : {
				"line-color" : "#333"
			},
			"line-color" : "#666",
			"item" : {
				"wrapText" : true,
				"color" : "#333"
			}
		},
		"scaleY" : {
			"tick" : {
				"line-color" : "#333"
			},
			"line-color" : "#333",
			"guide" : {
				"lineStyle" : "solid"
			},
			"item" : {
				"wrapText" : true,
				"color" : "#333"
			},
			"short" : true,
			"thousands-separator" : ","
		},
		"plot" : {
			"styles" : [ {
				"background-color" : "#87E1FF",
				"alpha" : 0.7
			}, {
				"background-color" : "#008cba",
				"alpha" : 0.7
			}, {
				"background-color" : "#00526D",
				"alpha" : 0.7
			}, {
				"background-color" : "black",
				"alpha" : 0.7
			}, {
				"background-color" : "dimgray",
				"alpha" : 0.7
			}, {
				"background-color" : "gray",
				"alpha" : 0.7
			}, {
				"background-color" : "dodgerblue",
				"alpha" : 0.7
			}, {
				"background-color" : "slategray",
				"alpha" : 0.7
			}, {
				"background-color" : "royalblue",
				"alpha" : 0.7
			}, {
				"background-color" : "lightstategray",
				"alpha" : 0.7
			}, {
				"background-color" : "midnightblue",
				"alpha" : 0.7
			}, {
				"background-color" : "olive",
				"alpha" : 0.7
			}, {
				"background-color" : "oliverdrab",
				"alpha" : 0.7
			}, {
				"background-color" : "yellogreen",
				"alpha" : 0.7
			}, {
				"background-color" : "darkolivegreen",
				"alpha" : 0.7
			}, {
				"background-color" : "magenta",
				"alpha" : 0.7
			}, {
				"background-color" : "palevioletred",
				"alpha" : 0.7
			}, {
				"background-color" : "yello",
				"alpha" : 0.7
			}, {
				"background-color" : "turquoise",
				"alpha" : 0.7
			}, {
				"background-color" : "firebrick",
				"alpha" : 0.7
			}, {
				"background-color" : "cyan",
				"alpha" : 0.7
			}, {
				"background-color" : "fuchsia",
				"alpha" : 0.7
			}, {
				"background-color" : "steelblue",
				"alpha" : 0.7
			}, {
				"background-color" : "deepskyblue",
				"alpha" : 0.7
			}, {
				"background-color" : "deeppink",
				"alpha" : 0.7
			}, {
				"background-color" : "lime",
				"alpha" : 0.7
			}, {
				"background-color" : "indianred",
				"alpha" : 0.7
			}, {
				"background-color" : "forestgreen",
				"alpha" : 0.7
			}, {
				"background-color" : "darkorange",
				"alpha" : 0.7
			}, {
				"background-color" : "blue",
				"alpha" : 0.7
			}, {
				"background-color" : "red",
				"alpha" : 0.7
			}, {
				"background-color" : "darkseagreen",
				"alpha" : 0.7
			}, {
				"background-color" : "purple",
				"alpha" : 0.7
			}, {
				"background-color" : "teal",
				"alpha" : 0.7
			}, {
				"background-color" : "orchid",
				"alpha" : 0.7
			}, {
				"background-color" : "silver",
				"alpha" : 0.7
			}, {
				"background-color" : "gold",
				"alpha" : 0.7
			}, {
				"background-color" : "springgreen",
				"alpha" : 0.7
			}, {
				"background-color" : "saddlebrown",
				"alpha" : 0.7
			}, {
				"background-color" : "green",
				"alpha" : 0.7
			}, {
				"background-color" : "black",
				"alpha" : 0.7
			}, {
				"background-color" : "brown",
				"alpha" : 0.7
			}, {
				"background-color" : "maroon",
				"alpha" : 0.7
			}, {
				"background-color" : "crimson",
				"alpha" : 0.7
			} ]

		},
		"series" : [ {
			"values" : aptAvg,
			"hover-state" : {
				"styles" : [ {
					"alpha" : 0.7,
					"background-color" : "#87E1FF"
				}, {
					"alpha" : 0.7,
					"background-color" : "#008cba"
				}, {
					"alpha" : 0.7,
					"background-color" : "#00526D"
				},{
					"background-color" : "black",
					"alpha" : 0.7
				}, {
					"background-color" : "dimgray",
					"alpha" : 0.7
				}, {
					"background-color" : "gray",
					"alpha" : 0.7
				}, {
					"background-color" : "dodgerblue",
					"alpha" : 0.7
				}, {
					"background-color" : "slategray",
					"alpha" : 0.7
				}, {
					"background-color" : "royalblue",
					"alpha" : 0.7
				}, {
					"background-color" : "lightstategray",
					"alpha" : 0.7
				}, {
					"background-color" : "midnightblue",
					"alpha" : 0.7
				}, {
					"background-color" : "olive",
					"alpha" : 0.7
				}, {
					"background-color" : "oliverdrab",
					"alpha" : 0.7
				}, {
					"background-color" : "yellogreen",
					"alpha" : 0.7
				}, {
					"background-color" : "darkolivegreen",
					"alpha" : 0.7
				}, {
					"background-color" : "magenta",
					"alpha" : 0.7
				}, {
					"background-color" : "palevioletred",
					"alpha" : 0.7
				}, {
					"background-color" : "yello",
					"alpha" : 0.7
				}, {
					"background-color" : "turquoise",
					"alpha" : 0.7
				}, {
					"background-color" : "firebrick",
					"alpha" : 0.7
				}, {
					"background-color" : "cyan",
					"alpha" : 0.7
				}, {
					"background-color" : "fuchsia",
					"alpha" : 0.7
				}, {
					"background-color" : "steelblue",
					"alpha" : 0.7
				}, {
					"background-color" : "deepskyblue",
					"alpha" : 0.7
				}, {
					"background-color" : "deeppink",
					"alpha" : 0.7
				}, {
					"background-color" : "lime",
					"alpha" : 0.7
				}, {
					"background-color" : "indianred",
					"alpha" : 0.7
				}, {
					"background-color" : "forestgreen",
					"alpha" : 0.7
				}, {
					"background-color" : "darkorange",
					"alpha" : 0.7
				}, {
					"background-color" : "blue",
					"alpha" : 0.7
				}, {
					"background-color" : "red",
					"alpha" : 0.7
				}, {
					"background-color" : "darkseagreen",
					"alpha" : 0.7
				}, {
					"background-color" : "purple",
					"alpha" : 0.7
				}, {
					"background-color" : "teal",
					"alpha" : 0.7
				}, {
					"background-color" : "orchid",
					"alpha" : 0.7
				}, {
					"background-color" : "silver",
					"alpha" : 0.7
				}, {
					"background-color" : "gold",
					"alpha" : 0.7
				}, {
					"background-color" : "springgreen",
					"alpha" : 0.7
				}, {
					"background-color" : "saddlebrown",
					"alpha" : 0.7
				}, {
					"background-color" : "green",
					"alpha" : 0.7
				}, {
					"background-color" : "black",
					"alpha" : 0.7
				}, {
					"background-color" : "brown",
					"alpha" : 0.7
				}, {
					"background-color" : "maroon",
					"alpha" : 0.7
				}, {
					"background-color" : "crimson",
					"alpha" : 0.7
				}
				]
			},
		} ]
	};

	zingchart.render({
		id : 'bdApt',
		data : bdApt1,
		height : 472,
		width : 521
	});
	
	
	
	//상권 집객시설 정보(상권 매출 상위 6개만 출력)
	var totalFacilities = [];
	var supermarket = [];
	var subwaystation = [];
	var bank = [];
	var busStop = [];
	var accomodation = [];
	var office = [];
	var district = [];
	$(bdFacilities).each(function(index, value) {
		totalFacilities.push(value.total);
		supermarket.push(value.supermarket);
		subwaystation.push(value.subwaystation);
		bank.push(value.bank);
		busStop.push(value.busstop);
		accomodation.push(value.accomodation);
		office.push(value.office);
		district.push(value.district);
	});
	var	bdFacilities1 = {
	    "graphset": [
	        {
	            "type": "bar",
	            "background-color": "white",
	            "title": {
	                "font-color": "#7E7E7E",
	                "backgroundColor": "none",
	                "font-size": "22px",
	                "alpha": 1,
	                "y": "15px",
	                "x": "15px"
	            },
	            "tooltip": {
	                "text": "%v"
	            },
	            "plotarea": {
	                "margin": "80 60 100 60",
	                "y": "125px"
	            },
	            "legend": {
	                "layout": "x3",
	                "y": "13%",
	                "x": "34.5%",
	                "overflow": "page",
	                "alpha": 0.05,
	                "shadow": false,
	                "marker": {
	                    "type": "circle",
	                    "border-color": "none",
	                    "size": "10px"
	                },
	                "border-width": 0,
	                "maxItems": 3,
	                "toggle-action": "remove",
	                "pageOn": {
	                    "backgroundColor": "#000",
	                    "size": "10px",
	                    "alpha": 0.65
	                },
	                "pageOff": {
	                    "backgroundColor": "#7E7E7E",
	                    "size": "10px",
	                    "alpha": 0.65
	                },
	                "pageStatus": {
	                    "color": "black"
	                }
	            },
	            "plot": {
	                "animation": {
	                    "effect": "ANIMATION_SLIDE_BOTTOM"
	                }
	            },
	            "scale-x": {
	                "line-color": "#7E7E7E",
	                "labels": [
	                    "총합",
	                    "슈퍼",
	                    "지하철",
	                    "은행",
	                    "버스정류장",
	                    "숙박시설",
	                    "공공기관",
	                ],
	                "item": {
	                    "font-color": "#7e7e7e"
	                },
	                "guide": {
	                    "visible": false
	                }
	            },
	            "scale-y": {
	                "line-color": "#7E7E7E",
	                "item": {
	                    "font-color": "#7e7e7e"
	                },
	                "values": "0:11:1",
	                "guide": {
	                    "visible": true
	                },
	                "label": {
	                  "text": "no",
	                  "font-family": "arial",
	                  "font-angle":0,
	                  "bold": true,
	                  "font-size": "14px",
	                  "font-color": "#7E7E7E",
	                  "offset-y":"-190px",
	                  "offset-x":"20px"
	            },
	            },
	            "series": [
	                {
	                    "values": [
	                        totalFacilities[0],
	                        supermarket[0],
	                        subwaystation[0],
	                        bank[0],
	                        busStop[0],
	                        accomodation[0],
	                        office[0]
	                    ],
	                    "alpha": 0.95,
	                    "borderRadiusTopLeft": 7,
	                    "background-color": "#8993c7",
	                    "text": district[0]
	                },
	                {
	                    "values": [
	                    		totalFacilities[18],
	                        supermarket[18],
	                        subwaystation[18],
	                        bank[18],
	                        busStop[18],
	                        accomodation[18],
	                        office[18]
	                    ],
	                    "borderRadiusTopLeft": 7,
	                    "alpha": 0.95,
	                    "background-color": "#fdb462",
	                    "text": district[18]
	                },
	                {
	                    "values": [
	                    		totalFacilities[11],
	                        supermarket[11],
	                        subwaystation[11],
	                        bank[11],
	                        busStop[11],
	                        accomodation[11],
	                        office[11]
	                    ],
	                    "alpha": 0.95,
	                    "borderRadiusTopLeft": 7,
	                    "background-color": "#8dd3c7",
	                    "text": district[11]
	                },
	                {
	                    "values": [
	                    		totalFacilities[13],
	                        supermarket[13],
	                        subwaystation[13],
	                        bank[13],
	                        busStop[13],
	                        accomodation[13],
	                        office[13]
	                    ],
	                    "borderRadiusTopLeft": 7,
	                    "alpha": 0.95,
	                    "background-color": "#fb8072",
	                    "text": district[13]
	                },
	                {
	                    "values": [
	                    		totalFacilities[20],
	                        supermarket[20],
	                        subwaystation[20],
	                        bank[20],
	                        busStop[20],
	                        accomodation[20],
	                        office[20]
	                    ],
	                    "borderRadiusTopLeft": 7,
	                    "alpha": 0.95,
	                    "background-color": "#80b1d3",
	                    "text": district[20]
	                },
	                {
	                    "values": [
	                    		totalFacilities[7],
	                        supermarket[7],
	                        subwaystation[7],
	                        bank[7],
	                        busStop[7],
	                        accomodation[7],
	                        office[7]
	                    ],
	                    "borderRadiusTopLeft": 7,
	                    "alpha": 0.95,
	                    "background-color": "#b3de69",
	                    "text": district[7]
	                }
	            ]
	        }
	    ]
	};

	zingchart.render({ 
		id : 'bdFacilities', 
		data : bdFacilities1, 
		height: 472, 
		width: 521 
	});
	
	
	//서울시 날짜별 추정유동인구(총합, 남자, 여자)
	var fpBdDate = [];
	var totalFloatingPopulation = [];
	var floatingMale = [];
	var floatingFemale = [];
	$(floatingPopulation).each(function(index, value){
		fpBdDate.push(value.bd_date);
		totalFloatingPopulation.push(value.total);
		floatingMale.push(value.male);
		floatingFemale.push(value.female);
	});
	
	//서울 가장 최근의 상주인구(총합, 남자, 여자)
	var settledTotal = oneBdSettled[0].total;
	var settledMale = oneBdSettled[0].male;
	var settledFemale = oneBdSettled[0].female;	
	var bdFloatingPopulation = {
	"background-color":"white",
	"globals": {
	  "font-family":"Arial",
	  "font-weight":"normal"
	},
	"graphset":[
	    {
	        "type":"null",
	        "x":"2.25%",
	        "y":"1%",
	        "background-color":"none",
	        "title":{
	            "text":"서울시 유동인구",
	            "text-align":"left",
	            "font-size":"14px",
	            "font-color":"black",
	            "background-color":"none"
	        }
	    },
	    {
	        "type":"null",
	        "x":"73.75%",
	        "y":"1%",
	        "background-color":"none",
	        "title":{
	            "text":"Last Sync: Yesterday",
	            "text-align":"right",
	            "font-size":"11px",
	            "font-color":"#f4f4f4",
	            "background-color":"none"
	        }
	    },
	    {
	        "type":"pie",
	        "height":"40%",
	        "width":"30%",
	        "x":"3%",
	        "y":"10%",
	        "background-color":"#ffffff",
	        "border-radius":4,
	        "title":{
	            "text":"<strong>전체유동인구</strong>",
	            "text-align":"left",
	            "background-color":"none",
	            "font-color":"#000000",
	            "font-size":"13px",
	            "offset-y":"10%",
	            "offset-x":"10%"
	        },
	        "value-box":{
	            "visible":true
	        },
	        "plotarea":{
	            "margin":"20% 0% 0% 0%"
	        },
	        "plot":{
	            "slice":50,
	            "ref-angle":270,
	            "detach":false,
	            "hover-state":{
	                "visible":false
	            },
	            "value-box":{
	                "visible":true,
	                "type":"first",
	                "connected":false,
	                "placement":"center",
	                "text":"%v",
	                "font-color":"#000000",
	                "font-size":"20px"
	            },
	            "animation":{
	                "delay":0,
	                "effect":2,
	                "speed":"600",
	                "method":"0",
	                "sequence":"1"
	            }
	        },
	        "series":[
	            {
	                "values":[settledTotal],
	                "text":"Steps",
	                "background-color":"#00baf0",
	                "border-width":"0px",
	                "shadow":0
	            }
	        ]
	    },
	    {
	        "type":"pie",
	        "height":"40%",
	        "width":"30%",
	        "x":"35%",
	        "y":"10%",
	        "background-color":"#ffffff",
	        "border-radius":4,
	        "title":{
	            "text":"<strong>남성유동인구</strong>",
	            "text-align":"left",
	            "background-color":"none",
	            "font-color":"#000000",
	            "font-size":"13px",
	            "offset-y":"10%",
	            "offset-x":"10%"
	        },
	        "value-box":{
	            "visible":true
	        },
	        "plotarea":{
	            "margin":"20% 0% 0% 0%"
	        },
	        "plot":{
	            "slice":50,
	            "ref-angle":270,
	            "detach":false,
	            "hover-state":{
	                "visible":false
	            },
	            "value-box":{
	                "visible":true,
	                "type":"first",
	                "connected":false,
	                "placement":"center",
	                "text":"%v",
	                "font-color":"#000000",
	                "font-size":"20px",
	                "rules":[
	                    {
	                        "rule":"%v > 567.8447",
	                        "visible":false
	                    }
	                ],
	            },
	            "tooltip":{
	                "rules":[
	                    {
	                        "rule":"%v == 1153.4064",
	                        "text":"%v %t Burned",
	                        "shadow":false,
	                        "border-radius":4
	                    },
	                    {
	                        "rule":"%v == 567.8446",
	                        "text":"%v Remaining",
	                        "shadow":false,
	                        "border-radius":4
	                    }
	                ]
	            },
	            "animation":{
	                "delay":0,
	                "effect":2,
	                "speed":"600",
	                "method":"0",
	                "sequence":"1"
	            }
	        },
	        "series":[
	            {
	                "values":[settledMale],
	                "text":"Miles",
	                "background-color":"#8AB839",
	                "border-width":"0px",
	                "shadow":0
	            },
	            {
	                "values":[settledTotal - settledMale],
	                "background-color":"#dadada",
	                "alpha":"0.5",
	                "border-color":"#dadada",
	                "border-width":"1px",
	                "shadow":0
	            }
	        ]
	    },
	    {
	        "type":"pie",
	        "height":"40%",
	        "width":"30%",
	        "x":"67%",
	        "y":"10%",
	        "background-color":"#ffffff",
	        "border-radius":4,
	        "title":{
	            "text":"<strong>여성유동인구</strong>",
	            "text-align":"left",
	            "background-color":"none",
	            "font-color":"#000000",
	            "font-size":"13px",
	            "offset-y":"10%",
	            "offset-x":"10%"
	        },
	        "value-box":{
	            "visible":true
	        },
	        "plotarea":{
	            "margin":"20% 0% 0% 0%"
	        },
	        "plot":{
	            "slice":50,
	            "ref-angle":270,
	            "detach":false,
	            "hover-state":{
	                "visible":false
	            },
	            "value-box":{
	                "visible":true,
	                "type":"first",
	                "connected":false,
	                "placement":"center",
	                "text":"%v",
	                "rules":[
	                    {
	                        "rule":"%v < 585.5618",
	                        "visible":false
	                    }
	                ],
	                "font-color":"#000000",
	                "font-size":"20px"
	            },
	            "tooltip":{
	                "rules":[
	                    {
	                        "rule":"%v == 585.5618",
	                        "text":"%v %t Burned",
	                        "shadow":false,
	                        "border-radius":4
	                    },
	                    {
	                        "rule":"%v == 567.8446",
	                        "text":"%v Remaining",
	                        "shadow":false,
	                        "border-radius":4
	                    }
	                ]
	            },
	            "animation":{
	                "delay":0,
	                "effect":2,
	                "speed":"600",
	                "method":"0",
	                "sequence":"1"
	            }
	        },
	        "series":[
	            {
	                "values":[settledFemale],
	                "text":"Calories",
	                "background-color":"#FABE28",
	                "border-width":"0px",
	                "shadow":0
	            },
	            {
	                "values":[settledTotal - settledFemale],
	                "background-color":"#dadada",
	                "alpha":"0.5",
	                "border-color":"#dadada",
	                "border-width":"1px",
	                "shadow":0
	            }
	        ]
	    },
	    {
	        "type":"bar",
	        "height":"42%",
	        "width":"94%",
	        "x":"3%",
	        "y":"53%",
	        "background-color":"#ffffff",
	        "border-radius":4,
	        "title":{
	            "text":"서울시 상주인구",
	            "text-align":"left",
	            "font-size":"13px",
	            "font-color":"#000000",
	            "background-color":"none",
	            "offset-x":"10%",
	            "offset-y":"10%"
	        },
	        "legend":{
	            "toggle-action":"remove",
	            "layout":"x3",
	            "x":"32.5%",
	            "shadow":false,
	            "border-color":"none",
	            "background-color":"none",
	            "item":{
	                "font-color":"#000000"
	            },
	            "marker":{
	                "type":"circle",
	                "border-width":0
	            }
	        },
	        "tooltip":{
	            "text":"%t<br><strong>%v</strong>",
	            "font-size":"12px",
	            "border-radius":4,
	            "shadow":false,
	            "callout":true,
	            "padding":"5 10"
	        },
	        "plot":{
	            "background-color":"#000000",
	            "animation":{
	                "effect":"4"
	            }
	        },
	        "plotarea":{
	            "margin":"35% 3.5% 20% 7.5%"
	        },
	        "scale-x":{
	            "values": fpBdDate,
	            "line-color":"#adadad",
	            "line-width":"1px",
	            "item":{
	                "font-size":"10px",
	                "offset-y":"-2%"
	            },
	            "guide":{
	                "visible":false
	            },
	            "tick":{
	                "visible":false
	            }
	        },
	        "scale-y":{
	            "values":"0:7000:1000",
	            "line-color":"none",
	            "item":{
	                "font-size":"10px",
	                "offset-x":"2%"
	            },
	            "guide":{
	                "line-style":"solid",
	                "line-color":"#adadad"
	            },
	            "tick":{
	                "visible":false
	            }
	        },
	        "series":[
	            {
	                "text":"총 유동인구",
	                "background-color":"#FABE28",
	                "hover-state":{
	                    "background-color":"#FFC942"
	                },
	                "values": totalFloatingPopulation
	            },
	            {
	                "text":"남성 유동인구",
	                "values":floatingMale,
	                "background-color":"#FF8A00",
	                "hover-state":{
	                    "background-color":"#FF9619"
	                }
	            },
	            {
	                "text":"여성 유동인구",
	                "values":floatingFemale,
	                "background-color":"#88C100",
	                "hover-state":{
	                    "background-color":"#91CE00"
	                }
	            }
	        ]
	    }
	]
	};

	zingchart.render({ 
		id : 'bdFloatingPopulation', 
		data : bdFloatingPopulation, 
		height: 472, 
		width: 498 
	});
	
	//서울시 지수지표
	var indexDate = [];
	var activity = [];
	var growth = [];
	var overcrowding = [];
	$(totalIndex).each(function(index, value) {
		indexDate.push(value.bd_date);
		activity.push(value.activity);
		growth.push(value.growth);
		overcrowding.push(value.overcrowding);
	});
	var avgIndex = {
		 	type: 'line',
		 	backgroundColor:'white',
		 	title:{
		 	  text:'서울시 날짜별 지수지표',
		 	  backgroundColor:"white",
		 	  adjustLayout: true,
		 	  fontColor:"black",
		 	  marginTop: 7
		 	},
		 	legend:{
		 	  align: 'center',
		 	  verticalAlign: 'top',
		 	  backgroundColor:'none',
		 	  borderWidth: 0,
		 	  item:{
		 	    fontColor:'black',
		 	    cursor: 'hand'
		 	  },
		 	  marker:{
		 	    type:'circle',
		 	    borderWidth: 0,
		 	    cursor: 'hand'
		 	  }
		 	},
		 	plotarea:{
		 	  margin:'dynamic 70'
		 	},
		 	plot:{
		 	  aspect: 'spline',
		 	  lineWidth: 2,
		 	  marker:{
		 	    borderWidth: 0,
		 	    size: 5
		 	  }
		 	},
		 	scaleX:{
		 	  lineColor: 'black',
		 	  zooming: true,
		 	  values: indexDate,
		 	  item:{
		 	    fontColor:'black'
		 	  }
		 	},
		 	scaleY:{
		 	  values:"30:55:5",
		 	  minorTicks: 1,
		 	  lineColor: 'black',
		 	  tick:{
		 	    lineColor: 'black'
		 	  },
		 	  minorTick:{
		 	    lineColor: 'black'
		 	  },
		 	  minorGuide:{
		 	    visible: true,
		 	    lineWidth: 1,
		 	    lineColor: '#E3E3E5',
		 	    alpha: 0.7,
		 	    lineStyle: 'dashed'
		 	  },
		 	  guide:{
		 	    lineStyle: 'dashed'
		 	  },
		 	  item:{
		 	    fontColor:'black'
		 	  }
		 	},
		 	tooltip:{
		 	  borderWidth: 0,
		 	  borderRadius: 3
		 	},
		 	preview:{
		 	  adjustLayout: true,
		 	  borderColor:'black',
		 	  mask:{
		 	    backgroundColor:'black'
		 	  }
		 	},
		 	crosshairX:{
		 	  plotLabel:{
		 	    multiple: true,
		 	    borderRadius: 3
		 	  },
		 	  scaleLabel:{
		 	    backgroundColor:'#53535e',
		 	    borderRadius: 3
		 	  },
		 	  marker:{
		 	    size: 7,
		 	    alpha: 0.5
		 	  }
		 	},
		 	crosshairY:{
		 	  lineColor:'#E3E3E5',
		 	  type:'multiple',
		 	  scaleLabel:{
		 	    decimals: 2,
		 	    borderRadius: 3,
		 	    offsetX: -5,
		 	    fontColor:"#2C2C39",
		 	    bold: true
		 	  }
		 	},
		 	shapes:[
		              {
		                type:'rectangle',
		                id:'view_all',
		                height:'20px',
		                width:'75px',
		                borderColor:'#E3E3E5',
		                borderWidth:1,
		                borderRadius: 3,
		                x:'87%',
		                y:'8%',
		                backgroundColor:'#53535e',
		                cursor:'hand',
		                label:{
		                  text:'View All',
		                  fontColor:'#E3E3E5',
		                  fontSize:12,
		                  bold:true
		                }
		              }
		            ],
			series: [
				{
					values: overcrowding,
					lineColor:'#E34247',
					text:"<strong>상권과밀지수</strong>",
					marker:{
					  backgroundColor:'#E34247'
					}
				},
				{
				  values:activity,
				  lineColor: '#FEB32E',
				  text:"<strong>상권활성도지수</strong>",
				  marker:{
				    backgroundColor:'#FEB32E'
				  }
				},
				{
				  values: growth,
				  lineColor:'#31A59A',
				  text:"<strong>상권성장성지수</strong>",
				  marker:{
				    backgroundColor:'#31A59A'
				  }
				}
			]
		};

		zingchart.render({ 
			id: 'totalIndex', 
			data: avgIndex, 
			height: 472, 
			width: 521 
		});

		zingchart.shape_click = function(p){
		  if(p.shapeid == "view_all"){
		    zingchart.exec(p.id,'viewall');
		  }
		}
		
		
		//서울상권 주중,주말,요일별 추정매출 정보
		var salesDate = [];
		var weekend = [];
		var weekday = [];
		var mon = []; var tue = []; var wed = []; var thu = []; var fri = []; var sat = []; var sun = [];
		$(estimatedSales).each(function(index, value) {
			salesDate.push(value.bd_date);
			weekend.push(value.weekend);
			weekday.push(value.weekday);
			mon.push(value.mon);
			tue.push(value.tue);
			wed.push(value.wed);
			thu.push(value.thu);
			fri.push(value.fri);
			sat.push(value.sat);
			sun.push(value.sun);
		});
		var sales = {
		    "type": "bar",
		    "background-color": "#ffffff",
		    "title": {
		        "text": "요일별 추정매출",
		        "background-color": "#ffffff",
		        "color": "#a6a6a6"
		    },
		    "scroll-x": {
		        "handle": {
		            "background-color": "white",
		            "border-left": "1px solid #a6a6a6",
		            "border-right": "1px solid #a6a6a6",
		            "border-top": "1px solid #a6a6a6",
		            "border-bottom": "1px solid #a6a6a6",
		            "border-radius": "5px"
		        },
		        "bar": {
		            "background-color": "#a6a6a6",
		            "alpha": 0.5,
		            "border-radius": "5px"
		        }
		    },
		    "scaleX": {
		        "line-color": "#a6a6a6",
		        "line-width": 0,
		        "guide": {
		            "line-color": "#a6a6a6",
		            "line-style": "solid"
		        },
		        "tick": {
		            "line-color": "#a6a6a6",
		            "line-width": 1,
		            "visible": 0
		        },
		        "item": {
		            "color": "#a6a6a6"
		        },
		        "labels": salesDate,
		        "zooming": true,
		        "zoom-to": [
		            0,
		            3
		        ]
		    },
		    "scaleY": {
		        "line-color": "#a6a6a6",
		        "line-width": 1,
		        "guide": {
		            "line-style": "solid",
		            "line-color": "#a6a6a6"
		        },
		        "tick": {
		            "line-color": "#a6a6a6",
		            "line-width": 1
		        },
		        "item": {
		            "color": "#a6a6a6"
		        },
		        "label": {
		            "text": "Sales Rate",
		            "color": "#a6a6a6"
		        }
		    },
		    "tooltip": {
		            "text":"%t sales Rate = <br>%v<br>in %kt",
		            "text-align":"left",
		            "shadow": 0,
		            "border-radius": 5
		        },
		    "plot": {
		        "alpha":0.6,
		        "border-radius-top-right": 5,
		        "border-radius-top-left": 5,
		        "scroll-step-multiplier": 1,
		        "animation":{
		          "sequence":2 // takes zoomTo animation by default
		        }
		    },
		    "series": [
		        {
		            "values": weekday,
		            "background-color": "#f7846a",
		            "text":"weekday"
		        },
		        {
		            "values": weekend,
		            "background-color": "#ffc94e",
		            "text":"weekend"
		        },
		        {
		            "values": mon,
		            "background-color": "#f1f14e",
		            	"text" : "monday"
		        },
		        {
		            "values": tue,
		            "background-color": "#c9ea5d",
		            "text":"tuesday"
		        },
		        {
		            "values": wed,
		            "background-color": "#92e4c9",
		            "text":"wednesday"
		        },
		        {
		            "values": thu,
		            "background-color": "#85d6e4",
		            "text":"thursday"
		        },
		        {
		            "values": fri,
		            "background-color": "#C12DFF",
		            "text":"friday"
		        },
		        {
		            "values": sat,
		            "background-color": "#EB4646",
		            "text":"saturday"
		        },
		        {
		            "values": sun,
		            "background-color": "#828282",
		            "text":"sunday"
		        },
		    ]
		};

		zingchart.render({ 
			id : 'estimatedSales', 
			data : sales, 
			height: 473, 
			width: 498
		});
		
		
});
