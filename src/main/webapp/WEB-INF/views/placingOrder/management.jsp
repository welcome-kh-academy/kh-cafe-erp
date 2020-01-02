<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}

.condition-container {
	margin : 20px;
}

.space {
	margin-left : 20px;
	margin-right : 20px;
}

.btn-lg {
	width: 100%;
	height : 70px;
}
</style>

<script type="text/javascript">

// datatable
$(document).ready( function () {
	
	var curPage = 1; //페이지 변수를 1로 초기화
	
    $('#myTable').DataTable({
    	"scrollY" : 200, //테이블 고정 크기 설정
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language" : {
    		search: "빠른검색 ", //한글
    		"emptyTable": "발주 목록이 존재하지 않습니다."
    	},
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"bPaginate" : true, //페이징 처리를 할 것인가
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	ajax : {
			"type" : "GET",
			"url" : "/placingOrder/search",
			"data" : function(d) {
				d.formData = $("#placingOrderForm").serialize(); //검색조건
			},
			"dataSrc" : function(json){
				
				console.log(json.data);
				
// 				console.log(JSON.stringify(json.data))
				return json.data;
			}
		}
    });
});	


function getList() {
	
// 	var curPage = 1; //페이지 변수를 1로 초기화
// 	var formData = $("#placingOrderForm").serialize(); //검색조건
	
// 	$('#myTable').DataTable({
//     	"autoWidth" : false, 
//     	"scrollY" : 200, //테이블 고정 크기 설정
//     	"scrollCollapse" : true, //가변 크기 막기
//     	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
//     	"language" : {
//     		search: "빠른검색 " //한글
//     	},
//     	"pageLength" : 5, //한페이지에 보여줄 페이지 갯수
//     	"bPaginate" : true, //페이징 처리를 할 것인가
//     	"serverSide" : false, //클라이언트에서 처리
//     	"column" : [
//     		{"data": "action"},
// 			{"data": "bookId"},
// 			{"data": "hostId"},
// 			{"data": "type"},
// 			{"data": "guestId"},
// 			{"data": "regTime"}
//     	],
//     	ajax : {
//     		"type" : "GET",
//     		"url" : "/placingOrder/search",
//     		"data" : function(d) {
//     			d.curPage = curPage,
//     			d.formData = $("#placingOrderForm").serialize(); //검색조건
//     		}
//     	}
  
//     });
	
// 	$.ajax({
// 		type : "GET",
// 		url : "/placingOrder/search",
// 		data : {
// 			"curPage" : curPage,
// 			"formData" : formData
// 		},
// 		dataType : "json",
// 		error : function() {
// 			alert("ajax오류!");
// 		},
// 		success : function(res) {
			
// 			alert(res.placingOrderList);
		
// 		}
// 	});
}

</script>

<h1>발주관리 페이지</h1>
<hr/>

<div class="condition-container">
<form action="/placingOrder/management" method="post" id="placingOrderForm">
<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="placingOrderNo">발주번호</label></th>
		<td><input type="number" value="${placingOrderList.placingOrderNo }" id="placingOrderNo" name="placingOrderNo"/></td>
		<th class="condition"><label for="shopName">지점명</label></th>
		<td><input type="text" name="shopName" id="shopName"></td>
		<td rowspan="3" style="vertical-align : middle;text-align:center;">
			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색</button>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="startDate">발주일시</label></th>
		<td colspan="3">
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<span class="space">~</span> 
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="endDate" name="endDate">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="placingOrderStatus">발주상태</label></th>
		<td>
			<select name="placingOrderStatus" id="placingOrderStatus"
				class="select2-selection--single form-control">
				<option value="1">발주완료</option>
			</select>
		</td>
		<th class="condition"><label for="inStockStatus">입고상태</label></th>
		<td>
			<select name="inStockStatus" id="inStockStatus"
				class="select2-selection--single form-control">
				<option value="1">입고완료</option>
			</select>
		</td>
	</tr>
</table>
</form>
</div>

<div style="float:right;">
	<button class="btn btn-outline-success">Excel 다운로드</button>
</div>

<table id="myTable" class="display table table-bordered">
    <thead class="thead-dark">
        <tr>
<!--         	<th><input type="checkbox"/></th> -->
            <th>no</th>
            <th>발주번호</th>
            <th>지점명</th>
            <th>발주일시</th>
            <th>총 발주수량</th>
            <th>발주금액</th>
            <th>발주상태</th>
            <th>입고상태</th>
        </tr>
    </thead>
</table>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
