<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("1WiDgNpz9SVwwS4Cu_Au", "http://localhost:8080/project2/main");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    alert(naver_id_login.getProfileData('email'));
	    alert(naver_id_login.getProfileData('id'));
	    alert(naver_id_login.getProfileData('name'));
	  }
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>-->
<!-- zingChart js -->
<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];
	var populationDates = ${bdSettledPopulation};
	var populationDates = ${bdSettledPopulation}
	var indexData = ${indexData};
	var datas = ${polygonList};
</script>
<link rel="stylesheet" type="text/css" href="resources/css/chart.css" />
<script type="text/javascript" src="resources/js/chart.js"></script>
<script src="resources/js/daum.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1be91db11f8253de94c8895a7e92d8d"></script>

<article>
<div class="body">
  <div class="jumbotron" style="background-color:white;margin:0 auto">
    <div class="container text-center" style="width:100%;">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="http://cfile208.uf.daum.net/image/1330333B512A106B0AF090" alt="명동" style="width:1140px;height:400px">
          </div>

          <div class="item">
            <img src="http://img.hani.co.kr/imgdb/resize/2017/0519/149508642721_20170519.JPG" alt="명동2" style="width:1140px;height:400px">
          </div>

          <div class="item">
            <img src="http://image.koreatimes.com/article/2015/12/24/20151224193615561.jpg" alt="명동3" style="width:1140px;height:400px">
          </div>

          <div class="item">
            <img src="http://cfile215.uf.daum.net/image/240DCB4251E77A9521DE1E" alt="명동4" style="width:1140px;height:400px">
          </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
      </div>
    </div>
  </div>

  <div class="container text-center">
    <div class="row">
      <div class="col-sm-6">
        <div id="map" class="mainBox" style="width: 100%; height: 540px;"></div>        
      </div>
      <div class="col-sm-6">
        <div id="bdSettledPopulation" class="mainBox"><a class="zc-ref" href="https://www.zingchart.com"></a></div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-6">
        <div id='dangerChart' data-avg="${riskIndex}" class="mainBox"><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
      <div class="col-sm-6">
        <div id='totalIndex' class="mainBox"><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
      </div>
    </div>
  </div>
</div>
<br><br><br>

</article>