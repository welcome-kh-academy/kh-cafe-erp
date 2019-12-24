<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">
table{
	width : 90%;
}
td div{
	margin : 0px 20px;
}
fieldset, #optionList{
	margin : 20px 20px;
}
</style>
<div id="manageOption" style="margin : 10px; height:230px">
	<form action="/product/option/register" method="post">
	<fieldset>
		<legend class="text-info">상품 옵션 등록</legend>
		<table>
			<tr>
				<td> 
					<div id="selectBaseCategory">
						<select name="categoryBase" class="form-control">
							<option value="" selected disabled>카테고리</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
				</td>
				<td> 
					<div id="selectDetailCategory">
						<select name="categoryDetail" class="form-control">
							<option value="" selected>상세 카테고리</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
				</td>
				<td> 
					<div id="selectProduct">
						<select name="product" class="form-control">
							<option value="" selected>제품명</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
				</td>
			</tr>
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
	</form>
</div>

<div id="optionList">
	<fieldset>
		<legend class="text-info">상품 옵션 목록</legend>
		<table>
			<tr>
				<th>카테고리</th>
				<th>상세카테고리</th>
				<th>제품명</th>
				<th>옵션이름</th>
				<th>상품 사이즈</th>
				<th>상품 수량</th>
			</tr>
		</table>
	</fieldset>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>