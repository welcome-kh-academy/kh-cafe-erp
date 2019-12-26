<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/product-header.jsp"/>

<style type="text/css">
fieldset{
	margin : 28px 30px;
}
table{
	width : 90%;
	margin : 20px;
}
td div{
	margin : 0px 20px;
	margin-bottom:5px;
}
</style>

<div id="addProduct">
	<fieldset>
		<legend class="text-primary">상품 기본 정보</legend>
		<form action="/product/register" method="post">
			<table>
				<tr style="height:10px"><td></td></tr>
				<tr>
					<td>
					<div>
						<label for="categoryBase">카테고리</label>
						<input type="text" class="form-control" id="categoryBase" value="음료" disabled>
						<input type="hidden" class="form-control" name="categoryBase" value="1">
					</div>
					</td>
					<td style="width:50%">
					<div>
						<label for="categoryDetail">상세 카테고리</label>
						<input type="text" class="form-control" id="categoryDetail" value="티(티바나)" disabled>
						<input type="hidden" class="form-control" name="categoryDetail" value="7">
					</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<label for="productName">제품명</label>
							<input type="text" class="form-control" id="productName" name="productName">
						</div>
					</td>
					<td>
						<div>
							<label for="productOrigin">제조사</label>
							<input type="text" class="form-control" id="productOrigin" name="productOrigin">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<label for="productInfo">상품 소개</label>
							<textarea class="form-control" id="productInfo" name="productInfo" style="width:100%; height:200px; resize: none; overflow:auto"></textarea>
						</div>
					</td>
					<td>
						<div style="padding-bottom:155px;">
							<label for="productImage">제품 이미지</label>
							<input type="file" class="form-control-file" id="productImage" aria-describedby="fileHelp">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<label for="originPrice">원가</label>
							<input type="number" class="form-control" id="originPrice" name="originPrice">							
						</div>
					</td>
					<td>
						<div>
							<label for="price">판매가</label>
							<input type="number" class="form-control" id="price" name="price">							
						</div>
					</td>
				</tr>
				</table>
				<button id="addSubmit" class="btn btn-primary" style="float:right; margin-right:5px">저장</button>
		</form>
	</fieldset>

</div>

<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>