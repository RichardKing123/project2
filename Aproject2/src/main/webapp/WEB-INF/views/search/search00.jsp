<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
<wrap>
<div id="choiceWork1">
	<a href="#" class="choiceWork1">관심업종을 선택하세요</a>&nbsp;&nbsp;<span id="selectWork"></span>
</div>

<br/>
<form>
<input type="hidden" id="selWork">
<input type="hidden" id="gu">
</form>

<div id="workTable" class="workTable">
  
  <ul class="workKind">
	
		<li><a href="#" id="food">외식업</a></li>
		<li><a href="#" id="service">서비스업</a></li>
		<li><a href="#" id="doso">도소매업</a></li>
		<li><a href="#" id="allWork">전체업종</a></li>
	
  </ul>
	<br/>
  <table class="food">
	<tr>
		<td><a href="#" class="korea">한식음식점</a></td>
		<td><a href="#" class="japan">일식집</a></td>
		<td><a href="#" class="bunsik">분식집</a></td>
		<td><a href="#" class="chik">치킨집</a></td>
		<td><a href="#" class="hof">호프간이주점</a></td>
	</tr>
	<tr>
		<td><a href="#" class="chinese">중국집</a></td>
		<td><a href="#" class="westFood">양식집</a></td>
		<td><a href="#" class="fastFood">패스트푸드점</a></td>
		<td><a href="#" class="bread">제과점</a></td>
		<td><a href="#" class="coffe">커피음료</a></td>
	</tr>
  </table>

  <table class="service">
  <tr>
	<td><a href="#" class="singing">노래방</a></td>
	<td><a href="#" class="cutter">미용실</a></td>
	<td><a href="#" class="study">입시보습학원</a></td>
	<td><a href="#" class="oriental">한의원</a></td>

	<td><a href="#" class="pcRoom">PC방</a></td>
	</tr>
	<tr>
		<td><a href="#" class="skinCare">피부관리실</a></td>
		<td><a href="#" class="YBM">외국어학원</a></td>
		<td><a href="#" class="silverCare">노인요양시설</a></td>
		<td><a href="#" class="billard">당구장</a></td>
		<td><a href="#" class="nail">네일숍</a></td>
	</tr>
	<tr>
		<td><a href="#" class="artPhysical">예체능학원</a></td>
		<td><a href="#" class="carRepair">자동차수리</a></td>
		<td><a href="#" class="golf">골프연습장</a></td>
		<td><a href="#" class="health">헬스클럽</a></td>
		<td><a href="#" class="childCare">보육시설</a></td>
	</tr>
	<tr>
		<td><a href="#" class="carBeauty">자동차미용</a></td>
		<td><a href="#" class="motel">여관업</a></td>
		<td><a href="#" class="interior">인테리어</a></td>
		<td><a href="#" class="hospital">일반의원</a></td>
		<td><a href="#" class="clean">세탁소</a></td>
	</tr>
	<tr>
		<td><a href="#" class="daBang">부동산중개업</a></td>
		<td><a href="#" class="dentist">치과의원</a></td>
		
	</tr>
  </table>

  <table class="doso">
  <tr>
	<td><a href="#" class="super">슈퍼마켓</a></td>
	<td><a href="#" class="cu">편의점</a></td>
	<td><a href="#" class="repair_com">컴퓨터판매수리</a></td>
	<td><a href="#" class="iphone">휴대폰</a></td>

	<td><a href="#" class="butcher">정육점</a></td>
  </tr>
  <tr>
		<td><a href="#" class="fruit">과일채소</a></td>
		<td><a href="#" class="cloth">의류점</a></td>
		<td><a href="#" class="fashion">패션잡화</a></td>
		<td><a href="#" class="pharmacy">약국</a></td>
		<td><a href="#" class="stationary">문구점</a></td>
	</tr>
	<tr>
		<td><a href="#" class="cosmetic">화장품</a></td>
		
	</tr>
  </table>

  
  
  </div>
  <br/>

<div id="choiceRegion1">
	<a href="#" class="choiceRegion1">관심지역을 선택하세요</a>&nbsp;&nbsp;<span id="selectGu"></span>
</div>

<br/>
<div id="regionTable" class="regionTable">

<table class="region">
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



<div><input type="button" id="search" value="검색"></div>

<div id="result">
	<table id="resultTable"></table>
</div>



</wrap>
</article>    
