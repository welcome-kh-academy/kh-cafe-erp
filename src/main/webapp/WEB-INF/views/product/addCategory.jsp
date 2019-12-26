<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<jsp:include page="/WEB-INF/views/layout/product-header.jsp"/>

<style type="text/css">
	.search-product {
		
	}

</style>

<div>
<h1>카테고리 등록</h1>
<hr/>

<div class="search-product">
<h3>상품검색</h3>
<select class="search-select select2-selection select2-selection--single form-control">
	<c:forEach items="${categoryList}" var="category">
		<option>${category.categoryName }</option>	
	</c:forEach>
</select>
</div>

<h3>카테고리 등록</h3>
<select class="search-select select2-selection select2-selection--single form-control">
	<c:forEach items="${categoryList}" var="category">
		<option>${category.categoryName }</option>	
	</c:forEach>
</select>
</div>

<!-- Custom scripts for all pages-->
<script src="/resources/js/add-product.js"></script>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>