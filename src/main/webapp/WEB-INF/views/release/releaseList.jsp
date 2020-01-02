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
fieldset, #divReleaseList, #divSearchRelease{
	margin : 20px;
}
</style>

<script type="text/javascript">
$(document).ready( function () {
    $('#releaseListTable').DataTable();
    
} );
</script>

<div id="divSearchRelease" style="margin : 10px; height:230px">
	<form action="/product/option/register" method="post">
	<fieldset>
		<legend class="text-primary">상품 출고 관리</legend>
		<table>
			
		</table>
	</fieldset>
	</form>
</div>

<div id="divReleaseList">
	<fieldset>
		<legend class="text-primary">상품 출고 목록</legend>
			<table class="table" id="releaseListTable">
			<tr class="table-primary">
				<th>출고번호</th>
				<th>발주번호</th>
				<th>지점명</th>
				<th>상태</th>
				<th>출고일</th>
				<th></th>
			</tr>
			<c:forEach items="${releaseList}" var="release">
				<tr>
					<td>${release.releaseNo }</td>
					<td>${release.placingOrderNo }</td>
					<td>${release.shopName }</td>
					<td>${release.releaseStatus }</td>
					<td>${release.releaseDate }</td>
					<td><button type="button" class="btn btn-primary">출고 등록하기</button></td>
				</tr>
			</c:forEach>
			</table>
	</fieldset>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>