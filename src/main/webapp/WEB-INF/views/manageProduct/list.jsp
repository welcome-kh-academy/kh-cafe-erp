<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">
#checkbox {
    vertical-align: baseline;
}
  
</style>
<!-- <h1>상품관리</h1> -->
<!-- <hr> -->
<legend class="text-primary">상품 관리</legend>
<table class="table table-hover">
  <thead>
    <tr>
   		<td>
   			<div>
   				<label>상품코드</label>
   				<input type="text" class="form-control" value="">
   			</div>
   		</td>
   		<td>
   			<div>
   				<label>상품명</label>
   				<input type="text" class="form-control" value="">
   			</div>
   		</td>
    </tr>
    <tr>
    	<td>
   			 <div class="form-group">
		      <label for="categoryBase">상품카테고리</label>
		      <select class="form-control" id="categoryBase">
		      	<c:forEach items="${ category }" var="category">
		        <option>${ category.categoryName }</option>
		        </c:forEach>
		      </select>
		    </div>
   		</td>
    	<td>
   			 <div class="form-group">
		      <label for="categoryDetail">세부카테고리</label>
		      <select class="form-control" id="categoryDetail">
		      	<c:forEach items="${ categoryDetail }" var="detail">
		        <option>${ detail.categoryDetailName }</option>
				</c:forEach>
		      </select>
		    </div>
   		</td>
    </tr>
    <tr>
    	<td>
   			 <div class="form-group">
		      <label for="shop">입점매장</label>
		      <select class="form-control" id="shop">
		      	<c:forEach items="${ shop }" var="s">
		        <option>${ s.shopName }</option>
				</c:forEach>
		      </select>
		    </div>
   		</td>
   		<td>
   			<div class="form-group">
   				<button type="button" class="btn btn-primary btn-lg btn-block">검색</button>
   			</div>
   			
   		</td>
    </tr>
  </thead>
 
</table> 

<table class="table table-hover">
    <tr class = table-secondary>
	  <th id="checkbox" scope="col" class="text-center">
          <input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked="">
	  </th>
      <th scope="col">상품번호</th>
      <th scope="col">상품카테고리</th>
      <th scope="col">상품명</th>
      <th scope="col">원가</th>
      <th scope="col">판매가</th>
      <th scope="col">제조사</th>
      <th scope="col">상품등록일</th>
      <th scope="col">판매등록일</th>
      <th scope="col">판매종료일</th>
      <th scope="col">판매상태</th>
      <th></th>
      <th></th>
    </tr>
  <tbody>
    	<c:forEach items="${ product }" var="p">
    <tr class="table-light">
    	<td style="text-align: center"><input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked=""></td>
      	<td>${ p.productNo }</td>
      	<td>${ p.categoryMapNo }</td>
      	<td>${ p.productName }</td>
      	<td>${ p.originPrice }</td>
      	<td>${ p.price }</td>
      	<td>${ p.productOrigin }</td>
      	<td>${ p.enrollDate }</td>
      	<td>${ p.selStartDate }</td>
      	<td>${ p.selEndDate }</td>
      	<td>${ p.selStatus }</td>
      	<td><button class="btn btn-primary">수정</button></td>
      	<td><button class="btn btn-primary">삭제</button></td>
    </tr>
      	</c:forEach>

   
  </tbody>
</table> 
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
