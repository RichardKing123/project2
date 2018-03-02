$(function() {
	var word1 = [];
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
			});
	
	
});
