<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

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

<h1>발주등록</h1>
<hr/>

<div class="placingOrder-info">
<h3>출고 정보</h3>
<table class="table">
<tr>
	<td class="thead-dark">발주일자</td>
	<td></td>
</tr>	
<tr>	
	<td class="thead-dark">출고일자</td>
	<td></td>
</tr>
<tr>
	<td>지점명</td>
	<td></td>
</tr>
<tr>
	<td>요청자</td>
	<td></td>
</tr>
<tr>
	<td>담당부서</td>
	<td></td>
</tr>
<tr>
	<td>창고명</td>
	<td></td>
</tr>

</table>


</div>
<div class="placingOrder-content">
<h3>발주 내용</h3>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
