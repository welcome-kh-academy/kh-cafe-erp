<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
.productIndex {
	margin: 30px;
	border: 1px solid #dddddd;
	padding: 40px 30px;
	position : absolute;
	top : 35%;
	width : 1850px;
}

table {
	width: 100%;
}
table tr th {
	border-right : 1px solid #CCC;
	font-size : xx-large;
	padding : 0px 20px;
}
table tr th:last-child {
	border-right : none;
}
table tr td {
	border-right : 1px solid #CCC;
	padding : 10px 40px;
}
table tr td:last-child {
	border-right : none;
}

h3 {
	position : absolute;
	top : 30%;
	margin-left:30px
}

</style>

<!-- <span class="text-primary"><b>상품등록</b></span><a href="#">도움말 보기</a> -->
<h3 class="text-primary"><b>상품 등록</b></h3>
<div class="productIndex">
	<table>
		<tr>
			<th class="text-primary">신규상품등록</th>
			<th class="text-primary">상품대량등록(엑셀)</th>
		</tr>
		<tr>
			<td>새로 추가할 상품을 절차에 따라 등록합니다.</td>
			<td>여러 카테고리의 상품을 엑셀로 일괄 등록 합니다.</td>
		</tr>
		<tr>
			<td><input class="btn btn-outline-primary" type="button" value="신규상품등록" onclick="location.href='/product/addCategory'"/></td>
			<td style="padding-left:50px;">
				<form action="/product/upload" method="post" id="massiveForm" name="excelUpload" enctype="multipart/form-data">
					<input type="file" name="excelFile" style="margin-bottom:15px"/><br>
					<input class="btn btn-outline-primary" type="submit" value="업로드"/>
				</form>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>