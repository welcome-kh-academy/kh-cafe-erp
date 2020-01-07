<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
//팝업창 2/3지점 띄우기
function prdSearch(){
	var popupX = (document.body.offsetWidth / 2) - 500;
	var popupY= (document.body.offsetHeight / 2) - 300;
	window.open("/warehousing/prdSearchPopup","","width=1000, height=100, resizable=no, scrollbars=no"+", left="+ popupX + ", top="+ popupY)
}

//datatable
$(document).ready( function () {

	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	//insert 테이블
	$('#myTable').DataTable({
		"paging" : false,
		"ordering" : true,
		"info" : true,
		"filter" : false,
		"lengthChange" : true,
		"order" : false,
		"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "빠른검색 : ",
            "emptyTable": "입고 상세 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요..."
        }
	});
	
	//검색 테이블
	$('#myTable2').DataTable({
		"paging" : false,
		"ordering" : true,
		"info" : true,
		"filter" : false,
		"lengthChange" : true,
		"order" : false,
		"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "빠른검색 : ",
            "emptyTable": "상품 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요..."
        }
	});
	
});
</script>

<style type="text/css">
.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}

.submit-form {
	width : 50%;
	float : left;
}

.button-bar {
	margin-bottom : 20px;
}
</style>

<h1>입고 등록</h1>
<hr>

<div class="submit-form">
<form action="/warehousing/registration" method="post" id="warehousingForm">
<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="instockNo">구분</label></th>
		<td><input type="hidden" id="isAutoInstock" name="isAutoInstock" value="0"/>비정규</td>
		<th class="condition"><label for="instockNo">입고번호</label></th>
		<td><input type="number" id="inStockNo" name="inStockNo"/></td>
		<th class="condition"><label for="inStockDate">입고날짜</label></th>
		<td>
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate" value="2020-01-01">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
	</tr>
	<tr>	
		<th class="condition"><label for="shopNo">거래지점</label></th>
		<td>
			<select name="shopNo" id="shopNos"
				class="select2-selection--single form-control">
			<option value="0">본사</option>
			</select>
		</td>
		<th class="condition"><label for="ingredientName">입고상태</label></th>
		<td>
			<select name="ingredientName" id="ingredientName"
				class="select2-selection--single form-control">
				<option >입고대기</option>
				<option >입고완료</option>
			</select>
		</td>
		<th class="condition"><label for="productCnt">입고창고</label></th>
		<td>
			<select name="storage" id="storage"
				class="select2-selection--single form-control">
				<option >창고1</option>
			</select>
		</td>
	</tr>
</table>
</form>
</div>

<div style="float:left; width:50%;">
<div class="button-bar">
	<button class="btn btn-outline-danger ">삭제</button>
	<button class="btn btn-outline-info" onclick="prdSearch()">상품검색</button>
</div>

<div class="submit-detail-form">
	<table id="myTable2" class="myTable table table-bordered">
		<thead class="thead-dark">
			<tr>
				<th><input type="checkbox"/></th>
				<th>상품이름</th>
				<th>이미지</th>
				<th>옵션</th>
				<th>수량</th>
				<th colspan=2>단가</th>
				<th>금액</th>
				<th colspan=2>부과세</th>
			</tr>
		</thead>
	</table>
</div>
</div>

<div class="submit-detail-form">
<h3>입고 상세 목록</h3>
<hr/>
	<table id="myTable" class="myTable table table-bordered">
		<thead class="thead-dark">
			<tr>
				<th><input type="checkbox"/></th>
				<th>상품번호</th>
				<th>옵션번호</th>
				<th>상품코드</th>
				<th>상품</th>
				<th>옵션</th>
				<th>입고로케이션</th>
				<th>수량</th>
				<th colspan=2>단가</th>
				<th>금액</th>
				<th colspan=2>부과세</th>
			</tr>
		</thead>
	</table>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
