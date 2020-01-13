<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

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
	
	
	//원자재 선택 추가
	$("#ingredientAdd").click(function(){
	var ingredientNo = document.getElementById('ingredientSelect').value;
	var ingredientCnt = document.getElementById('ingredientCnt').value;
	console.log(ingredientNo)
	console.log(ingredientCnt)
	$.ajax({
		type : "GET",
		url : "/placingOrder/addTable",
		data : {
			ingredientNo : ingredientNo
		},
		dataType : "json",
		error : function() {
			alert("ajax오류!");
		},
		success : function(res) {
				console.log(res.ingredient.ingredientNo)
			$("#ingredientAddTable").append(
				"<tr><td>"+res.ingredient.ingredientNo+"</td><td>"+res.ingredient.ingredientName+
				"</td><td>"+ingredientCnt+"</td><td>"+res.ingredient.ingredientPrice+
				"</td><td>"+res.ingredient.ingredientPrice*ingredientCnt+"</td></tr>");
			}
	
	})
	})

	
	
});	
</script>
<form action="/placingOrder/registration" method="post">
<div class="placingOrder-enroll">
	<fieldset style="margin:20px;">
		<legend class="text-primary">발주 등록</legend>
	</fieldset>
	<div style="margin: 5% 10% 0% 10%;">
		<div style="margin-bottom : 10%;">
		<h3>지점 선택</h3>
		<hr/>
		<table class="table table-bordered">
			<tr>
				<td class="condition">거래처</td>
				<td>본사</td>
				<td class="condition">발주처</td>
				<td>
					<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control">
						<option value="">지점</option>
						<c:forEach var="shop" items="${shopList }" >
							<option value="${shop.shopNo }">${shop.shopName }</option>
						</c:forEach>
					</select>
				</td>
				
			</tr>
			

		
		</table>
		</div>
		
		<div>
		<h3>원자재 선택</h3>
		<hr/>
		<table class="table table-bordered">
			<tr>
				<td class="condition">원자재</td>
				<td>
					<select name="ingredientSelect" id="ingredientSelect" class="search-select select2-selection select2-selection--single form-control">
						<option value="">전체</option>
						<c:forEach var="ingredient" items="${ingredientList }" >
							<option value="${ingredient.ingredientNo }">${ingredient.ingredientName }</option>
						</c:forEach>
						
					</select>
					<input type="number" id="ingredientCnt" name="ingredientCnt"/>
					<input class="btn btn-outline-success" type="button" id="ingredientAdd" name="ingredientAdd" value="추가">
				</td>
				
			</tr>
		</table>
		
		<table id="ingredientAddTable" class="display table table-bordered" >
    <thead class="thead-dark">
        <tr>
<!--        <th><input type="checkbox"/></th> -->
            <th>원자재 번호</th>
            <th>원자재명</th>
            <th>수량</th>
            <th>가격</th>
            <th>총 가격</th>

        </tr>
    </thead>
</table>
		
		<button id="excelDown" type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#placingOrderModal">엑셀 등록</button>
		<button id="placingOrderInsert" type="submit" class="btn btn-outline-danger" data-toggle="modal" data-target="#placingOrderModal">저장</button>
		</div>
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
