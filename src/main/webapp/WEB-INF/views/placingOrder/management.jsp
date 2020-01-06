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
	 
	    return year + "-" + month + "-" + day;
	}
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	table = $('#myTable').DataTable({
    	"scrollY" : 200, //테이블 고정 크기 설정
    	"columnDefs" : [
    	      { width: '5%', targets : [0] },
    	      { width: '7%', targets : [1] },
    	      { width: '15%', targets : [2] },
    	      { width: '15%', targets : [3] },
    	      { width: '15%', targets : [4] },
    	      { width: '15%', targets : [5] },
    	      { width: '14%', targets : [6] },
    	      { width: '14%', targets : [7] }
    	],
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "에서 검색: ",
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
			"url" : "/placingOrder/search",
			"dataType":"json",
			"data" : function() {
				console.log($("#placingOrderForm").serialize())
				return $("#placingOrderForm").serialize(); //검색조건 전달
			},
			"dataSrc" : function(json){
				
				for(let i=0; i<json.data.length; i++){

					if(json.data[i][2] == "11"){
						json.data[i][2] = "강남점";
					}
					
					if(json.data[i][6] == "0"){
						json.data[i][6] = "발주완료"
					}
					
					if(json.data[i][7] == "0"){
						json.data[i][7] = "입고완료"
					}
					
				}
				console.log(json.data);
				
				return json.data;
			}
		}
    });
	
});	

function getList() {
	
	//검색조건 가져오기
// 	var formData = $("#placingOrderForm").serialize(); //검색조건
	
	 $("#myTable").DataTable().ajax.reload();
	
}

function enter(e){
	 if (e.keyCode == 13) {
		 getList();
	 }
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
		<td>
			<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control">
				<option value="">전체</option>
				<c:forEach var="shop" items="${shopList }" >
					<option value="${shop.shopNo }">${shop.shopName }</option>
				</c:forEach>
			</select>
		</td>
		<td rowspan="3" style="vertical-align : middle;text-align:center;">
			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색</button>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="startDate">발주날짜</label></th>
		<td colspan="3">
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate" value="2020-01-01">
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
				<option value="0">발주확인전</option>
				<option value="1">발주완료</option>
				<option value="2">출고대기</option>
				<option value="3">출고완료</option>
			</select>
		</td>
		<th class="condition"><label for="inStockStatus">입고상태</label></th>
		<td>
			<select name="inStockStatus" id="inStockStatus"
				class="select2-selection--single form-control">
				<option value="0">입고대기</option>
				<option value="1">입고완료</option>
			</select>
		</td>
	</tr>
</table>
</form>
</div>

<div style="float:right;">
	<button id="excelDown" class="btn btn-outline-success"  data-toggle="modal" data-target="#placingOrderModal">Excel 다운로드</button>
</div>

<table id="myTable" class="display table table-bordered" >
    <thead class="thead-dark">
        <tr>
<!--        <th><input type="checkbox"/></th> -->
            <th>no</th>
            <th>발주번호</th>
            <th>지점명</th>
            <th>발주날짜</th>
            <th>총 발주수량</th>
            <th>발주금액</th>
            <th>발주상태</th>
            <th>입고상태</th>
        </tr>
    </thead>
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<div id="placingOrderModal" class="modal fade">
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
      </div>
      <div class="modal-footer">
        <button id="downBtn" type="button" class="btn btn-primary"  onclick="location.href='/placingorder/exceldown'">확인</button>
        <button id="downBtn" type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

