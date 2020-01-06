<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
table{
	width : 90%;
}
td div{
	margin : 0px 20px;
	margin-bottom:5px;
}
fieldset, .divReleaseList, .divSearchRelease{
	margin : 20px;
}
.divReleaseList tr td:nth-child(6){
	text-align:center;
}
</style>

<script type="text/javascript">
window.name="listPage"
$(document).ready( function () {
	
	var startDate = getPastDate(1);
	var endDate = getRecentDate();
	 
// 	$("#startDate").val(startDate);
// 	$("#endDate").val(endDate);
	 
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
	
	var curPage = 1; //페이지 변수를 1로 초기화
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	table = $('#myTable').DataTable({
    	"scrollY" : 400, //테이블 고정 크기 설정
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language" : {
    		search: "빠른검색 ", //한글
    		"emptyTable": "출고 목록이 존재하지 않습니다."
    	},
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"bPaginate" : true, //페이징 처리를 할 것인가
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	"bInfo" : false,
    	"columnDefs": [{
    		   "targets": -1,
    		   "data": null,
    		   "render": function(data, type, row){
    		    return '<button class="btn btn-primary" onclick="#">출고 등록</button>';
    	},
    	"orderable": false }],
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	ajax : {
			"type" : "GET",
			"url" : "/release/search",
			"dataType":"json",
			"data" : function() {
				console.log($("#releaseForm").serialize())
				return $("#releaseForm").serialize(); //검색조건 전달
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
});	


function popupOpen(){
	var url ="/release/popExcel";
	var winWidth = 500;
	var winHeight = 300;
	var winLeft = Math.ceil(( window.screen.width - winWidth )/2);
	var winTop = Math.ceil(( window.screen.width - winHeight )/2);
	var popupOption = "width=" + winWidth+ ", height=" + winHeight +", left=" + winLeft + ", winTop=" + winTop;
	var myWindow = window.open(url, "", popupOption);
}

function getList() {
	
	//검색조건 가져오기
// 	var formData = $("#placingOrderForm").serialize(); //검색조건
	
	 $("#myTable").DataTable().ajax.reload();
	
}
</script>

<div class="divSearchRelease" style="margin : 10px; height:230px">
	<fieldset>
		<legend class="text-primary">상품 출고 관리</legend>
		<form action="/release/search" method="post" id="releaseForm">
		<table class="table">
			<tr>
				<th class="condition"><label for="releaseNo">출고번호</label></th>
				<td><input type="number" value="" id="releaseNo" name="releaseNo"/></td>
				<td></td>
				<td></td>
				<th class="condition"><label for="placingOrderNo">발주번호</label></th>
				<td><input type="number" value="" id="placingOrderNo" name="placingOrderNo"/></td>
			</tr>
			<tr>
			<th class="condition"><label for="shopName">지점명</label></th>
			<td>
				<select name="shopNo" id="shopNo" class="select2-selection--single form-control">
					<option value="">전체</option>
					<c:forEach var="shop" items="${shopList }">
						<option value="${shop.shopNo }">${shop.shopName }</option>
					</c:forEach>
				</select>
			</td>
			<td></td>
			<td></td>
			<th class="condition"><label for="startDate">출고일</label></th>
			<td colspan="3">
				<input class="input--style-1 js-datepicker" type="text"
					placeholder="" id="startDate" name="startDate" value="">
				<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
				<span class="space">~</span> 
				<input class="input--style-1 js-datepicker" type="text"
					placeholder="" id="endDate" name="endDate">
				<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			</td>
			</tr>
			<tr>
				<th class="condition"><label for="releaseStatus">출고상태</label></th>
				<td>
					<select name="releaseStatus" id="releaseStatus" class="select2-selection--single form-control">
						<option value="" selected>출고 상태</option>
						<option value="0">출고 전</option>
						<option value="1">출고 완료</option>
					</select>
				</td>
				<td></td>
				<td></td>
				<td colspan="2" style="text-align:center;">
					<button  style="width:350px; height:40px" type="button" class="btn btn-primary" onclick="getList()">검색</button>
				</td>
			</tr>
		</table>
	</form>
	</fieldset>
</div>




<div class="divReleaseList">
<fieldset>
	<legend class="text-primary">상품 출고 목록</legend>
	<div>
	</div>
	<div style="float:right;">
		<button class="btn btn-outline-success" data-toggle="modal" data-target="#releaseModal">Excel 다운로드</button>
		<button class="btn btn-outline-primary" onclick="popupOpen()">Excel 업로드</button>
	</div>
	<table id="myTable" class="display table table-bordered">
    	<thead class="thead-dark">
        	<tr class="table-primary">
				<th width="15%">출고번호</th>
				<th width="15%">발주번호</th>
				<th width="15%">지점명</th>
				<th width="20%">상태</th>
				<th width="20%">출고일</th>
				<th width="15%"></th>
			</tr>
    	</thead>	
	</table>
</fieldset>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<div id="releaseModal" class="modal fade">
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
        <button id="downBtn" type="button" class="btn btn-primary"  onclick="location.href='/release/exceldown'">확인</button>
        <button id="downBtn" type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>