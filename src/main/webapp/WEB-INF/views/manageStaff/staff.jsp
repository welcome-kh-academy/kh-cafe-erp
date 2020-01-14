<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<body>
<h2> 직원 관리 </h2>


<table id="myTable" class="display table table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>지점</th>
			<th>직원등급</th>
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
		
		<c:forEach items="${staffList}"  var="staffList">        
		                        
		<tr>
		<td>${staffList.shopName}</td>
			
		<c:if test="${staffList.position==1}" >
			<td>직원</td>
			
		</c:if>
		<c:if test="${staffList.position==2}" >
			<td><font color = "blue">지점장</font></td>
		</c:if>
		<c:if test="${staffList.position==3}" >
			<td><font color = "red">본사</font></td>
		</c:if>		
		<td>${staffList.staffNo}</td>
		<td>${staffList.staffName}</td>
		<td>${staffList.gender}</td>
		<td>${staffList.status}</td>
		<td>${staffList.hiredDate}</td>
		<td>${staffList.leaveDate}</td>
		<td>${staffList.email}</td>
		<td>${staffList.cellNum}</td>
		<td>${staffList.salary}</td>
		
		</tr>
		</c:forEach>
	</thead>
</table>

</body>
