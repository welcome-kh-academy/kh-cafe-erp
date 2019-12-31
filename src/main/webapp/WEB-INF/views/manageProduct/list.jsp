<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">
#checkbox {
    vertical-align: baseline;
}
fieldset, #productList {
	margin : 18px 20px;
}
table{
	width : 100%;
}
td div{
	margin : 0px 20px;
	margin-bottom:5px;
}
thead tr td {
	width : 50%;
}
#searchSubmit{
	width:20%;
	position : absolute;
}
</style>
<!-- <h1>상품관리</h1> -->
<!-- <hr> -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#prodList").on("click",".edit", function(){
		
		$(".modal-content").html( "" );
		
		$.ajax({
			type: "get"
			, url: "/manageProduct/view"
			, data: { productNo: $(this).parent().parent("tr").attr("data-productNo") }
			, dataType: "html"
			, success: function( data ) {
				console.log("success")
				$(".modal-content").html( data )
			}
			, error: function() {
				console.log("error")
				
			}
		})
	});
	
	
	
	
	
	
	
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
				console.log(res);
				$("#categoryDetail").html("");
				if(res.categoryDetail.length == 0)
					$("#categoryDetail").append("<option>-----</option>");
				for (var i=0; i<res.categoryDetail.length;i++) {
					$("#categoryDetail").append("<option value='"+res.categoryDetail[i].categoryMapno+"'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				}
			}
		})
	}
	function getCategory2(e){
		var value = document.getElementById('categoryBase2').value;
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
				console.log(res);
				$("#categoryDetail2").html("");
				if(res.categoryDetail.length == 0)
					$("#categoryDetail2").append("<option>-----</option>");
				for (var i=0; i<res.categoryDetail.length;i++) {
					$("#categoryDetail2").append("<option value='"+res.categoryDetail[i].categoryMapNo+"'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				}
			}
		})
	}
</script>

<div id="searchProduct" style="margin : 10px;">
<form action="" method="post">
<fieldset>
<legend class="text-primary">상품 관리</legend>
<table>
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
   				<button id="searchSubmit"type="button" class="btn btn-primary btn-block">검색</button>
   			</div>
   			
   		</td>
    </tr>
  </thead>
 
</table> 
</fieldset>
</form>
</div>

<div id="productList">
<table class="table">
    <tr class = table-primary>
<!-- 	  <th id="checkbox" scope="col" class="text-center"> -->
<!--           <input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked=""> -->
<!-- 	  </th> -->
      <th scope="col">상품코드</th>
      <th scope="col">상품카테고리</th>
<!--       <th scope="col">상세카테고리</th> -->
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
  <tbody id="prodList">
    	<c:forEach items="${ product }" var="p">
    <tr class="table-light" data-productNo="${ p.productNo }">
<!--     	<td style="text-align: center"><input style="height:20px; width:20px;" class="form-check-input" type="checkbox" value="" checked=""></td> -->
      	<td>${ p.productNo }</td>
      	<td>${ p.categoryMapNo }</td>
      	<td>${ p.productName }</td>
      	<td>${ p.originPrice }</td>
      	<td>${ p.price }</td>
      	<td>${ p.productOrigin }</td>
      	<td>${ p.enrollDate }</td>
      	<td>
      	<c:choose>
      		<c:when test="${ p.selStartDate ne null }">${ p.selStartDate }</c:when>
      		<c:when test="${ p.selStartDate eq null }"><button class="btn btn-primary">등록하기</button></c:when>
      	</c:choose>
      	</td>
      	<td>
      	<c:choose>
      		<c:when test="${ p.selEndDate ne null }">${ p.selEndDate }</c:when>
      		<c:when test="${ p.selEndDate eq null }"><button class="btn btn-primary">등록하기</button></c:when>
      	</c:choose>
      	
      	</td>
      	<td>
      	<c:choose>
      		<c:when test="${ p.selStatus eq 0 }">판매중</c:when>
      		<c:when test="${ p.selStatus eq 1 }">판매종료</c:when>
		</c:choose>
      	</td>
		<!-- Button trigger modal -->
		<td><button type="button" class="btn btn-primary edit" data-toggle="modal" data-target="#exampleModalLong" >
		  상세 / 수정
		</button></td>
<!--       	<td><button class="btn btn-primary">수정</button></td> -->
      	<td><button class="btn btn-primary del">삭제</button></td>
    </tr>
      	</c:forEach>
  </tbody>
</table> 
</div>

<!-- 수정 Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
    <div class="modal-content">
    </div><!-- .modal-content -->
  </div><!-- .modal-dialog -->
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
