<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<h1>발주등록</h1>
<hr/>

<style type="text/css">

.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}

.placingOrder-info {
	width : 30%;
	margin-right : 5%;
	float : left;
}

.placingOrder-content {
	width : 60%;
	margin-right : 5%;
	float : left;
}

</style>


<div class="placingOrder-info">
<h3>발주 정보</h3>
<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="placingOrderNo">발주번호</label></th>
		<td><input type="number" value="${placingOrderList.placingOrderNo }" id="placingOrderNo" name="placingOrderNo"/></td>
	</tr>
	<tr>
		<th class="condition"><label for="startDate">발주날짜</label></th>
		<td>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="placingOrderStatus">발주상태</label></th>
		<td>
		</td>
	</tr>
</table>

</div>
<div class="placingOrder-content">
<h3>발주 내용</h3>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
