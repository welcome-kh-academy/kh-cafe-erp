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

//Ajax 실행
getStatistics();

});	

</script>

	<h1>매출통계</h1>
	<hr/>
	
	<div class="condition-container">
<form id="statisticsForm">

<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="startDate">판매기간</label></th>
		<td width="700px">
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate" value="">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<span class="space">~</span>
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="endDate" name="endDate">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<br>
			<font color="red">&nbsp;**판매기간은 최대 3개월까지만 검색이 가능합니다.</font>
		</td>
		
		<!-- 포지션 3만 선택 가능 -->
		<c:if test="${position eq 3}">
			<th class="condition"><label for="startDate">지점선택</label></th>
			<td>
			<select class="js-example-basic-multiple" name="shopNoArr[]" multiple="multiple">
  				<option value="${shop.shopNo }" selected>${shop.shopName }</option>
					<c:forEach var="shopT" items="${shopList }" >
						<option value="${shopT.shopNo }">${shopT.shopName }</option>
					</c:forEach>
			</select>
			</td>
		</c:if>
		
		<td style="vertical-align : middle;text-align:center;">
			<button type="button" class="btn btn-primary btn-lg" onclick="getStatistics()">검색&nbsp;<i class="fas fa-search"></i></button>
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

//ajax
function getStatistics() {

	$.ajax({
	  url: "/statistics/salesSearch",
	  method: "GET",
	  data : $("#statisticsForm").serialize(),
	  success: function (result) {
		  
// 		var chartData = { 
// 				labels: ["S", "M", "T", "W", "T", "F", "S"],
// 				datasets: [
// 					{ data: [589, 445, 483, 503, 689, 692, 634], backgroundColor: colors[0] }, 
// 					{ data: [209, 245, 383, 403, 589, 692, 580], backgroundColor: colors[1] }, 
// 					{ data: [489, 135, 483, 290, 189, 603, 600], backgroundColor: colors[2] }, { data: [639, 465, 493, 478, 589, 632, 674], backgroundColor: colors[4] }] }; var myChart = new Chart(chBar, { // 챠트 종류를 선택 type: 'bar', // 챠트를 그릴 데이타 data: chartData, // 옵션 options: { legend: { display: false } } });

		  
	  	//색상지정
		var datasets = [];
	  	
	    for (var shopNo in result.dailyStatistics) {
	    	
	    	//daily
		  	var paymentDate = [];
		  	var sumPrice = [];
	    	
	    	for(var i in shopNo){
	    		paymentDate.push(result.dailyStatistics[shopNo][i].PAYMENTDATE);
	    		sumPrice.push(result.dailyStatistics[shopNo][i].SUMPRICE);
	    	}
	        
	        datasets.push({label: "총 매출액",
           		backgroundColor: getRandomColor(),
           		data: sumPrice});
	    }
	      
	    var ctx = document.getElementById("myBarChart3");
	      
	    var myLineChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: paymentDate,
	            datasets: datasets,
	        },
	        options: {
	          scales: {
	            xAxes: [{
	              time: {
	                unit: 'month'
	              },
	              gridLines: {
	                display: false
	              },
	              ticks: {
	                maxTicksLimit: 6
	              }
	            }],
	            yAxes: [{
	              ticks: {
	                min: 0,
	                max: 15000,
	                maxTicksLimit: 5
	              },
	              gridLines: {
	                display: true
	              }
	            }],
	          },
	          legend: {
	            display: false
	          }
	        }
	      });
	      
	      //monthly
	    var paymentDate2 = [];
	  	var sumPrice2 = [];
	  	
	      for (var i in result.monthlyStatistics) {
	          paymentDate2.push(result.monthlyStatistics[i].PAYMENTDATE);
	          sumPrice2.push(result.monthlyStatistics[i].SUMPRICE);
	      }
	      
	      var ctx = document.getElementById("myBarChart");
	      var myLineChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: paymentDate2,
	            datasets: [{
	               label: "총 매출액",
	               backgroundColor: getRandomColor(),
	               borderColor: getRandomColor(),
	               data: sumPrice2,
	            }],
	         },
	        options: {
	          scales: {
	            xAxes: [{
	              time: {
	                unit: 'day'
	              },
	              gridLines: {
	                display: false
	              },
	              ticks: {
	                maxTicksLimit: 6
	              }
	            }],
	            yAxes: [{
	              ticks: {
	                min: 0,
	                max: 15000,
	                maxTicksLimit: 5
	              },
	              gridLines: {
	                display: true
	              }
	            }],
	          },
	          legend: {
	            display: false
	          }
	        }
	      });
	  }
	});
}
</script>

 <!-- Demo scripts for this page -->
 <script type="text/javascript" src="/resources/js/weekly.js"></script>
