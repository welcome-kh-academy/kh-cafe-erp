<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>


<style type="text/css">

.pagination {
	text-align: center;
}
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
	float : left;
/* 	position : absolute; */
}
</style>
<!-- <h1>상품관리</h1> -->
<!-- <hr> -->
<script type="text/javascript">


$(document).ready(function() {
	$("#shop option[value='${ param.shopNo }']").attr("selected", true);
	$("#categoryBase option[value='${ param.categoryNo }']").attr("selected", true);
	$("#categoryBase").change();
	
	/* 오늘 날짜 구하는 함수 */
	function getRecentDate(){
	    var dt = new Date();
	 
	    var recentYear = dt.getFullYear();
	    var recentMonth = dt.getMonth() + 1;
	    var recentDay = dt.getDate();
	 
	    if(recentMonth < 10) recentMonth = "0" + recentMonth;
	    if(recentDay < 10) recentDay = "0" + recentDay;
	 
	    return recentYear + "-" + recentMonth + "-" + recentDay;
	}

	
	/* 판매등록일 모달 */
	$("#prodList").on("click",".selStart", function(){
		
		$("#exampleModalLong .modal-content").html("");
		
		var productNo = $(this).attr('data-productno');

		$("#exampleModalLong .modal-content").html(
		'	      <div class="modal-header">'
		+'	      	<h5 class="modal-title">판매등록일 추가</h5>'
		+'	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
		+'	          <span aria-hidden="true">&times;</span>'
		+'	        </button>'
		+'	      </div><!-- .modal-header -->'
		+'	      <div class="modal-body">'
		+'	      	<table class="table">'
		+'	      		<tr>'
		+'		      		<th>판매등록일</th>'
		+'	        		<td>'
		+'	        			<div class="input-group">'
		+'	                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="selStartDate" name="selStartDate">'
		+'	                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>'
		+'	                        <input type="hidden" id="productNo" value="'+productNo+'" />'
		+'	                    </div>'
		+'	        		</td>'
		+'       		</tr>'
		+'	      	</table>'
		+'	      </div>'
		+'	      <div class="modal-footer">'
		+'	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>'
		+'	        <button type="button" class="btn btn-primary" id="selStartBtn">등록</button>'
		+'     	  </div>' );
		
		/* 달력 날짜포맷 */
		$('#exampleModalLong input[name="selStartDate"]').daterangepicker({
				singleDatePicker : true,
				showDropdowns : true,
				minYear : 1960,
				maxYear : parseInt(moment().format('YYYY'), 10),
				locale: {
					format : "YYYY-MM-DD"
				}
		})
	})
	
	
	/* 판매종료일 모달 */
	$("#prodList").on("click",".selEnd", function(){
		
		$("#exampleModalLong .modal-content").html("");
		
		var productNo = $(this).attr('data-productno');

		$("#exampleModalLong .modal-content").html(
		'	      <div class="modal-header">'
		+'	      	<h5 class="modal-title">판매종료일 추가</h5>'
		+'	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
		+'	          <span aria-hidden="true">&times;</span>'
		+'	        </button>'
		+'	      </div><!-- .modal-header -->'
		+'	      <div class="modal-body">'
		+'	      	<table class="table">'
		+'	      		<tr>'
		+'		      		<th>판매종료일</th>'
		+'	        		<td>'
		+'	        			<div class="input-group">'
		+'	                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="selEndDate" name="selEndDate">'
		+'	                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>'
		+'	                        <input type="hidden" id="productNo" value="'+productNo+'" />'
		+'	                    </div>'
		+'	        		</td>'
		+'       		</tr>'
		+'	      	</table>'
		+'	      </div>'
		+'	      <div class="modal-footer">'
		+'	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>'
		+'	        <button type="button" class="btn btn-primary" id="selEndBtn">등록</button>'
		+'     	  </div>' );
		
		/* 달력 날짜포맷 */
		$('#exampleModalLong input[name="selEndDate"]').daterangepicker({
				singleDatePicker : true,
				showDropdowns : true,
				minYear : 1960,
				maxYear : parseInt(moment().format('YYYY'), 10),
				locale: {
					format : "YYYY-MM-DD"
				}
		})
	})
	
	/* 엑셀 다운 모달 */
	$("#excelDown").click(function(){
		console.log("sdsdsdsd")
		$("#exampleModalLong .modal-content").html("")

		$("#exampleModalLong .modal-content").html(
		'	<div class="modal-header">'
		+' 		<h5 class="modal-title">엑셀 다운로드</h5>'
		+'		<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
		+'			<span aria-hidden="true">&times;</span>'
		+'		</button>'
		+'	</div>'
		+'	<div class="modal-body">'
		+'		<p>엑셀을 다운받으시겠습니까?</p>'
		+'		<p>경로 : D:/</p>'
		+'	</div>'
		+'	      <div class="modal-footer">'
		+'	         <button id="downBtn" type="button" class="btn btn-primary">확인</button>'
		+'	         <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>'
		+'     	  </div>'
		);
	})
	
	$("#exampleModalLong .modal-content").on("click", "#downBtn", function(){
		location.href="/manageProduct/exceldown";
	})
	
	/* 삭제 모달 */
	$("#prodList").on("click",".delList", function(){
		$("#exampleModalLong .modal-content").html("")
		var productNo = $(this).attr('data-productno');
		$("#exampleModalLong .modal-content").html(
		'	<div class="modal-header">'
		+' 		<h5 class="modal-title">상품 삭제</h5>'
		+'		<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
		+'			<span aria-hidden="true">&times;</span>'
		+'		</button>'
		+'	</div>'
		+'	<div class="modal-body">'
		+'		<d>정말 삭제하시겠습니까?</d>'
		+'	    <input type="hidden" id="productNo" value="'+productNo+'" />'
		+'	</div>'
		+'	      <div class="modal-footer">'
		+'	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>'
		+'	        <button type="button" class="btn btn-primary" id="productDelBtn">삭제</button>'
		+'     	  </div>'
		);
	})
	
	
	
	/* 수정 모달 ajax */
	$("#prodList").on("click",".edit", function(){
		
		$("#exampleModalLong .modal-content").html( "" )
		
		var productNo = $(this).attr("data-productno");
		console.log(productNo);
		
		$.ajax({
			type: "get"
			, url: "/manageProduct/view"
// 			, data: { productNo: $(this).parent().parent("tr").attr("data-productno") }
			, data: { productNo: productNo }
			, dataType: "html"
			, success: function( data ) {
				console.log("success");
				$("#exampleModalLong .modal-content").html( data )
			}
			, error: function() {
				console.log("edit error");
				
			}
		})
	});
	
	
	/* 삭제 모달 ajax */
	$("#exampleModalLong .modal-content").on("click", "#productDelBtn", function(){
		$.ajax({
			type : "get"
			, url : "/manageProduct/delete"
			, data : {
				productNo : $("#exampleModalLong #productNo").val()
			}
			, dataType: "json"
			, success: function(data){
				console.log(data);
				location.href=data.redirect;
			}
			, error: function(){
				console.log("delete error")
			}
		})
	})
	
	
	//판매등록 AJAX
	$("#exampleModalLong .modal-content").on("click", "#selStartBtn", function(){
		$.ajax({
			type: "get"
			, url: "/manageProduct/selStartDate"
			, data : { 
				selStartDate : $('#exampleModalLong #selStartDate').val(),
				productNo : $("#exampleModalLong #productNo").val()
			}
			, dataType: "json"
			, success: function( data ) {
				console.log(data);
				console.log("시작날짜 변경 된다")
				location.href=data.redirect;
			}
			, error: function() {
				console.log("Start error")
			}
		})
	})


	//판매종료 AJAX
	$("#exampleModalLong .modal-content").on("click", "#selEndBtn", function(){

		$.ajax({
			type: "get"
			, url: "/manageProduct/selEndDate"
			, data : { 
				selEndDate : $('#exampleModalLong #selEndDate').val(),
				productNo : $("#exampleModalLong #productNo").val()
			}
			, dataType: "json"
			, success: function( data ) {
				console.log(data);
				console.log(data.redirect);
				console.log("끝날짜 변경 된다")
				
				location.href=data.redirect;
			}
			, error: function() {
				console.log("End error")
			}
		})
		
	})
	
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	table = $('#myTable').DataTable({
	
    	"scrollY" : 200, //테이블 고정 크기 설정
    	"columnDefs" : [
    	      { width: '6%', targets : [0] }, //지점명
    	      { width: '7%', targets : [1] }, //상품번호
    	      { width: '15%', targets : [2] }, //상품명
    	      { width: '5%', targets : [3] }, //원가
    	      { width: '5%', targets : [4] },  //판매가
    	      { width: '8%', targets : [5] }, //제조사
    	      { width: '7%', targets : [6] }, //상품등록일
    	      { width: '7%', targets : [7] },  //판매등록일
    	      { width: '7%', targets : [8] },  //판매종료일
    	      { width: '5%', targets : [9] }, //판매상태
    	      { width: '10%', targets : [10] },//수정버튼 자리
    	      { width: '5%', targets : [11] } //삭제버튼 자리
    	],
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "간편검색 : ",
            "emptyTable": "발주 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
            	"first": "<<",
                "last": ">>",
                "next": "다음",
                "previous": "이전"
            }
        },
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	ajax : {
			"type" : "GET",
			"url" : "/manageProduct/search",
			"dataType" : "json",
			"data" : function() {
				console.log($("#productSearch").serialize())
				return $("#productSearch").serialize(); //검색조건 전달
			},
			"dataSrc" : function(json){
				
				for(let i=0; i<json.data.length; i++){
				
				/* 판매 날짜에 따른 판매 상태 변경  */
				if(json.data[i][6] != null){
					
					if(json.data[i][7] <= getRecentDate()){
		
						if(json.data[i][8] < getRecentDate()){
							json.data[i][9] = "판매종료";
						} else if(json.data[i][7] <= getRecentDate() && json.data[i][8] > getRecentDate()){
							json.data[i][9] = "판매중";
						} else {
						json.data[i][9] = "판매중";
						}
					} else {
							json.data[i][9] = "상품준비중";
						}
					
					}
				if(json.data[i][7] == null){
					json.data[i][7] = '<button class="btn btn-default selStart" data-toggle="modal" data-target="#exampleModalLong" data-productno="'+json.data[i][1]+'"><i class="far fa-calendar-plus fa-lg"></i></button>';
				}
				if(json.data[i][8] == null){
					json.data[i][8] = '<button class="btn btn-default selEnd" data-toggle="modal" data-target="#exampleModalLong" data-productno="'+json.data[i][1]+'"><i class="far fa-calendar-plus fa-lg"></i></button>';
				}
				json.data[i][10] = '<button type="button" id="listEditBtn" class="btn btn-primary edit" data-toggle="modal" data-target="#exampleModalLong" data-productno="'+json.data[i][1]+'" >상세 / 수정</button>';
				json.data[i][11] = '<button id="listDelBtn" class="btn btn-primary delList" data-toggle="modal" data-target="#exampleModalLong" data-productno="'+json.data[i][1]+'"><i class="far fa-trash-alt"></i></button>';
				} //for문 끝
				
				return json.data;
			}
		}

    });
});

