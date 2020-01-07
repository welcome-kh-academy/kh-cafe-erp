<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>


<h1>입고 등록</h1>
<hr>

<div class="condition-container">

<form action="/warehousing/registration" method="post" id="warehousingForm">

<table class="table table-bordered">

	<tr>
		<th class="condition"><label for="instockNo">입고번호</label></th>
		<td><input type="number" id="inStockNo" name="inStockNo"/></td>
		<th class="condition"><label for="inStockDate">입고날짜</label></th>
		<td><input type="text" id="inStockDate" name="inStockDate"/></td>
		
		<th class="condition"><label for="shopNo">지점명</label></th>
		<td><select name="shopNo" id="shopNo">
		<option value="10">역삼점</option>
		<option value="11">강남점</option>
		<option value="12">일산점</option>
		<option value="13">용인점</option>
		<option value="14">광교중앙로점</option>
		<option value="15">남양주점</option>
		<option value="16">성남점</option>
		<option value="17">잠실점</option>
		
		</select></td>
	</tr>

	<tr>
		<th class="condition"><label for="ingredientName">원자재</label></th>
		<td>
			<select name="ingredientName" id="ingredientName"
				class="select2-selection--single form-control">
				<option >원자재1</option>
				<option >원자재2</option>
				<option >원자재3</option>
				<option >원자재4</option>
			</select>
		</td>

		<th class="condition"><label for="ingredientPrice">원자재 가격</label></th>
		<td><input type="number" value="" id="ingredientPrice" name="ingredientPrice"/></td>
		<th class="condition"><label for="productCnt">수량</label></th>
		<td><input type="number" value="" id="productCnt" name="productCnt"/></td>

	</tr>
	
</table>
<input type="submit" value="등록 ">
</form>
</div>























<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
