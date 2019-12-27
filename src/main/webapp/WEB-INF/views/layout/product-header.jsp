<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<link href="/resources/css/add-product.css" rel="stylesheet">

<%-- <c:choose> --%>

<%-- <c:when test="${productHeaderNo eq '1'}">  --%>
<%-- 	<c:set var="active" value="active" /> --%>
<%-- </c:when> --%>
<%-- <c:when test="${productHeaderNo eq '2'}"> --%>

<%-- </c:when> --%>

<%-- <c:otherwise> --%>
<%-- </c:otherwise> --%>

<%-- </c:choose> --%>


<div id="crumbs">
	<ul>
		<li><a id=1 class="${active }" href="#1"><b>카테고리 등록</b></a></li>
		<li><a id=2 class="${active }" href="#2"><b>상품기초정보등록</b></a></li>
		<li><a id=3 class="${active }" href="#3"><b>상품 옵션 등록</b></a></li>
		<li><a id=4 class="${active }" href="#4"><b>판매 방식 설정</b></a></li>
		<li><a id=5 class="${active }" href="#4"><b>판매 지점 등록</b></a></li>
	</ul>
</div>