//버튼을 누르면 작동..?
function getList() {
	
	//검색조건 가져오기
// 	var formData = $("#placingOrderForm").serialize(); //검색조건
	// ajax 한 번 더 실행
	 $("#myTable").DataTable().ajax.reload();
	
}

//상품관리(list) 카테고리
function getCategory(e){
	$("#categoryDetail").html("");

	var value = e.value;
	console.log(value)
// 	var value = document.getElementById('categoryBase').value;
// 	console.log(value)
	
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
			if(res.categoryDetail.length == 0)
				$("#categoryDetail").append("<option value='0'></option>");
			for (var i=0; i<res.categoryDetail.length;i++) {
				if(res.categoryDetail[i].categoryMapNo == '${ param.categoryMapNo }') {
					$("#categoryDetail").append("<option value='"+res.categoryDetail[i].categoryMapNo+"' selected='selected'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				} else {
					$("#categoryDetail").append("<option value='"+res.categoryDetail[i].categoryMapNo+"'>"+res.categoryDetail[i].categoryDetailName+"</option>");
				}
			}
		}
	})
}



</script>

<div id="searchProduct" style="margin : 10px;">
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 

<form id="productSearch" action="/manageProduct/search" method="GET">
<fieldset>
<legend class="text-primary"><a href="/manageProduct/list">상품 관리</a></legend>
<table>
  <thead>
    <tr>
   		<td>
   			<div>
   				<label>상품코드</label>
   				<input id="searchProductNo" name="productNo" type="number" class="form-control" value='${param.productNo}'>
   			</div>
   		</td>
   		<td>
   			<div>
   				<label>상품명</label>
   				<input id="searchProductName" name="productName" type="text" class="form-control" value="${ param.productName }">
   			</div>
   		</td>
    </tr>
    <tr>
    	<td>
   			 <div class="form-group">
		      <label for="categoryBase">상품카테고리</label>
		      <select class="search-select select2-selection select2-selection--single form-control" id="categoryBase" onchange="getCategory(this)" name="categoryNo">
		      	<option value="0"></option>
		      	<c:forEach items="${ category }" var="c">
		        <option value="${ c.categoryNo }">${ c.categoryName }</option>
		        </c:forEach>
		      </select>
		    </div>
   		</td>
    	<td>
   			 <div class="form-group">
		      <label for="categoryDetail">세부카테고리</label>
		      <select class="search-select select2-selection select2-selection--single form-control" id="categoryDetail" name="categoryMapNo">
					<option value="0"></option>
		      </select>
		    </div>
   		</td>
    </tr>
    <tr>
    	<td>
