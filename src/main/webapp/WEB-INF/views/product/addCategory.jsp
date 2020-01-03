<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<!-- 브래드크럼 스타일 지정 -->
<link href="/resources/css/add-product.css" rel="stylesheet">
<script src=""></script>

<style type="text/css">

/*브레드크럼 스타일 지정*/
#crumbs ul li #productHeader_1 {
	background-color: #2C3E50;
	color: #fff;
}

#crumbs ul li #productHeader_1:after {
	border-left: 40px solid #2C3E50;
}
/* ------------- */

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

	// 	폼 유효성 검사
	function form_check() {
		if (fr.categoryNo.value == "0") {
			warningModal("카테고리를(을) 입력해 주세요.");
			fr.categoryNo.focus();
			return false;
		}

		else if (fr.categoryMapNo.value == "0") {
			warningModal("세부 카테고리를(을) 입력해 주세요.");
			fr.categoryMapNo.focus();
			return false;
		}
		else
			return true;
	}

	//상품으로 카테고리 검색
	function searchByPrd(e) {
		var value = document.getElementById('searchByPrd').value;
		console.log(value)
		$
				.ajax({
					type : "GET",
					url : "/product/getCategoryByPrd",
					data : {
						value : value
					},
					dataType : "json",
					error : function() {
						alert("ajax오류!");
					},
					success : function(res) {
						
						$("#categoryBase").html("");
						$("#categoryDetail").html("");

						if (res.length == 0){
							$("#categoryBase").append("<option>--------</option>");
							$("#categoryDetail").append("<option>--------</option>");
						} 
						else {
							$("#categoryBase")
							.append(
									"<option value='"+res.category.CATEGORYNO+"'>"
											+ res.category.CATEGORYNAME
											+ "</option>");
							
							$("#categoryDetail")
							.append(
									"<option value='"+res.category.CATEGORYMAPNO+"'>"
											+ res.category.CATEGORYDETAILNAME
											+ "</option>");
						}
				}
				});
	}
	
	function getCategoryDetail(e) {
		var value = document.getElementById('categoryBase').value;
		console.log(value)
		$
				.ajax({
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

						if (res.categoryDetailList.length == 0)
							$("#categoryDetail").append(
									"<option>--------</option>");

						for (var i = 0; i < res.categoryDetailList.length; i++) {
							$("#categoryDetail")
									.append(
											"<option value='"+res.categoryDetailList[i].categoryMapNo+"'>"
													+ res.categoryDetailList[i].categoryDetailName
													+ "</option>");
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
<h3>상품검색<i class="fa fa-search"></i></h3>
<select name="searchByPrd" id="searchByPrd" onchange="searchByPrd(this.value)" class="search-select select2-selection select2-selection--single form-control">
	<c:forEach items="${prdList}" var="prd">
		<option value="${prd.categoryMapNo }">${prd.productName }</option>	
	</c:forEach>
</select>
</div>

<form class="addProductForm" name="fr" action="/product/saveCategoryMap" method="post" onsubmit="return form_check()">
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

<!-- 모달창 -->
<jsp:include page="/WEB-INF/views/layout/modal.jsp"/>

<!-- footer -->
<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>
