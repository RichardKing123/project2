<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9",
			"ee6b7db5b51705a13dc2339db3edaf6d"];</script>
<script type="text/javascript" src="resources/js/trendIndex.js"></script>
<script type="text/javascript">
var bdApt = ${bdApt};
var bdFacilities = ${bdFacilities};
var floatingPopulation = ${bdFloatingPopulation};
var oneBdSettled = ${oneBdSettled};
var totalIndex = ${totalIndex};
var estimatedSales = ${estimatedSales};
</script>
<title>동향지표</title>
</head>
<body>
<div id='bdApt'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
<div id='bdFacilities'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
<div id='bdFloatingPopulation'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
<div id='totalIndex'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
<div id='estimatedSales'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
</body>
</html>