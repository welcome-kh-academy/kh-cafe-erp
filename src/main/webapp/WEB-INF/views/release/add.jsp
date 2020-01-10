<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

.placingOrder-info {
	width : 30%;
	margin-right : 5%;
	float : left;
}

.placingOrder-content {
	width : 60%;
	margin-right : 5%;
	float : left;
}
#placingOrderTable th{
	width : 20%;
}
.releaseproduct-bottom button{
	margin : 20px;
}
#releaseInfoTable th, #releaseInfoTable td{
	vertical-align:middle;
}
#releaseInfoTable td input{
	width : 70%;
	height:70%;
	padding-left:10px;
}
</style>

<script type="text/javascript">
function cancel(){
	history.go(-1);
}

$(document).ready(function(){
	$("#releaseSubmit").click(function(){
		console.log("dfsfsdf")
		$("form").submit();
	});
			
});
</script>

<div class="placingOrder-info">
<fieldset>
<legend>발주 정보</legend>
<table id="placingOrderTable" class="table">
<tr>
	<th class="table-primary">발주 번호</th>
	<td>${releaseInfo.placingOrderNo }</td>
</tr>	
<tr>
	<th class="table-primary">지점명</th>
	<td>${releaseInfo.shopName }</td>
</tr>
<tr>
	<th class="table-primary">발주 일자</th>
	<td>${releaseInfo.placingOrderDate }</td>
</tr>
<tr>
	<th class="table-primary">발주 상태</th>
	<c:if test="${releaseInfo.placingOrderStatus == 2 }">
		<td>출고 대기</td> 	
	</c:if>
	<c:if test="${releaseInfo.placingOrderStatus == 3 }">
		<td>출고 완료</td> 	
	</c:if>
</tr>
<tr>
	<th class="table-primary">입고 상태</th>
	<c:if test="${releaseInfo.inStockStatus == 0 }">
		<td>입고 대기 중</td>
	</c:if>
	<c:if test="${releaseInfo.inStockStatus == 2 }">
		<td>입고 확인</td>
	</c:if>
	<c:if test="${releaseInfo.inStockStatus == 3 }">
		<td>파손</td>
	</c:if>
	<c:if test="${releaseInfo.inStockStatus == 4 }">
		<td>누락</td>
	</c:if>
</tr>

</table>
</fieldset>

</div>
<div class="release-info">
<fieldset style="min-height:710px">
<legend>출고 정보</legend>
	<form id="releaseForm" action="/release/add" method="post">
	<table id="releaseInfoTable" class="table">
		<tr class="table-primary">
			<th style="width:5%">상품 번호</th>
			<th style="width:20%">상품 명</th>
			<th style="width:5%">요청 수량</th>
			<th style="width:15%">출고 수량</th>
			<th style="width:15%">출고 가</th>
			<th style="width:10%">출고 매장</th>
			<th style="width:15%">출고 상태</th>
			<th style="width:15%">비고</th>
		</tr>
		<c:forEach items="${releaseProductList }" var="releaseProduct">
		<tr>
			<td>${releaseProduct.releaseProductNo }<input type="hidden" name="releeaseProductNo" value="${releaseProduct.releaseProductNo }"/></td>
			<td>${releaseProduct.releaseProductName }</td>
			<td>${releaseProduct.productCnt }</td>
			<td><input class="col-form-label" type="number" id="productCnt" name="productCnt" value="0" min="0" max="${releaseProduct.productCnt }"/></td>
			<td>${releaseProduct.productPrice }</td>
			<td>${releaseInfo.shopName }</td>
			<td>
				<select name="productStatus" class="form-control">
					<option value="0" selected>미출고</option>
					<option value="1">출고</option>
					<option value="2">부분 출고</option>
				</select>
			</td>
			<td><textarea name="remark" form="releaseForm"></textarea></td>
		</tr>
		</c:forEach>
	</table>
	</form>
</fieldset>
</div>

<div class="releaseproduct-bottom">
	<button type="button" class="btn btn-lg btn-outline-danger" style="margin-left:5px" onclick="cancel()">이전</button>
    <button type="button" id="releaseSubmit" class="btn btn-lg btn-outline-primary" style="float:right; margin-right:5px">출고 등록</button>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
