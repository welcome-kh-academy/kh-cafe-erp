<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<body>
<h1> 직원 관리 </h1>

<h2>주문 리스트</h2>
<table id="myTable" class="display table table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>지점명</th>
			<th>직원번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>상태</th>
			<th>입사날짜</th>
			<th>퇴사날짜</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>급여</th>
		</tr>
	</thead>
</table>

</body>
