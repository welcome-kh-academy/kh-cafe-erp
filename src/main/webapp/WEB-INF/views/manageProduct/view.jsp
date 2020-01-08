<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <script src="/resources/js/edit.js"></script> -->

<!-- jQuery Form Plugin -->
<script src="/resources/js/jquery.form.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#updateFile").ajaxForm({
		data: {
			productNo : $("#productNo").val()
		}
		, dataType: "json"
		, error: function() {
			console.log("파일 사진 변경 실패");
		}
		, success: function(res) {
			
			console.log("성공");
			if(res.storedName != null){
				$("#img").attr("src", "/upload/"+res.storedName);
			}
		}
		
		
	});
})

$(document).ready(function() {
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	/* 모달로 카테고리값 받아오기 */
	$("#categoryBase2").val('${product.categoryNo }').change();
	
	/* 모달에서 수정확인 버튼 눌렀을때 업데이트하는 ajax */
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
				productName : $("#productName").val(),
				categoryNo : $("#categoryBase2").val(),
				originPrice : $("#originPrice").val(),
				price : $("#price").val(),
				productOrigin : $("#productOrigin").val(),
				enrollDate : $("#enrollDate").val(),
				selStartDate : selStartDate,
				selEndDate : selEndDate,
				selStatus : $("#selStatus").val(),
				productContent : $("#productContent").val(),
				categoryMapNo : $("#categoryDetail2").val(),
// 				productImage : $("#productImage").val()
			}
			, dataType : "json"
			, success : function(data){
				console.log(data);
				console.log("값갔나유");
				location.href=data.redirect;
			}
			,error : function(){
				console.log("error");
			}
		})
		$("#exampleModalLong").modal('hide');
		
	})
})

//수정 모달(edit) 카테고리
function getCategory2(e){
	$("#exampleModalLong #categoryDetail2").html("");
	

	var value = e.value;
		
	console.log(e);
	console.log("카테고리값" + value);

	$.ajax({
		type : "GET",
		url : "/manageProduct/categoryDetail",
		data : {
			value : value
		},
		dataType : "json",
		error : function(e) {
			alert("아이코 에이젝스 투 오류!");
			console.log(e);
		},
		success : function(res) {
			console.log("모달상세카테고리 나와요" + res);
			console.log(res);
			
			
			if(res.categoryDetail.length == 0) {
				$("#exampleModalLong #categoryDetail2").append("<option></option>");
			}
			for (var i=0; i<res.categoryDetail.length;i++) {
				if(res.categoryDetail[i].categoryMapNo == '1') {
					$("#exampleModalLong #categoryDetail2").append("<option value='"+res.categoryDetail[i].categoryMapNo+"' selected='selected'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				} else {
				$("#exampleModalLong #categoryDetail2").append("<option value='"+res.categoryDetail[i].categoryMapNo+"'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				}
			}
			$("#categoryDetail2").val('${product.categoryMapNo}').change();
		}
	})
}

</script>

      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">상품 관리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
<!-- 			<tr> -->
<!--         	</tr> -->
        	<tr>
        		<th>상품코드</th>
        		<td>${product.productNo }</td>
        		<th>상품명</th>
        		<td><input type="text" id="productName" class="form-control" value="${product.productName }"></td>
        		<th>상품보기</th>
        		<td rowspan="2">
		    		<div id="divProductImage">
		    			<form id="updateFile" action="/manageProduct/updateFile" method="post" >
						<label for="productImage"><img id="img" src="/upload/${ imgfile.storedName }" style="width:125px; height:125px"/></label>
						<input type="hidden" name="productNo" id="productNo" value="${product.productNo }"/> 
						<input type="file" class="form-control-file" name="productImage" id="productImage">
						<button id="filebtn">적용</button>
		    			</form>
					</div>
        		</td>
        	</tr>
        	<tr>
        		<th>카테고리</th>
        		<td>
        		 <select class="search-select select2-selection select2-selection--single form-control" id="categoryBase2" onchange="getCategory2(this)">
		      		<option value="0">-----</option>
		      		<c:forEach items="${ category }" var="c">
		        		<option value="${ c.categoryNo }">${ c.categoryName }</option>
		        	</c:forEach>
		      	</select>
       			</td>
        		<th><label for="categoryDetail2">세부카테고리</label></th>
        		<td>
        			<select class="search-select select2-selection select2-selection--single form-control" id="categoryDetail2">
						<option value="${ product.categoryMapNo }">${ product.categoryDetailName }</option>
		      		</select>
       			</td>
        	</tr>
        	<tr>
        		<th>원가</th>
        		<td><input type="number" id="originPrice" class="form-control" value="${product.originPrice }"></td>
        		<th>판매가</th>
        		<td><input type="number" id="price" class="form-control" value="${product.price }"></td>
        		<th>제조사</th>
        		<td><input type="text" id="productOrigin" class="form-control" value="${product.productOrigin }"></td>
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
        	</tr>
        	<tr>
<!--         		<th>판매상태</th> -->
<!--         		<td> -->
<!--         			<select class="search-select select2-selection select2-selection--single form-control" id="selStatus"> -->
<%-- 	        			<option value="${ product.selStatus }"> --%>
<%-- 		        			<c:choose> --%>
<%-- 		        				<c:when test="${product.selStatus eq 0}">판매중</c:when> --%>
<%-- 		        				<c:when test="${product.selStatus eq 1}">판매종료</c:when> --%>
<%-- 		        			</c:choose> --%>
<!--     	    			</option> -->
<!--     	    			<option value="0">판매중</option> -->
<!--     	    			<option value="1">판매종료</option> -->
<!--         			</select> -->
<!--         		</td> -->
        		<th>상세설명</th>
        		<td colspan="2"><textarea id ="productContent" class="form-control">${ product.productContent }</textarea></td>
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
				format : "YYYY-MM-DD"
			},
			startDate: '${product.enrollDate }'
		});

	
		$('input[name="selStartDate"]').daterangepicker({
			singleDatePicker : true,
			showDropdowns : true,
			minYear : 1960,
			maxYear : parseInt(moment().format('YYYY'), 10),
			locale: {
				format : "YYYY-MM-DD"
			},
			startDate: '${product.selStartDate }'
				
		});

		$('input[name="selEndDate"]').daterangepicker({
			singleDatePicker : true,
			showDropdowns : true,
			minYear : 1960,
			maxYear : parseInt(moment().format('YYYY'), 10),
			locale: {
				format : "YYYY-MM-DD"
			},
			startDate: '${product.selEndDate }'
		});

	})
</script>
