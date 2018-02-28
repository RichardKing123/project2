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