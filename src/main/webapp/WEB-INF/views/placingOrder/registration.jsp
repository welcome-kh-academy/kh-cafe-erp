<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<h1>발주등록</h1>
<hr/>

<style type="text/css">

.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
    
    width : 200px;
}

</style>

<script type="text/javascript">
$(document).ready( function () {

//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
});	
</script>

<div class="placingOrder-enroll">
<h4>발주 > 발주 입력</h4>
<br>
	<div style="margin: 5% 10% 0% 10%;">
		<div style="margin-bottom : 10%;">
		<h3>회사선택</h3>
		<hr/>
		<table class="table table-bordered">
			<tr>
				<td class="condition">지점명</td>
				<td>본사</td>
			</tr>
			<tr>
				<td class="condition">발주타입</td>
				<td>
					<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control">
						<option value="">전체</option>
						<c:forEach var="shop" items="${shopList }" >
							<option value="${shop.shopNo }">${shop.shopName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		</div>
		
		<div>
		<h3>상품정보</h3>
		<hr/>
		<table class="table table-bordered">
			<tr>
				<td class="condition">판매상품 선택</td>
				<td>
					<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control">
						<option value="">전체</option>
						<c:forEach var="shop" items="${shopList }" >
							<option value="${shop.shopNo }">${shop.shopName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
