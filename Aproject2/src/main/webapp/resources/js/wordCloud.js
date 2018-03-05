$(function() {
	/*var word1 = [];
	$(wordData).each(function(index, value) {
		word1.push(value.garosu);
	});
	var word2 = word1.join(", ");
	var myConfig = {
			  type: 'wordcloud',
			  options: {
			    text: word2,
			    minLength: 4,
			    ignore: ['establish','this'],
			    maxItems: 50,
			    aspect: 'spiral',
			    rotate: true,
			    
			    colorType: 'palette',
			    palette: ['#D32F2F','#1976D2','#9E9E9E','#E53935','#1E88E5','#7E57C2','#F44336','#2196F3','#A1887F'],
			    
			    style: {
			      fontFamily: 'Merriweather',
			      
			      hoverState: {
			        backgroundColor: '#1976D2',
			        borderColor: 'none',
			        borderRadius: 3,
			        fontColor: 'white'
			      }
			    }
			  }
			};

			zingchart.render({ 
				id: 'myChart', 
				data: myConfig, 
				height: 500, 
				width: 500 
			});*/
	
	
	
	zingchart.THEME="classic";
	var garosuData = [];
	var syarosuData = [];
	$(garosu).each(function(index, value) {
		garosuData.push(value.garosu);
	});
	$(syarosu).each(function(index, value) {
		syarosuData.push(value.x);
	});
	var garosulist = garosuData.join(", ");
	var syarosulist = syarosuData.join(", ");
	var myConfig = {
	    "background-color":"#ffffff",
	    "graphset":[
	        {
	            "type":"wordcloud",
	            "x":"0%",
	            "y":"0%",
	            "width":"50%",
	            "height":"100%",
	            "background-color":"#F2F3F8",
	            "title":{
	                "text":"가로수길",
	                "y":"5%",
	                "background-color":"none",
	                "font-size":"24px",
	                "font-color":"#000000"
	            },
	            "plotarea":{
	                "margin":"50 auto auto auto"
	            },
	            "options":{
	                "max-items":20,
	                "font-family":"Arial",
	                "rotate":true,
	                "min-length":4,
	                "min-font-size":"12px",
	                "max-font-size":"35px",
	                "color-type":"palette",
	                "palette":["#57aa83","#c13f43","#2c497d","#8965ad","#686d7b","#fd625e","#d7d7d9","#2e67c6"],
	                "text": garosulist
	            }
	        },
	        {
	            "type":"wordcloud",
	            "x":"51%",
	            "y":"0%",
	            "width":"50%",
	            "height":"100%",
	            "background-color":"#F2F3F8",
	            "title":{
	                "text":"샤로수길",
	                "y":"5%",
	                "background-color":"none",
	                "font-size":"24px",
	                "font-color":"#000000"
	            },
	            "plotarea":{
	                "margin":"50 auto auto auto"
	            },
	            "options":{
	                "max-items":20,
	                "font-family":"Arial",
	                "rotate":true,
	                "min-length":4,
	                "min-font-size":"12px",
	                "max-font-size":"35px",
	                "color-type":"palette",
	                "palette":["#57aa83","#c13f43","#2c497d","#8965ad","#686d7b","#fd625e","#d7d7d9","#2e67c6"],
	                "text": syarosulist
	            }
	        }
	    ]
	}

	;

	zingchart.render({ 
		id : 'myChart', 
		data : myConfig, 
		height: 450, 
		width: 725 
	});
	
	
	var hongdaeData = [];
	var gyunglidanData = [];
	$(hongdae).each(function(index, value) {
		hongdaeData.push(value.x);
	});
	$(gyunglidan).each(function(index, value) {
		gyunglidanData.push(value.x);
	});
	var hongdaelist = hongdaeData.join(", ");
	var gyunglidanlist = gyunglidanData.join(", ");
	var myConfig1 = {
	    "background-color":"#ffffff",
	    "graphset":[
	        {
	            "type":"wordcloud",
	            "x":"0%",
	            "y":"0%",
	            "width":"50%",
	            "height":"100%",
	            "background-color":"#F2F3F8",
	            "title":{
	                "text":"홍대",
	                "y":"5%",
	                "background-color":"none",
	                "font-size":"24px",
	                "font-color":"#000000"
	            },
	            "plotarea":{
	                "margin":"50 auto auto auto"
	            },
	            "options":{
	                "max-items":20,
	                "font-family":"Arial",
	                "rotate":true,
	                "min-length":4,
	                "min-font-size":"12px",
	                "max-font-size":"35px",
	                "color-type":"palette",
	                "palette":["#57aa83","#c13f43","#2c497d","#8965ad","#686d7b","#fd625e","#d7d7d9","#2e67c6"],
	                "text": hongdaelist
	            }
	        },
	        {
	            "type":"wordcloud",
	            "x":"51%",
	            "y":"0%",
	            "width":"50%",
	            "height":"100%",
	            "background-color":"#F2F3F8",
	            "title":{
	                "text":"경리단길",
	                "y":"5%",
	                "background-color":"none",
	                "font-size":"24px",
	                "font-color":"#000000"
	            },
	            "plotarea":{
	                "margin":"50 auto auto auto"
	            },
	            "options":{
	                "max-items":20,
	                "font-family":"Arial",
	                "rotate":true,
	                "min-length":4,
	                "min-font-size":"12px",
	                "max-font-size":"35px",
	                "color-type":"palette",
	                "palette":["#57aa83","#c13f43","#2c497d","#8965ad","#686d7b","#fd625e","#d7d7d9","#2e67c6"],
	                "text": gyunglidanlist
	            }
	        }
	    ]
	}

	;

	zingchart.render({ 
		id : 'second', 
		data : myConfig1, 
		height: 450, 
		width: 725 
	});
	
});
