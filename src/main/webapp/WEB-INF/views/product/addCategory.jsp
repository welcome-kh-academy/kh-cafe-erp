<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<jsp:include page="/WEB-INF/views/layout/product-header.jsp"/>

<style type="text/css">
	.search-product {
		width : 30%;
		float : left;
		margin : 1%;
	}
	.search-category {
		width : 30%;
		float : left;
		margin : 1%;
	}
	.search-category-detail {
		width : 30%;
		float : left;
		margin : 1%;
	}

	.product-bottom {
		margin : 2%;
		margin-top: 50%;
		float : right;
	}

</style>

<div>
<h1>카테고리 등록</h1>
<hr/>

<div class="search-product">
<h3>상품검색</h3>
<div class="input-group input-group-lg">
  <span class="input-group-addon">
    <i class="fa fa-search"></i>
  </span>
  <input class="form-control" type="text" placeholder="상품 검색">
</div>
</div>

<div class="search-category">
<h3>카테고리 등록</h3>
<select class="search-select select2-selection select2-selection--single form-control">
	<c:forEach items="${categoryList}" var="category">
		<option>${category.categoryName }</option>	
	</c:forEach>
</select>
</div>

<div class="search-category-detail">
<h3>세부 카테고리 등록</h3>
<select class="search-select select2-selection select2-selection--single form-control">
	<c:forEach items="${categoryList}" var="category">
		<option>${category.categoryName }</option>	
	</c:forEach>
</select>
</div>

</div>

<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>

