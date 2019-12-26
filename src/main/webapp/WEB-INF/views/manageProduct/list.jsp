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
<table class="table table-hover">
	<legend class="text-primary">상품 관리</legend>
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
		      <label for="exampleSelect1">상품카테고리</label>
		      <select class="form-control" id="exampleSelect1">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		      </select>
		    </div>
   		</td>
    	<td>
   			 <div class="form-group">
		      <label for="exampleSelect1">세부카테고리</label>
		      <select class="form-control" id="exampleSelect2">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		      </select>
		    </div>
   		</td>
    </tr>
    <tr>
    	<td>
   			 <div class="form-group">
		      <label for="exampleSelect1">입점매장</label>
		      <select class="form-control" id="exampleSelect2">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
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
  <thead>
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
    </tr>
  </thead>
  <tbody>
    <tr class="table-light">
    	<td style="text-align: center"><input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked=""></td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr class="table-light">
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
  </tbody>
</table> 
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
