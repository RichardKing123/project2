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
<div class="container_1">
  <div class="row">
  <div class="emptybox"></div><br><br>
  <h2>${district } ${bdCodeName } <small>${businessType }</small></h2><br><br>
    <div class="innerbox topbox">
      <span class="first">${district } 지도</span>
      <div class="line_1"></div>
      <div class="contain_1" style="padding: 10px">
        <div id="map3" style="width: 478px; height: 492px;border-radius:5px;"></div>
      </div>
    </div>

    <div class="innerbox">
      <span class="first">${bdCodeName } ${businessType } 상권 정보</span>
      <div class="line_1"></div>
      <div class="contain_1">
        <div id='noOfShop'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
    </div>
  </div>

  <div class="row2">
  	<div class="emptybox"></div><br><br>
    <div class="emptybox"></div><br><br>
    <div class="innerbox topbox">
      <span class="first">상권 안정도 - <i>해당 지역의 안정도는 <font color="red">${stabilityIndex }</font>입니다</i></span>
      <div class="line_1"></div>
      <div class="contain_1">
        <div id='stability'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
    </div>

    <div class="innerbox">
      <span class="first">${bdCodeName } 업종별 점포 수</span>
      <div class="line_1"></div>
      <div class="contain_1">
        <div id='shopRadar'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
    </div>
  </div>
</div>

</article>