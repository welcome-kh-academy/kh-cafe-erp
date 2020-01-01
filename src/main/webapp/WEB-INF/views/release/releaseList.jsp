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
fieldset, #releaseList, #searchRelease{
	margin : 20px;
}
</style>

<div id="searchRelease" style="margin : 10px; height:230px">
	<form action="/product/option/register" method="post">
	<fieldset>
		<legend class="text-primary">상품 출고 관리</legend>
		<table>
			
		</table>
	</fieldset>
	</form>
</div>

<div id="releaseList" style="overflow:auto; height:436px">
	<fieldset>
		<legend class="text-primary">상품 출고 목록</legend>
			<table class="table">
			<tr class="table-primary">
				<th>No</th>
				<th>지점명</th>
				<th>상품명</th>
				<th>상태</th>
				<th></th>
			</tr>
<%-- 			<c:forEach items="${optionList }" var="option" varStatus="status"> --%>
<!-- 				<tr class="appendTable"> -->
<!-- 					<td style="width:10%"> -->
<%-- 						${option.rnum } --%>
<%-- 						<input type="hidden" id="optionNo" name="optionNo" value="${option.optionNo }"/> --%>
<!-- 					</td> -->
<%-- 					<td style="width:55%">${option.optionName }	</td> --%>
<%-- 					<td style="width:25%">${option.optionValue }</td> --%>
<!-- 					<td style="width:10%"><button class="btn btn-primary btn-sm optionDelete">삭제</button></td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
			</table>
	</fieldset>
</div>

<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>