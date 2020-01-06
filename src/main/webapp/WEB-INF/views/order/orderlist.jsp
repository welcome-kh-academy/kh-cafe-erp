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
function detailview(){
	window.open
	
}
// datatable
$(document).ready( function () {
	
	var curPage = 1; //페이지 변수를 1로 초기화
	
    $('#myTable').DataTable({
    	"scrollY" : 200, //테이블 고정 크기 설정
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language" : {
    		search: "빠른검색 ", //한글
    		"emptyTable": "주문 목록이 존재하지 않습니다."
    	},
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"bPaginate" : true, //페이징 처리를 할 것인가
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	"columnDefs": [{
            "targets": -1,
            "data": null,
            "render": function(data, type, row){
            	
             return '<button class="btn btn-primary" onclick="detailview()">상세보기</button>';
      },
      "orderable": false

           }],
           
    	ajax : {
			"type" : "GET",
			"url" : "/order/search",
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

// 20-01-02 유진 : 엑셀 업로드 팝업창
function popupOpen(){
	var url ="/order/popExcel";
	var winWidth = 500;
	var winHeight = 300;
	
	
	var winLeft = Math.ceil(( window.screen.width - winWidth )/2);
	var winTop = Math.ceil(( window.screen.width - winHeight )/2);
	var popupOption = "width=" + winWidth+ ", height=" + winHeight +", left=" + winLeft + ", winTop=" + winTop;
	var myWindow = window.open(url, "", popupOption);
}
</script>

<h1>주문 통합 관리</h1>
<hr/>

<div class="condition-container">
<form action="/placingOrder/management" method="post" id="placingOrderForm">
<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="placingOrderNo">주문번호</label></th>
		<td><input type="number" value="${placingOrderList.placingOrderNo }" id="placingOrderNo" name="placingOrderNo"/></td>
		<th class="condition"><label for="shopName">지점명</label></th>
		<td><select name="shopName" id="shopName">
		<option>역삼점</option>
		<option>강남점</option>
		<option>일산점</option>
		<option>용인점</option>
		<option>광교중앙로점</option>
		<option>남양주점</option>
		<option>성남점</option>
		<option>잠실점</option>
		
		</select></td>
		<td rowspan="3" style="vertical-align : middle;text-align:center;">
			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색</button>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="orderDate">주문기간검색</label></th>
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
		<th class="condition"><label for="categoryBase">상품카테고리</label></th>
		<td>
			<select name="categoryBase" id="categoryBase"
				class="select2-selection--single form-control">
				<option value="1">음료</option>
				<option value="2">상품</option>
				<option value="3">푸드</option>
				<option value="4">카드</option>
				
				
				
			</select>
		</td>
		<th class="condition"><label for="orderStatus">처리상태</label></th>
		<td>
			<select name="orderStatus" id="orderStatus"
				class="select2-selection--single form-control">
				<option value="1">주문완료</option>
				<option value="2">주문취소</option>
				<option value="3">보류</option>
				
				
			</select>
		</td>
	</tr>
</table>
</form>
</div>

<div style="float:right;">
	<button class="btn btn-outline-success">Excel 다운로드</button>
	<button class="btn btn-outline-primary" onclick="popupOpen()">Excel 업로드</button>
</div>
<br>
<h2>주문 리스트</h2>
<table id="myTable" class="display table table-bordered">
    <thead class="thead-dark">
        <tr>
<!--         	<th><input type="checkbox"/></th> -->
            <th>주문번호</th>
            <th>유저번호</th>
            <th>지점명</th>     
            <th>주문날짜</th>
            <th>고객요구사항</th>
            <th>진행상태</th>
            <th>주문상세정보</th>
        </tr>
    </thead>
</table>























<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
