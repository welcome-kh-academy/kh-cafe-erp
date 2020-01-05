<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>






<h1>입고 등록</h1>
<hr>

<div class="condition-container">
<form action="/placingOrder/management" method="post" id="placingOrderForm">

<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="">상품코드</label></th>
		<td><input type="number" value="" id="" name=""/></td>
		<th class="condition"><label for="">상품명</label></th>
		<td><input type="text" value="" id="" name=""/></td>
		<th class="condition"><label for="shopName">수량</label></th>
		<td><input type="number" value="" id="" name=""/></td>
<!-- 		<td> -->
<!-- 			<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control"> -->
<!-- 				<option value="11">강남점</option> -->
<!-- 			</select> -->
<!-- 		</td> -->
<!-- 		<td rowspan="3" style="vertical-align : middle;text-align:center;"> -->
<!-- 			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색</button> -->
<!-- 		</td> -->
	</tr>

	<tr>
		<th class="condition"><label for="">카테고리기본</label></th>
		<td>
			<select name="" id=""
				class="select2-selection--single form-control">
				<option value="0">음료</option>
				<option value="1">푸드</option>
				<option value="2">상품</option>
				<option value="3">카드</option>
			</select>
		</td>
		<th class="condition"><label for="inStockStatus">카테고리상세</label></th>
		<td>
			<select name="inStockStatus" id="inStockStatus"
				class="select2-selection--single form-control">
				<option value="0">콜드 브루</option>
				<option value="1">브루드 커피</option>
				<option value="0">에스프레소</option>
				<option value="1">프라푸치노</option>
<!-- 				<option value="0">블렌디드</option> -->
<!-- 				<option value="1">스타벅스 피지오</option> -->
<!-- 				<option value="0">티바나</option> -->
<!-- 				<option value="1">기타 제조 음료</option> -->
<!-- 				<option value="0">스타벅스 주스(병음료)</option> -->
<!-- 				<option value="1">베이커리</option> -->
<!-- 				<option value="1">케이크</option> -->
<!-- 				<option value="0">따뜻한 푸드</option> -->
<!-- 				<option value="1">아이스크림</option> -->
<!-- 				<option value="1">머그</option> -->
<!-- 				<option value="0">글라스</option> -->
<!-- 				<option value="1">플라스틱 텀블러</option> -->
<!-- 				<option value="1">보온병</option> -->
<!-- 				<option value="1">액세서리</option> -->
<!-- 				<option value="1">플라스틱 텀블러</option> -->
<!-- 				<option value="1">플라스틱 텀블러</option> -->
<!-- 				<option value="1">플라스틱 텀블러</option> -->
			</select>
		</td>
		<th class="input--style-1 js-datepicker"><label for="">발주날짜</label></th>
		<td><input class="input--style-1 js-datepicker" type="text"	placeholder="" id="" name="" />
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
		
	</tr>
	<tr>
		<th class="condition"><label for="shopName">지점명</label></th>
		<td><select name="shopName" id="shopName">
		<option>역삼점</option>
		<option>강남점</option>
		<option>일산점</option>
		<option>용인점</option>
		<option>광교중앙로점</option>
		<option>남양주점</option>
		<option>성남점</option>
		<option>잠실점</option>
		
		</select></td>
		<th class="input--style-1 js-datepicker"><label for="">입고날짜</label></th>
		<td><input class="input--style-1 js-datepicker" type="text"	placeholder="" id="" name="" />
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>

<!-- 		<td> -->
<!-- 			<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control"> -->
<!-- 				<option value="11">강남점</option> -->
<!-- 			</select> -->
<!-- 		</td> -->
<!-- 		<td rowspan="3" style="vertical-align : middle;text-align:center;"> -->
<!-- 			<button type="button" class="btn btn-primary btn-lg" onclick="getList()">검색</button> -->
<!-- 		</td> -->
	</tr>
	
</table>
</form>
</div>























<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
