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
<table class="table table-hover">
	<tr class="table-primary">
		<th>No</th>
		<th>제목</th>
		<th>고객 아이디</th>
		<th>작성자</th>
		<th>작성일</th>
<!-- 		<th width="10%">No</th> -->
<!-- 		<th width="40%">제목</th> -->
<!-- 		<th width="15%">고객 아이디</th> -->
<!-- 		<th width="10%">작성자</th> -->
<!-- 		<th width="25%">작성일</th> -->
	</tr>
	<c:forEach items="${list }" var="list">
	<tr>
		<td>${list.cBoardNo }</td>
		<td><a class="text-primary" href="/cs/view?cBoardNo=${list.cBoardNo }">${list.cBoardTitle }</a></td>
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






















