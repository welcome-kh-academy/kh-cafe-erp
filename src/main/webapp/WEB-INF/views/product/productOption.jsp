<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">
table{
	width : 90%;
}
td div{
	margin : 0px 20px;
}
fieldset, #optionList, #product{
	margin : 20px 20px;
}
.form-check-input{
	margin-left:10px;
}
.right{
	float:right;
	width : 50%;
	border : 1px solid black;
}
.left{
	float:left;
	width : 45%;
	border : 1px solid black;
}
</style>

<div id="manageOption" style="margin : 10px; height:230px">
	<form action="/product/option/register" method="post">
	<fieldset>
		<legend class="text-info">상품 옵션 등록</legend>
		<table>
			<tr style="height:10px"><td></td></tr>
			<tr>
				<td>
					<div>
						<label for="productOptionName">옵션 이름</label>
						<input type="text" class="form-control" id="productOptionName">
					</div>
				</td>
				<td>
					<div>
						<label for="optionValue">상품 사이즈</label>
						<input type="text" class="form-control" id="optionValue">
					</div>
				</td>
				<td>
					<div>
						<label for="productCnt">상품 수량</label>
						<input type="number" class="form-control" id="productCnt">
					</div>
				</td>
			</tr>
		</table>
	</fieldset>
	<input type="button" id="resetOption" value="초기화"/>
	<button>등록</button>
	</form>
</div>

<div id="product" class= "left">

</div>

<div id="optionList" class="right">
	<fieldset>
		<legend class="text-info">상품 옵션 목록</legend>
		<table class="table">
			<tr class="table-info">
				<th><input class="form-check-input" type="checkbox" name="selectAll"/></th>
				<th>옵션번호</th>
				<th>옵션 이름</th>
				<th>상품 사이즈</th>
			</tr>
			<c:forEach items="${optionList }" var="option">
				<tr>
					<td><input class="form-check-input" type="checkbox" name="selected" value="${option.productOptionNo }"/></td>
					<td>${option.productOptionNo }</td>
					<td>${option.productOptionName }</td>
					<td>${option.optionValue }</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>