<!--    			 <div class="form-group"> -->
<!-- 		      <label for="shop">입점매장</label> -->
<!-- 		      <select class="search-select select2-selection select2-selection--single form-control" id="shop" name="shopNo"> -->
<%-- 		      	<c:if test="${ param.shopNo ne null }"> --%>
<%-- 		      		<option value="${ param.shopNo }"></option> --%>
<%-- 		      	</c:if> --%>
<!-- 		      	<option value="0"></option> -->
<%-- 		      	<c:forEach items="${ shop }" var="s"> --%>
<%-- 		        <option value="${ s.shopNo }">${ s.shopName }</option> --%>
<%-- 				</c:forEach> --%>
<!-- 		      </select> -->
<!-- 		    </div> -->
   		</td>
   		<td>
   			<div class="form-group">
   				<button type=button id="searchSubmit" class="btn btn-primary btn-block" onclick="getList()"><i class="fas fa-search">검색</i></button>
   				<a href="/manageProduct/list"><i class="fas fa-redo fa-2x"></i></a>
				<button style="margin-left:20px" id="excelDown" class="btn btn-outline-success" type="button" data-toggle="modal" data-target="#exampleModalLong">Excel 다운로드</button>
   			</div>
   			
   		</td>
    </tr>
  </thead>
 
