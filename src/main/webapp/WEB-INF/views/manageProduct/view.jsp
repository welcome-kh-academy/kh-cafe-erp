<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#categoryBase2").val('${product.categoryNo }').change();
	
	$("#editBtn").on("click", function(){
		
		var selStartDate;
		if($("#selStartDate").val() != null) {
			selStartDate = $("#selStartDate").val();
		} else {
			selStartDate = '${ product.selStartDate }'
		}
		var selEndDate;
		if($("#selEndDate").val() != null) {
			selEndDate = $("#selEndDate").val();
		} else {
			selEndDate = '${ product.selEndDate }'
		}
		
		$.ajax({
			type : "get"
			, url : "/manageProduct/update"
			, data : {
				productNo : '${ product.productNo }',
				productName : '${ product.productName }',
				categoryNo : $("#categoryBase2").val(),
				originPrice : $("#originPrice").val(),
				price : $("#price").val(),
				enrollDate : $("#enrollDate").val(),
				selStartDate : selStartDate,
				selEndDate : selEndDate,
				selStatus : $("#selStatus").val(),
				productContent : $("#productContent").val(),
				categoryMapNo : $("#categoryDetail2").val()
			}
			, dataType : "html"
			, success : function(data){
				console.log(data);
				console.log("값갔나유");
			}
			,error : function(){
				console.log("error");
			}
		})
		$("#exampleModalLong").modal('hide');
		
	})
})


</script>

      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">상품 관리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
        	<tr>
        		<th>상품코드</th>
        		<td>${product.productNo }</td>
        		<th>상품명</th>
        		<td>${product.productName }</td>
        		<th>상품보기</th>
        		<td></td>
        	</tr>
        	<tr>
        		<th>카테고리</th>
        		<td>
        		 <select class="search-select select2-selection select2-selection--single form-control" id="categoryBase2" onchange="getCategory2(this.value)">
		      		<option value="0">-----</option>
		      		<c:forEach items="${ category }" var="c">
		        		<option value="${ c.categoryNo }">${ c.categoryName }</option>
		        	</c:forEach>
		      	</select>
       			</td>
        		<th>상세 카테고리</th>
        		<td>
        			<select class="search-select select2-selection select2-selection--single form-control" id="categoryDetail2">
						<option value="">-----</option>
		      		</select>
       			</td>
        	</tr>
        	<tr>
        		<th>원가</th>
        		<td><input type="number" id="originPrice" class="form-control" value="${product.originPrice }"></td>
        		<th>판매가</th>
        		<td><input type="number" id="price" class="form-control" value="${product.price }"></td>
        	</tr>
        	<tr>
        		<th>상품등록일</th>
        		<td>
        			<div class="input-group">
                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="enrollDate" name="enrollDate">
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                    </div>
        		</td>
        		<c:if test="${ product.selStartDate ne null }">
        		<th>판매등록일</th>
        		<td>
        			<div class="input-group">
                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="selStartDate" name="selStartDate">
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                    </div>
        		</td>
                </c:if>
                <c:if test="${ product.selEndDate ne null }">
        		<th>판매종료일</th>
        		<td>
        			<div class="input-group">
                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="selEndDate" name="selEndDate">
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                    </div>
        		</td>
        		</c:if>
        		<th>판매상태</th>
        		<td>
        			<select class="search-select select2-selection select2-selection--single form-control" id="selStatus">
	        			<option value="${ product.selStatus }">
		        			<c:choose>
		        				<c:when test="${product.selStatus eq 0}">판매중</c:when>
		        				<c:when test="${product.selStatus eq 1}">판매종료</c:when>
		        			</c:choose>
    	    			</option>
    	    			<option value="0">판매중</option>
    	    			<option value="1">판매종료</option>
        			</select>
        		</td>
        	</tr>
        	<tr>
        		<th>상세설명</th>
        		<td><textarea id ="productContent" class="form-control">${ product.productContent }</textarea></td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="editBtn">수정완료</button>
      </div>



<script type="text/javascript">
	$(document).ready(function() {
		$('input[name="enrollDate"]').daterangepicker({
			singleDatePicker : true,
			showDropdowns : true,
			minYear : 1960,
			maxYear : parseInt(moment().format('YYYY'), 10),
			locale: {
				format : "YYYYMMDD"
			},
			startDate: '${product.enrollDate }'
		});

	
		$('input[name="selStartDate"]').daterangepicker({
			singleDatePicker : true,
			showDropdowns : true,
			minYear : 1960,
			maxYear : parseInt(moment().format('YYYY'), 10),
			locale: {
				format : "YYYYMMDD"
			},
			startDate: '${product.selStartDate }'
				
		});

		$('input[name="selEndDate"]').daterangepicker({
			singleDatePicker : true,
			showDropdowns : true,
			minYear : 1960,
			maxYear : parseInt(moment().format('YYYY'), 10),
			locale: {
				format : "YYYYMMDD"
			},
			startDate: '${product.selEndDate }'
		});

	})
</script>
