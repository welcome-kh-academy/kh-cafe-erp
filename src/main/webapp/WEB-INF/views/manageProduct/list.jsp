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
<<script type="text/javascript">
$(document).ready(function() {
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
});
	function getCategory(e){
		var value = document.getElementById('categoryBase').value;
		console.log(value)
		$.ajax({
			type : "GET",
			url : "/manageProduct/categoryDetail",
			data : {
				value : value
			},
			dataType : "json",
			error : function(e) {
				alert("ajax오류!");
				console.log(e);
			},
			success : function(res) {
				$("#categoryDetail").html("");
				if(res.categoryDetail.length == 0)
					$("#categoryDetail").append("<option>-----</option>");
				for (var i=0; i<res.categoryDetail.length;i++) {
					$("#categoryDetail").append("<option value='"+res.categoryDetail[i].categoryMapno+"'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				}
			}
		})
	}
</script>
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
		      <select class="search-select select2-selection select2-selection--single form-control" id="categoryBase" onchange="getCategory(this.value)">
		      	<option value="0">-----</option>
		      	<c:forEach items="${ category }" var="c">
		        <option value="${ c.categoryNo }">${ c.categoryName }</option>
		        </c:forEach>
		      </select>
		    </div>
   		</td>
    	<td>
   			 <div class="form-group">
		      <label for="categoryDetail">세부카테고리</label>
		      <select class="search-select select2-selection select2-selection--single form-control" id="categoryDetail">
<%-- 		      	<c:forEach items="${ categoryDetail }" var="detail"> --%>
<%-- 		        <option>${ detail.categoryDetailName }</option> --%>
<%-- 				</c:forEach> --%>
					<option>-----</option>
		      </select>
		    </div>
   		</td>
    </tr>
    <tr>
    	<td>
   			 <div class="form-group">
		      <label for="shop">입점매장</label>
		      <select class="search-select select2-selection select2-selection--single form-control" id="shop">
		      	<c:forEach items="${ shop }" var="s">
		        <option value="${ s.shopNo }">${ s.shopName }</option>
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
<!-- 	  <th id="checkbox" scope="col" class="text-center"> -->
<!--           <input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked=""> -->
<!-- 	  </th> -->
      <th scope="col">상품코드</th>
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
<!--     	<td style="text-align: center"><input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked=""></td> -->
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
		<!-- Button trigger modal -->
		<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
		  수정
		</button></td>
<!--       	<td><button class="btn btn-primary">수정</button></td> -->
      	<td><button class="btn btn-primary">삭제</button></td>
    </tr>
      	</c:forEach>
  </tbody>
</table> 


<!-- 수정 Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">상품 관리 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table>
        	<tr>
        		<th>상품코드</th>
        		<td>123</td>
        		<th>상품명</th>
        		<td>커피</td>
        	</tr>
        	<tr>
        		<th>카테고리</th>
        		<td>
        			<select>
        				<option>푸드</option>
        			</select>
       			</td>
        		<th>상세 카테고리</th>
        		<td>
        			<select>
        				<option>베이글</option>
        			</select>
       			</td>
        	</tr>
        	<tr>
        		<th>원가</th>
        		<td><input /></td>
        		<th>판매가</th>
        		<td><input /></td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">수정완료</button>
      </div>
    </div>
  </div>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
