<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/product-header.jsp"/>

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

<script type="text/javascript">
$(document).ready(function(){
	$("#optionSubmit").click(function(){
		var categoryNo = $("#categoryNo").val();
		var optionName = $("#optionName").val();
		var optionValue = $("#optionValue").val();
		$("#optionList .table").append("<tr>"
				+"<td style='width:10%'></td>"
				+"<td style='width:55%'>"+optionName+"</td>"
				+"<td style='width:25%'>"+optionValue+"</td>"
				+"<td style='width:10%'><button class='btn btn-primary btn-sm optionDelete'>삭제</button></td></tr>");
		$("#optionName").val("");
		$("#optionValue").val("");
		
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
				alert("성공")
				console.log(res)
			}
		});
	});

	$('#optionList .table').on("click",".optionDelete", function(){
		console.log("11")
		$(this).parent().parent().remove();
	})
});
</script>

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
						<input type="text" class="form-control" id="categoryBase" value="음료" disabled>
						<input type="hidden" id="categoryNo" name="categoryNo" value="1"/>
					</div>
				</td>
				<td>
					<div>
						<label for="categoryDetail">상세 카테고리</label>
						<input type="text" class="form-control" id="categoryDetail" value="티(티바나)" disabled>
<!-- 						<input type="hidden" name="categoryDetail" value="7"/> -->
					</div>
				</td>
				<td>
					<div>
						<label for="productName">상품 이름</label>
						<input type="text" class="form-control" id="productName" value="자몽허니블랙티" disabled>
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

<div id="product" class= "left" style="margin-top: 30px;">
	<fieldset>
		<legend class="text-primary">상품 정보</legend>
		<table class="table">
			<tr>
				<th class="table-primary" style="width:20%">카테고리</th>
				<td>음료</td>
				<th class="table-primary" style="width:20%">상세 카테고리</th>
				<td>티(티바나)</td>				
			</tr>
			<tr>
				<th class="table-primary" style="width:20%">상품명</th>
				<td colspan="4">자몽허니블랙티</td>
			</tr>
			<tr>
				<th class="table-primary">사진</th>
				<td colspan="4"></td>
			</tr>
			<tr>
				<th class="table-primary" style="width:20%">원가</th>
				<td></td>
				<th class="table-primary" style="width:20%">판매가</th>
				<td></td>
			</tr>
			<tr>
				<th class="table-primary">상품 소개</th>
				<td colspan="4"></td>
			</tr>
		</table>
	</fieldset>
</div>

<div id="optionList" class="right" style="overflow:auto; height:440px">
	<fieldset>
		<legend class="text-primary">상품 옵션 목록</legend>
		<table class="table">
			<tr class="table-primary">
				<th>No</th>
				<th>옵션 이름</th>
				<th>상품 사이즈</th>
				<th></th>
			</tr>
			<c:forEach items="${optionList }" var="option">
				<tr class="appendTable">
					<td style="width:10%">${option.rnum }</td>
					<td style="width:55%">${option.optionName }</td>
					<td style="width:25%">${option.optionValue }</td>
					<td style="width:10%"><button class="btn btn-primary btn-sm optionDelete">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>