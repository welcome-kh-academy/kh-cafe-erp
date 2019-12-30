<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<link href="/resources/css/add-product.css" rel="stylesheet">

<style type="text/css">

/* 헤더( 빵부스러기) */
#crumbs ul li #productHeader_1 {
	background-color: #2C3E50;
	color: #fff;
}

.search-product {
	width: 30%;
	float: left;
	margin: 1%;
}

.search-category {
	width: 30%;
	float: left;
	margin: 1%;
}

.search-category-detail {
	width: 30%;
	float: left;
	margin: 1%;
}
</style>

<script type="text/javascript">
   function getCategoryDetail(e){
      var value = document.getElementById('categoryBase').value;
      console.log(value)
      $.ajax({
         type : "GET",
         url : "/product/getCategoryDetail",
         data : {
            value : value
         },
         dataType : "json",
         error : function() {
            alert("ajax오류!");
         },
         success : function(res) {
            $("#categoryDetail").html("");
            
            if(res.categoryDetailList.length == 0)
            	$("#categoryDetail").append("<option>--------</option>");
            
            for(var i=0; i<res.categoryDetailList.length;i++){
               $("#categoryDetail").append("<option value='"+res.categoryDetailList[i].categoryMapNo+"'>"+res.categoryDetailList[i].categoryDetailName+"</option>");
            }
         }
      });
   }

</script>

<!-- 헤더 -->
<div id="crumbs">
	<ul>
		<li><a id=productHeader_1 href="#1"><b>카테고리 등록</b></a></li>
		<li><a id=productHeader_2 href="#2"><b>상품기초정보등록</b></a></li>
		<li><a id=productHeader_3 href="#3"><b>상품 옵션 등록</b></a></li>
		<li><a id=productHeader_4 href="#4"><b>판매 지점 등록</b></a></li>
	</ul>
</div>

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

<form class="addProductForm" action="/product/saveCategoryMap" method="post">
<div class="search-category">
<h3>카테고리 등록</h3>
<select name="categoryNo" id="categoryBase" onchange="getCategoryDetail(this.value)" class="search-select select2-selection select2-selection--single form-control">
	<option value="0">--------</option>
	<c:forEach items="${categoryList}" var="category">
		<option value="${category.categoryNo }">${category.categoryName }</option>	
	</c:forEach>
</select>
</div>

<div class="search-category-detail">
<h3>세부 카테고리 등록</h3>
<select name="categoryMapNo" id="categoryDetail" class="search-select select2-selection select2-selection--single form-control">
	<option>-------</option>
</select>
</div>
</form>

</div>

<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>