</table> 
</fieldset>
</form>
</div>



<div id="prodList">
<table id="myTable" class="display table table-bordered" >
    <thead class="thead-dark">
        <tr>
<!--        <th><input type="checkbox"/></th> -->
            <th>지점명</th>
            <th>상품번호</th>
            <th>상품명</th>
            <th>원가</th>
            <th>판매가</th>
            <th>제조사</th>
            <th>상품등록일</th>
            <th>판매등록일</th>
            <th>판매종료일</th>
            <th>판매상태</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
</table>
</div>

<!-- 수정 Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
    <div class="modal-content">
    </div><!-- .modal-content -->
  </div><!-- .modal-dialog -->
</div>

<!-- 페이징 -->

<%-- <jsp:include page="/WEB-INF/views/manageProduct/paging.jsp" /> --%>

<!-- <div class=""> -->
<!--   <ul class="pagination"> -->
<!--     <li class="page-item disabled"> -->
<!--       <a class="page-link" href="#">&laquo;</a> -->
<!--     </li> -->
<!--     <li class="page-item active"> -->
<!--       <a class="page-link" href="#">1</a> -->
<!--     </li> -->
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="#">2</a> -->
<!--     </li> -->
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="#">3</a> -->
<!--     </li> -->
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="#">4</a> -->
<!--     </li> -->
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="#">5</a> -->
<!--     </li> -->
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="#">&raquo;</a> -->
<!--     </li> -->
<!--   </ul> -->
<!-- </div> -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>



<!-- 판매등록일 모달 -->
<!-- <div id="selStart"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	      	<h5 class="modal-title">판매등록일 추가</h5> -->
<!-- 	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 	          <span aria-hidden="true">&times;</span> -->
<!-- 	        </button>         -->
<!-- 	      </div>.modal-header	 -->
<!-- 	      <div class="modal-body"> -->
<!-- 	      	<table class="table"> -->
<!-- 	      		<tr> -->
<!-- 		      		<th>판매등록일</th> -->
<!-- 	        		<td> -->
<!-- 	        			<div class="input-group"> -->
<!-- 	                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="selStartDate" name="selStartDate"> -->
<!-- 	                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i> -->
<!-- 	                        <input type="hidden" id="productNo" value="" /> -->
<!-- 	                    </div> -->
<!-- 	        		</td> -->
<!--         		</tr> -->
<!-- 	      	</table> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
<!-- 	        <button type="button" class="btn btn-primary" id="selStartBtn">등록</button> -->
<!--       	  </div> -->
<!-- </div> -->






<!-- 판매종료일 모달 -->
<!-- <div id="selEnd"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	      	<h5 class="modal-title">판매종료일 추가</h5> -->
<!-- 	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 	          <span aria-hidden="true">&times;</span> -->
<!-- 	        </button>         -->
<!-- 	      </div>.modal-header	 -->
<!-- 	      <div class="modal-body"> -->
<!-- 	      	<table class="table"> -->
<!-- 	      		<tr> -->
<!-- 		      		<th>판매종료일</th> -->
<!-- 	        		<td> -->
<!-- 	        			<div class="input-group"> -->
<!-- 	                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="selEndDate" name="selEndDate"> -->
<!-- 	                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i> -->
<!-- 	                        <input type="hidden" id="productNo" value="" /> -->
<!-- 	                    </div> -->
<!-- 	        		</td> -->
<!--         		</tr> -->
<!-- 	      	</table> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
<!-- 	        <button type="button" class="btn btn-primary" id="selEndBtn">등록</button> -->
<!--       	  </div> -->
<!-- </div> -->