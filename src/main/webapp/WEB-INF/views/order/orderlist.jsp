<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.condition {
	color: #FFFFFF;
	background-color: #2C3E50;
	border-color: #DEE2E6;
}

.condition-container {
	margin: 20px;
}

.space {
	margin-left: 20px;
	margin-right: 20px;
}

.btn-lg {
	width: 100%;
	height: 70px;
}
</style>

<script type="text/javascript">
// datatable
$(document).ready( function () {
	var orderno=0;
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
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	table = $('#myTable').DataTable({
    	"scrollY" : 200, //테이블 고정 크기 설정
		"columnDefs": [{
    		   "targets": -1,
    		   "data": null,
    		   "render": function(data, type, row){
    			   return '<button class="btn btn-primary" name = "detailBtn">상세보기</button>';
    		   },
    	"orderable": false }],
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "빠른검색 : ",
            "emptyTable": "발주 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
            	"first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            }
        },
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	ajax : {
			"type" : "GET",
			"url" : "/order/search",
			"dataType":"json",
			"data" : function() {
				console.log($("#orderForm").serialize())
				return $("#orderForm").serialize(); //검색조건 전달
			},
			"dataSrc" : function(json){
				
// 				for(let i=0; i<json.data.length; i++){

// 					if(json.data[i][2] == "11"){
// 						json.data[i][2] = "강남점";
// 					}
					
// 					if(json.data[i][6] == "0"){
// 						json.data[i][6] = "발주완료"
// 					}
					
// 					if(json.data[i][7] == "0"){
// 						json.data[i][7] = "입고완료"
// 					}
					
// 				}
// 				console.log(json.data);
				
				return json.data;
			}
		}
        
       
    });
	$('#myTable').on('click', 'button[name="detailBtn"]' , function(){
    	var outlayId = table.row($(this).parents('tr:first')).data()
    	orderNo=outlayId[0]
    	console.log(orderNo)
    	
    	detailview(orderNo)
    	
    	
    });
});	

function getList() {
	
	//검색조건 가져오기
//	var formData = $("#OrderForm").serialize(); //검색조건
	// ajax 한 번 더 실행
	 $("#myTable").DataTable().ajax.reload();
	
}

function enter(e){
	 if (e.keyCode == 13) {
		 getList();
	 }
}
		 
//팝업창 2/3지점 띄우기
function detailview(orderNo){
	var popupX = (document.body.offsetWidth / 2) - 500;
		 	
	var popupY= (document.body.offsetHeight / 2) - 300;
		 	
	window.open("/order/detailview?orderNo="+orderNo,"","width=1000, height=100, resizable=no, scrollbars=no"+", left="+ popupX + ", top="+ popupY)
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
<hr />

<div class="condition-container">
	<form action="/order/search" method="post" id="orderForm">
		<table class="table table-bordered">
			<tr>
				<th class="condition"><label for="orderNo">주문번호</label></th>
				<td><input type="number" 
					id="orderNo" name="orderNo" /></td>
				<th class="condition"><label for="shopName">지점명</label></th>
				<td><select name="shopNo" id="shopNo"
					class="search-select select2-selection select2-selection--single form-control">
						<option value="">전체</option>
						<c:forEach var="shop" items="${shopList }">
							<option value="${shop.shopNo }">${shop.shopName }</option>
						</c:forEach>
				</select></td>
				<td rowspan="3" style="vertical-align: middle; text-align: center;">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="getList()">검색</button>
				</td>
			</tr>
			<tr>
				<th class="condition"><label for="orderDate">주문기간검색</label></th>
				<td colspan="3"><input class="input--style-1 js-datepicker"
					type="text" placeholder="" id="startDate" name="startDate">
					<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
					<span class="space">~</span> <input
					class="input--style-1 js-datepicker" type="text" placeholder=""
					id="endDate" name="endDate"> <i
					class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i></td>
			</tr>
			<tr>
				<th class="condition"><label for="categoryBase">상품카테고리</label></th>
				<td><select name="categoryBase" id="categoryBase"
					class="select2-selection--single form-control">
						<option value="1">음료</option>
						<option value="2">상품</option>
						<option value="3">푸드</option>
						<option value="4">카드</option>


<!-- 호로로로로롤 -->
				</select></td>
				<th class="condition"><label for="orderStatus">처리상태</label></th>
				<td><select name="orderStatus" id="orderStatus"
					class="select2-selection--single form-control">
						<option value="1">주문완료</option>
						<option value="2">주문취소</option>
						<option value="3">보류</option>


				</select></td>
			</tr>
		</table>
	</form>
</div>

<div style="float: right;">
	<button class="btn btn-outline-success" data-toggle="modal" data-target="#orderModal">Excel 다운로드</button>
	<button class="btn btn-outline-primary" onclick="popupOpen()">Excel
		업로드</button>
</div>
<br>
<h2>주문 리스트</h2>
<table id="myTable" class="display table table-bordered">
	<thead class="thead-dark">
		<tr>
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


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

<div id="orderModal" class="modal fade">
	<div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">엑셀 다운로드</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>엑셀을 다운받으시겠습니까?</p>
        <p>경로 : D:/</p>
      </div>
      <div class="modal-footer">
        <button id="downBtn" type="button" class="btn btn-primary" onclick="location.href='/order/exceldown'">확인</button>
        <button id="downBtn" type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

