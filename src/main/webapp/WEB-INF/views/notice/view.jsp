<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
	
});
</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>

<div class="container">

<h1 class="pull-left">공지사항</h1>

<hr>

<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td colspan="3">${view.nBoardNo }</td>
</tr>

<tr>
<td class="info">작성자</td><td>${view.staffName }</td>
<td class="info">작성일</td><td>${view.nBoardDate }</td>
</tr>

<tr>
<td class="info">지점</td><td>${view.shopNo }</td>
<td class="info">제목</td><td colspan="3">${view.nBoardTitle }</td>
</tr>

<tr><td class="info"  colspan="4">본문</td></tr>

<tr><td colspan="4">${view.nBoardContent }</td></tr>

</table>

<!-- 버튼 영역 -->
<div class="text-center" style="float: right;">
	<a href="/notice/list"><button class="btn btn-success">목록</button></a>
	<c:if test="${staffNo eq view.staffNo }">
		<a href="/notice/update?nBoardNo=${view.nBoardNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/notice/delete?nBoardNo=${view.nBoardNo }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div><!-- 버튼 영역 end -->

</div><!-- .container -->

</body>
</html>