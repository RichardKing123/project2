<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/locationAnalysis.js"></script>
<article>
<wrap class="DG">
	<form>
		<input type="hidden" id="gu">
	</form>
	<div id="choiceRegion1">
		<a href="#" class="choiceRegion1">-관심지역을 선택하세요</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="selectGu"></span>
	</div>
	<div id="region" class="region">

		<table class="table table-bordered" id="resRegion">
			<tr>
				<td><a href="#" class="gangnam">강남구</a></td>
				<td><a href="#" class="gangdong">강동구</a></td>
				<td><a href="#" class="gangbook">강북구</a></td>
				<td><a href="#" class="gangseo">강서구</a></td>
				<td><a href="#" class="gwanak">관악구</a></td>
			</tr>
			<tr>
				<td><a href="#" class="gwanjin">광진구</a></td>
				<td><a href="#" class="guro">구로구</a></td>
				<td><a href="#" class="geumchun">금천구</a></td>
				<td><a href="#" class="nowon">노원구</a></td>
				<td><a href="#" class="dobong">도봉구</a></td>
			</tr>
			<tr>
				<td><a href="#" class="dongdaemun">동대문구</a></td>
				<td><a href="#" class="dongjak">동작구</a></td>
				<td><a href="#" class="mapo">마포구</a></td>
				<td><a href="#" class="seodaemun">서대문구</a></td>
				<td><a href="#" class="seocho">서초구</a></td>
			</tr>
			<tr>
				<td><a href="#" class="sungdong">성동구</a></td>
				<td><a href="#" class="sungbuk">성북구</a></td>
				<td><a href="#" class="songpa">송파구</a></td>
				<td><a href="#" class="yangchun">양천구</a></td>
				<td><a href="#" class="youngdeungpo">영등포구</a></td>
			</tr>
			<tr>
				<td><a href="#" class="yongsan">용산구</a></td>
				<td><a href="#" class="eunpyeong">은평구</a></td>
				<td><a href="#" class="jongro">종로구</a></td>
				<td><a href="#" class="junggu">중구</a></td>
				<td><a href="#" class="jungranggu">중랑구</a></td>
			</tr>
		</table>
	</div>
	<div><button type="button" id="locationSearch" data-loading-text="loading..." autocomplete="off" class="btn btn-primary">검색</button></div>
	
	<div id="result">
		<table id="resultTable"></table>
	</div>
</wrap>
</article>