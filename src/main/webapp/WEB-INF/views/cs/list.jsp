<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
table {
	text-align : center;
	border-bottom : 1px solid #ccc;
}
th {
	text-align : center;
}
tr td:nth-child(2) {
	text-align : left;
}
tr td:not(:first-child) {
	border-left : 1px solid #ccc;
}
div {
	text-align : center;
}
legend{
	text-align:left;
}
#wrapper{
	margin : auto;
	width : 75%;
	margin-top : 20px;
}
</style>

<fieldset>
	<legend class="text-primary">상담 내역</legend>
	<form action="/cs/list" method="get">
	<div style="margin: 1%; margin-right:0px; float: right; display:flex">
		<select class="form-control" name="searchType" style="margin-right:5px; width:130px">
   			<option value="cBoardNo">글 번호</option>
   			<option value="cBoardTitle">제목</option>
   			<option value="shopName">지점명</option>
   			<option value="cusId">고객 아이디</option>
   			<option value="staffName">작성자</option>
		</select>
	<input class="form-control" type="text" id="searchContent" name="searchContent" style="margin-left:5px;width:235px">
	<button class="btn btn-primary btn-sm"  style="margin-left:5px;">검색</button>
	</div>
	</form>

<table class="table">
	<tr class="table-primary">
		<th style="width:5%">No</th>
		<th style="width:40%">제목</th>
		<th style="width:15%">지점</th>
		<th style="width:15%">고객 아이디</th>
		<th style="width:10%">작성자</th>
		<th style="width:15%">작성일</th>

	</tr>
	<c:forEach items="${list }" var="list">
	<tr>
		<td>${list.cBoardNo }</td>
		<td><a class="text-primary" href="/cs/view?cBoardNo=${list.cBoardNo }">${list.cBoardTitle }</a></td>
		<td>${list.shopName }</td>
		<td>${list.cusId }</td>
		<td>${list.staffName }</td>
		<td>${list.cBoardDate }</td>
	</tr>
	</c:forEach>
</table>
</fieldset>
<button class="btn btn-primary" onclick="location.href='/cs/write'" style="float:right">글쓰기</button>

<jsp:include page="/WEB-INF/views/cs/paging.jsp"/>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>






















