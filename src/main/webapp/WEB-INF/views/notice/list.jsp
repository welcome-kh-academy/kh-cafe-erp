<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
		
	//검색 버틀 클릭
	$("#btnSearch").click(function() {
		location.href="/notice/list?search="+$("#search").val();
	});
	
});
</script>

<style type="text/css">
table, th {
	text-align: center;
}



</style>

<div class="container">
<h1>공지사항 게시판</h1>

<hr>

<table class="table">

	<tr>
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
 	<td>${notice.shopNo }</td>
	<td>${notice.staffName }</td>
	<td>${notice.nBoardDate }</td>
</tr>
</c:forEach>

</table>

<span class="pull-left">total : ${paging.totalCount }</span>

<button class="btn btn-primary" id="btnWrite" onclick="location.href='/notice/write'" style="float: right">글쓰기</button>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" />
	<button id="btnSearch" class="btn">검색</button>
</div>

</div><!-- 컨테이너 끝  -->

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
