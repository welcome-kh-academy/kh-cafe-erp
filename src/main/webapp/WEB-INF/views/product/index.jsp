<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
.productIndex {
	margin: 30px;
	border: 30px solid #dddddd;
	padding: 30px;
}

table {
	width: 100%;
}

table tr th {border-right : 1px solid #CCC;}
table tr th:last-child {border-right : none;}

table tr td {border-right : 1px solid #CCC;}
table tr td:last-child {border-right : none;}


</style>


<span><b>상품등록</b></span><a href="#">도움말 보기</a>

<div class="productIndex" >
	<h1>상품등록</h1>
	<table>
		<tr>
			<th>신규상품등록</th>
			<th>상품대량등록(엑셀)</th>
		</tr>
		<tr>
			<td>새로 추가할 상품을 절차에 따라 등록합니다.</td>
			<td>여러 카테고리의 상품을 엑셀로 일괄 등록 합니다.</td>
		</tr>
		<tr>
			<td><button class="btn btn-outline-primary" ><a href="/product/add" style="color:black;">신규상품등록</a></button></td>
			<td><button class="btn btn-outline-success" ><a href="/product/upload"> 엑셀 업로드</a></button></td>
		</tr>
	</table>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>