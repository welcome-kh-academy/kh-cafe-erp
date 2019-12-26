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

<script type="text/javascript">
$(document).ready(function(){
	$("#optionSubmit").click(function(){
	
	});
		
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
						<label for="productOptionName">옵션 이름</label>
						<input type="text" class="form-control" id="productOptionName" name="productOptionName">
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
	<button type="submit" id="optionSubmit" class="btn btn-primary" style="float:right; margin-right:5px">등록</button>
<!-- 	</div> -->
</div>

<div id="product" class= "left">
	<fieldset>
		<legend class="text-primary">상품 정보</legend>
	</fieldset>
</div>

<div id="optionList" class="right">
	<fieldset>
		<legend class="text-primary">상품 옵션 목록</legend>
		<table class="table">
			<tr class="table-primary">
				<th><input class="form-check-input" type="checkbox" name="selectAll"/></th>
				<th>No</th>
				<th>옵션 이름</th>
				<th>상품 사이즈</th>
			</tr>
			<c:forEach items="${optionList }" var="option">
				<tr>
					<td><input class="form-check-input" type="checkbox" name="selected" value="${option.productOptionNo }"/></td>
					<td>${option.rnum }</td>
					<td>${option.productOptionName }</td>
					<td>${option.optionValue }</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>