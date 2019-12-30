<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<link href="/resources/css/add-product.css" rel="stylesheet">

<style type="text/css">

#crumbs ul li #productHeader_3 {
  background-color: #2C3E50;
  color: #fff;
}

table{
	width : 90%;
}
td div{
	margin : 0px 20px;
	margin-bottom:5px;
}
fieldset, #optionList, #product{
	margin : 18px 20px;
}
.form-check-input{
	margin-left:10px;
}
.right{
	float:right;
	width : 50%;
/* 	border : 1px solid black; */
}
.left{
	float:left;
	width : 45%;
/* 	border : 1px solid black; */
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var cnt = parseInt($("#count").val());
	$("#optionSubmit").click(function(){
		var categoryNo = $("#categoryNo").val();
		var optionName = $("#optionName").val();
		var optionValue = $("#optionValue").val();		
		
		$.ajax({
			type : "POST",
			url : "/product/option/register",
			data : {
				categoryNo : categoryNo,
				optionName : optionName,
				optionValue : optionValue
			},
			dataType : "json",
			error : function(){
				alert("오류오류")
			},
			success : function(res) {
				console.log(res.optionList[0])
				cnt = cnt + 1;
				$("#optionList .table").append("<tr>"
						+"<td style='width:10%'></td>"
// 						+"<td style='width:55%'>"+optionName+"<input type='hidden' id='optionName' name='optionName' value='"+optionName+"'/></td>"
						+"<td style='width:55%'>"+optionName+"<input type='hidden' id='optionName${status.count}' name='optionName"+cnt+"' value='"+optionName+"'/></td>"
// 						+"<td style='width:25%'>"+optionValue+"<input type='hidden' id='optionValue$' name='optionValue' value='"+optionValue+"'/></td>"
						+"<td style='width:25%'>"+optionValue+"<input type='hidden' id='optionValue${status.count}' name='optionValue"+cnt+"' value='"+optionValue+"'/></td>"
						+"<td style='width:10%'><button class='btn btn-primary btn-sm optionDelete'>삭제</button></td></tr>");
				$("#optionName").val("");
				$("#optionValue").val("");
// 				$("#count").attr("value", cnt);
			}
		});
	});

	$('#optionList .table').on("click",".optionDelete", function(){
		$(this).parent().parent().remove();
// 		cnt = cnt -1;
// 		$("#count").attr("value", cnt);
	})
});
</script>

<!-- 상품 헤더 -->
<div id="crumbs">
	<ul>
		<li><a id=productHeader_1 href="#1"><b>카테고리 등록</b></a></li>
		<li><a id=productHeader_2 href="#2"><b>상품기초정보등록</b></a></li>
		<li><a id=productHeader_3 href="#3"><b>상품 옵션 등록</b></a></li>
		<li><a id=productHeader_4 href="#4"><b>판매 지점 등록</b></a></li>
	</ul>
</div>

<div id="manageOption" style="margin : 10px; height:230px">
	<form action="/product/option/register" method="post">
	<fieldset>
		<legend class="text-primary">상품 옵션 등록</legend>
		<table>
			<tr style="height:10px"><td></td></tr>
			<tr>
				<td>
					<div>
						<label for="categoryBase">카테고리</label>
						<input type="text" class="form-control" id="categoryBase" value="${addProduct.categoryName }" disabled>
						<input type="hidden" class="form-control" id="categoryNo" value="${addProduct.categoryNo }" />
					</div>
				</td>
				<td>
					<div>
						<label for="categoryDetail">상세 카테고리</label>
						<input type="text" class="form-control" id="categoryDetail" value="${addProduct.categoryDetailName }" disabled>
					</div>
				</td>
				<td>
					<div>
						<label for="productName">상품 이름</label>
						<input type="text" class="form-control" id="productName" value="${addProduct.productName }" disabled>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<label for="optionName">옵션 이름</label>
						<input type="text" class="form-control" id="optionName" name="optionName">
					</div>
				</td>
				<td>
					<div>
						<label for="optionValue">상품 사이즈</label>
						<input type="text" class="form-control" id="optionValue" name="optionValue">
					</div>
				</td>
			</tr>
		</table>
	</fieldset>
	<button class="btn btn-secondary" type="reset" style="float:right; margin-right:13px">초기화</button>
<!-- 	<button id="optionSubmit" class="btn btn-primary" style="float:right; margin-right:5px">등록</button> -->
	</form>
<!-- 	<div > -->
	<button type="submit" id="optionSubmit" class="btn btn-primary" style="float:right; margin-right:5px">추가</button>
<!-- 	</div> -->
</div>

<div id="product" class= "left" style="margin-top:30px; overflow:auto; height:440px">
	<fieldset>
		<legend class="text-primary">상품 정보</legend>
		<table class="table">
			<tr>
				<th class="table-primary" style="width:20%">카테고리</th>
				<td>${addProduct.categoryName }</td>
				<th class="table-primary" style="width:20%">상세 카테고리</th>
				<td>${addProduct.categoryDetailName }</td>				
			</tr>
			<tr>
				<th class="table-primary" style="width:20%">제품명</th>
				<td colspan="4">${addProduct.productName }</td>
			</tr>
			<tr>
				<th class="table-primary">사진</th>
				<td colspan="4"><img src="/upload/${addProduct.fileStored }" style="width:125px; height:125px"/></td>
			</tr>
			<tr>
				<th class="table-primary" style="width:20%">원가</th>
				<td>${addProduct.originPrice }</td>
				<th class="table-primary" style="width:20%">판매가</th>
				<td>${addProduct.price }</td>
			</tr>
			<tr>
				<th class="table-primary">상품 소개</th>
				<td colspan="4">${addProduct.productContent }</td>
			</tr>
		</table>
	</fieldset>
</div>

<div id="optionList" class="right" style="overflow:auto; height:436px">
	<fieldset>
		<legend class="text-primary">상품 옵션 목록</legend>
		<form class="addProductForm" action="/product/saveOptionMap" method="post">
			<table class="table">
			<tr class="table-primary">
				<th>No</th>
				<th>옵션 이름</th>
				<th>상품 사이즈</th>
				<th></th>
			</tr>
			<c:forEach items="${optionList }" var="option" varStatus="status">
				<tr class="appendTable">
					<td style="width:10%">
						${option.rnum }
					</td>
					<td style="width:55%">
						${option.optionName }
<%-- 						<input type="hidden" id="optionName" name="optionName" value="${option.optionName }"/> --%>
						<input type="hidden" id="optionName${status.count }" name="optionName${status.count }" value="${option.optionName }"/>
					</td>
					<td style="width:25%">
						${option.optionValue }
<%-- 						<input type="hidden" id="optionValue" name="optionValue" value="${option.optionValue }"/> --%>
						<input type="hidden" id="optionValue${status.count}" name="optionValue${status.count }" value="${option.optionValue }"/>
					</td>
					<td style="width:10%"><button class="btn btn-primary btn-sm optionDelete">삭제</button></td>
				</tr>
				<c:if test="${status.last }"><button style="display: none" type="button" id="count" name="count" value="${status.count}"></button></c:if>
			</c:forEach>
			</table>
		</form>
	</fieldset>
</div>
<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>