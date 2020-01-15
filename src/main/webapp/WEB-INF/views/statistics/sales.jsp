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
			<select class="js-example-basic-multiple" id="shopNoArr" name="shopNoArr[]" multiple="multiple">
				<c:forEach var="shopT" items="${shopList }" >
					<c:choose>
						<c:when test="${shopT.shopNo eq shop.shopNo}">
							<option value="${shopT.shopNo }" selected>${shopT.shopName }</option>
						</c:when>
						<c:otherwise>
							<option value="${shopT.shopNo }">${shopT.shopName }</option>
						</c:otherwise>
					</c:choose>
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

var i = 0;
// var myLineChart = {};
var myLineChartMonthly = null;
var myLineChartDaily = null;

//ajax
function getStatistics() {

	$.ajax({
	  url: "/statistics/salesSearch",
	  method: "GET",
	  data : $("#statisticsForm").serialize(),
	  success: function (result) {

		  console.log("--- before myLineChart---");
// 		  console.log(myLineChart);
		  console.log(myLineChartMonthly);
		  console.log(myLineChartDaily);
		  
		//기존 데이터 삭제
		if( myLineChartMonthly != null) {
			myLineChartMonthly.destroy();
			myLineChartMonthly = null;
		}
		if( myLineChartDaily != null) {
			myLineChartDaily.destroy();
			myLineChartDaily = null;
		}
// 		myLineChart.destroy();
		  
		  
		console.log("--- detroy myLineChart---");
		console.log(myLineChartMonthly);
		console.log(myLineChartDaily);
// 		console.log(myLineChart);
		
		//Monthly
	  	//색상지정
		var datasets = [];
		var paymentDateS = new Set();
	  	
	    for (var shopNo in result.dailyStatistics) {
	    	
	    	var resObject = result.dailyStatistics[shopNo];
		  	var sumPrice = [];
		  	
	    	for(var i in resObject){
	    		
	    		paymentDateS.add(resObject[i].PAYMENTDATE);
	    		sumPrice.push(resObject[i].SUMPRICE);
	    	}
	    	
	        datasets.push({label:  $("#shopNoArr option[value="+shopNo+"]").text(),
           		backgroundColor: getRandomColor(),
           		data: sumPrice});
	    }
	    
	    //중복 제거한 set을 배열로 다시 변환
	    var paymentDate = Array.from(paymentDateS);
	    var ctx = document.getElementById("myBarChart3");
	      
	    myLineChartMonthly = new Chart(ctx, {
// 	    myLineChart = new Chart(ctx, {
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
	    
	    console.log("--- new myLineChartMonthly ---");
	    console.log(myLineChartMonthly);
// 	    console.log(myLineChart);
	    
	      //daily
	    var datasets2 = [];
	  	var paymentDateS2 = new Set();
	  	
	  	for (var shopNo in result.monthlyStatistics) {
	  		
	  		var resObject = result.monthlyStatistics[shopNo];
		  	var sumPrice2 = [];
		  	
			for(var i in resObject){
	    		
	    		paymentDateS2.add(resObject[i].PAYMENTDATE);
	    		sumPrice2.push(resObject[i].SUMPRICE);
	    	}

			 datasets2.push({label:  $("#shopNoArr option[value="+shopNo+"]").text(),
	           		backgroundColor: getRandomColor(),
	           		data: sumPrice2});
	      }
	  	
	  	 //중복 제거한 set을 배열로 다시 변환
	    var paymentDate2 = Array.from(paymentDateS2);
	      var ctx = document.getElementById("myBarChart");
	      myLineChartDaily = new Chart(ctx, {
// 	      myLineChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: paymentDate2,
	            datasets: datasets2
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
	      
	      console.log("--- new myLineChartDaily ---");
	      console.log(myLineChartDaily);
// 	      console.log(myLineChart);
	  }
	});
}

</script>