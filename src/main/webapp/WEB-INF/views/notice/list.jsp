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
	<legend class="text-primary">공지 사항</legend>
	<form action="/notice/list" method="get">
	<div style="margin: 1%; margin-right:0px; float: right; display:flex">
		<select class="form-control" name="searchType" style="margin-right:5px; width:130px">
   			<option value="nBoardNo">글 번호</option>
   			<option value="nBoardTitle">제목</option>
   			<option value="shopName">지점명</option>
   			<option value="staffName">작성자</option>
		</select>
	<input class="form-control" type="text" id="searchContent" name="searchContent" style="margin-left:5px;width:235px">
	<button class="btn btn-primary btn-sm"  style="margin-left:5px;">검색</button>
	</div>
	</form>

<table class="table">
	<tr class="table-primary">
		<th style="width: 10%">글번호</th>
		<th style="width: 10%">제목</th>
		<th style="width: 10%">지점</th>
		<th style="width: 10%">작성자</th>
		<th style="width: 10%">작성일</th>
	</tr>
	<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.nBoardNo}</td>
		<td><a href="/notice/view?nBoardNo=${notice.nBoardNo }">${notice.nBoardTitle}</a></td>
 		<td>${notice.shopName }</td>
		<td>${notice.staffName }</td>
		<td>${notice.nBoardDate }</td>
	</tr>
	</c:forEach>
</table>
</fieldset>
<button class="btn btn-primary" onclick="location.href='/notice/write'" style="float:right">글쓰기</button>

<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>























