<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

</style>

<script type="text/javascript">

$(document).ready( function () {
	
var startDate = getPastDate(1);
var endDate = getRecentDate();
 
$("#startDate").val(startDate);
$("#endDate").val(endDate);
 
function getRecentDate(){
    var dt = new Date();
 
    var recentYear = dt.getFullYear();
    var recentMonth = dt.getMonth() + 1;
    var recentDay = dt.getDate();
 
    if(recentMonth < 10) recentMonth = "0" + recentMonth;
    if(recentDay < 10) recentDay = "0" + recentDay;
 
    return recentYear + "-" + recentMonth + "-" + recentDay;
}
 
function getPastDate(period){
    var dt = new Date();
 
    dt.setMonth((dt.getMonth() + 1) - period);
 
    var year = dt.getFullYear();
    var month = dt.getMonth();
    var day = dt.getDate();
 
    if(month < 10) month = "0" + month;
    if(day < 10) day = "0" + day;
 
    if(month=="00"){
    	month="12";
    	year = year-1;
    }
    
    return year + "-" + month + "-" + day;
}

//select2
$('.js-example-basic-multiple').select2({ width: '500px'});

});	
</script>

	<h1>매출통계</h1>
	<hr/>
	
	<div class="condition-container">
<form action="/placingOrder/management" method="get" id="placingOrderForm">

<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="startDate">판매기간</label></th>
		<td width="700px">
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate" value="2020-01-01">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<span class="space">~</span>
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="endDate" name="endDate">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<br>
			<font color="red">&nbsp;**판매기간은 최대 3개월까지만 검색이 가능합니다.</font>
		</td>
		<th class="condition"><label for="startDate">지점선택</label></th>
		<td>
		<select class="js-example-basic-multiple" name="states[]" multiple="multiple">
  			<option value="" selected >강남점</option>
  			<option value="">역삼점</option>
		</select>
		</td>
		<td style="vertical-align : middle;text-align:center;">
			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색&nbsp;<i class="fas fa-search"></i></button>
		</td>
	</tr>
</table>
</form>
</div>
	
        <div class="card mb-3">
           <div class="card-header text-white bg-primary">
             <i class="fas fa-chart-bar"></i>월간 매출 통계
           </div>
           <div class="card-body">
             <canvas id="myBarChart" width="300px" height="100"></canvas>
           </div>
           <div class="card-footer small text-muted text-white bg-primary">
           		어제 11:59 PM에 업데이트
           	</div>
        </div>
    
        <div class="card mb-3">
           <div class="card-header text-white bg-primary">
             <i class="fas fa-chart-bar"></i>주간 매출 통계
           </div>
           <div class="card-body">
             <canvas id="myBarChart2" width="300px" height="100"></canvas>
           </div>
           <div class="card-footer small text-muted text-white bg-primary">
           		어제 11:59 PM에 업데이트
           	</div>
        </div>
        
        <div class="card mb-3">
           <div class="card-header text-white bg-primary">
             <i class="fas fa-chart-bar"></i>일간 매출 통계
           </div>
           <div class="card-body">
             <canvas id="myBarChart3" width="300px" height="100"></canvas>
           </div>
           <div class="card-footer small text-muted text-white bg-primary">
           		어제 11:59 PM에 업데이트
           	</div>
        </div>
          
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<script type="text/javascript">

//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

</script>

 <!-- Demo scripts for this page -->
 <script type="text/javascript" src="/resources/js/monthly.js"></script>
 <script type="text/javascript" src="/resources/js/weekly.js"></script>
 <script type="text/javascript" src="/resources/js/daily.js"></script> 
