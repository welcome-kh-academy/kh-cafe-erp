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
    $('#myTable').DataTable({
    });
    
} );	

</script>

<h1>발주관리 페이지</h1>
<hr/>

<div class="condition-container">
<form action="/placingOrder/management" method="post">
<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="placingOrderNo">발주번호</label></th>
		<td><input type="text" id="placingOrderNo" name="placingOrderNo"/></td>
		<th class="condition"><label for="shopName">지점명</label></th>
		<td><input type="text" name="shopName" id="shopName"></td>
		<td rowspan="3" style="vertical-align : middle;text-align:center;">
			<button class="btn btn-primary btn-lg">검색</button>
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
        	<th><input type="checkbox"/></th>
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
    <tbody>
        <tr>
        	<td><input type="checkbox"/></td>
            <td>1</td>
            <td>1111111</td>
            <td>강남점</td>
            <td>2019-12-30</td>
            <td>30</td>
            <td>100000</td>
            <td>완료</td>
            <td>입고완료</td>
        </tr>
    </tbody>
</table>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
