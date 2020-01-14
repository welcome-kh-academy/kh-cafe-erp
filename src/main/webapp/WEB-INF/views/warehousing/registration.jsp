<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

//팝업창 2/3지점 띄우기
function prdSearch(){
	var popupX = (document.body.offsetWidth / 2) - 500;
	var popupY= (document.body.offsetHeight / 2) - 300;
	window.open("/warehousing/prdSearchPopup","","width=1000, height=100, resizable=no, scrollbars=no"+", left="+ popupX + ", top="+ popupY)
}

//현재날짜 구하기
function getRecentDate(){
    var dt = new Date();
 
    var recentYear = dt.getFullYear();
    var recentMonth = dt.getMonth() + 1;
    var recentDay = dt.getDate();
 
    if(recentMonth < 10) recentMonth = "0" + recentMonth;
    if(recentDay < 10) recentDay = "0" + recentDay;
 
    return recentYear + "-" + recentMonth + "-" + recentDay;
}

function getList() {
	
	// ajax 한 번 더 실행
	 $("#placingProduct").DataTable().ajax.reload();
	
}

var placingProduct = "";

//datatable
$(document).ready( function () {

	var startDate = getPastDate(1);
	var endDate = getRecentDate();
	 
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
	 
	function getRecentDate(){
	    var dt = new Date();
	 
	    var recentYear = dt.getFullYear();
	    var recentMonth = dt.getMonth() + 1;
	    var recentDay = dt.getDate();
	 
	    if(recentMonth < 10) recentMonth = "0" + recentMonth;
	    if(recentDay < 10) recentDay = "0" + recentDay;
	 
	    return recentYear + "-" + recentMonth + "-" + recentDay;
	}
	 
	function getPastDate(period){
	    var dt = new Date();
	 
	    dt.setMonth((dt.getMonth() + 1) - period);
	 
	    var year = dt.getFullYear();
	    var month = dt.getMonth();
	    var day = dt.getDate();
	 
	    if(month < 10) month = "0" + month;
	    if(day < 10) day = "0" + day;
	 
	    if(month=="00"){
	    	month="12";
	    	year = year-1;
	    }
	    
	    return year + "-" + month + "-" + day;
	}
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	//탭 이동
	$('#myTab a').on('click', function (e) {
  		e.preventDefault()
  		$(this).tab('show')
	})
	
	//현재날짜로
	$("#inStockDate").attr("value",getRecentDate());
	
	$("#product_search").click(function(){
		// ajax 한 번 더 실행
		 $("#searchProduct").DataTable().ajax.reload();
	});
	
	
	//insert 테이블
	$('#warehousing').DataTable({
		"paging" : false,
		"ordering" : true,
		"info" : true,
		"filter" : false,
		"lengthChange" : true,
		"order" : false,
		"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "빠른검색 : ",
            "emptyTable": "입고 상세 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요..."
        }
	});
	
	//상품검색 테이블
	$('#searchProduct').DataTable({
		
    	"scrollY" : 200, //테이블 고정 크기 설정
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
				
				
				return json.data;
			}
		}

    });

	placingProduct = $('#placingProduct').DataTable({
    	scrollY : 200, //테이블 고정 크기 설정
    	scrollCollapse : true, //가변 크기 막기
    	columnDefs : [
    	{
    		orderable: false,
            className: 'select-checkbox',
//             checkboxes: {
//             'selectRow': true
//          	},
            targets:   0
    	 }],
		select: {
			style: 'multi',
			selector: 'td:first-child'
		},
		order: [[ 1, 'asc' ]],
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "빠른검색 : ",
            "emptyTable": "발주 목록이 존재하지 않습니다.",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
            	"first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            }
        },
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	ajax : {
			"type" : "GET",
			"url" : "/placingOrder/search",
			"dataType":"json",
			"data" : function() {
				return $("#placingOrderForm").serialize(); //검색조건 전달
			},
			"dataSrc" : function(json){
				
				for(let i=0; i<json.data.length; i++){

				}
				
				return json.data;
			}
		}
    });
	
	$("#placingOrder-tab").click(function(){
		$('.dataTables_scrollHeadInner').attr("style","box-sizing: content-box; width: 100%; padding-right: 0px;");
		$('.dataTables_scrollHeadInner').children().attr("style","margin-left: 0px;width: 100%;");
	})
	
});	
	
//리스트 추가
function addList() {
	
	var checkbox = placingProduct.rows('.selected').data();

	for(var i=0; i<checkbox.length; i++){
		console.log(checkbox[i][2]);
	}
	
	
	
	
// 	console.log($("#placingProduct").select.selector( 'td:first-child' ));
// 	$("#placingProduct).select.selector( 'td:first-child' );
// 	$("#placingProduct tbody tr.selected")
	
	
}

</script>

<style type="text/css">
.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}

/* 입고 등록  */
.submit-form {
	width : 58%;
	float : left;
	margin : 10px;
}

/*입고 상세 등록 */
.warehousing-detail {
	margin-top : 100px;
}

.search-form {
	width : 38%;
	float : right;
	margin : 10px;
}

.button-bar {
	display : inline-block;
	float : right;
}

.tab-pane {
	margin-top : 50px;
	overflow-y : scroll;
	max-height : 600px;
	-ms-overflow-style: none;
}

.search-header {
	display : inline-block;
}

.tab-pane::-webkit-scrollbar {
	display:none;
}

.table .table-bordered .dataTable .no-footer{
	width:650px;
}


</style>

<h1>입고 등록</h1>
<hr>

<div class="submit-form">

<form action="/warehousing/registration" method="post" id="warehousingForm">
<table class="Table table table-bordered">
	<tr>
		<th class="condition"><label for="instockNo">구분</label></th>
		<td><input type="hidden" id="isAutoInstock" name="isAutoInstock" value="0"/>비정규</td>
		<th class="condition"><label for="instockNo">입고번호</label></th>
		<td><input type="number" id="inStockNo" name="inStockNo"/></td>
		<th class="condition"><label for="inStockDate">입고날짜</label></th>
		<td>
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="inStockDate" name="inStockDate" value="">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
	</tr>
	<tr>	
		<th class="condition"><label for="shopNo">거래지점</label></th>
		<td>
			<select name="shopNo" id="shopNos"
				class="select2-selection--single form-control">
			<option value="0">본사</option>
			</select>
		</td>
		<th class="condition"><label for="ingredientName">입고상태</label></th>
		<td>
			<select name="ingredientName" id="ingredientName"
				class="select2-selection--single form-control">
				<option >입고대기</option>
				<option >입고완료</option>
			</select>
		</td>
		<th class="condition"><label for="productCnt">입고창고</label></th>
		<td>
			<select name="storage" id="storage"
				class="select2-selection--single form-control">
				<option >창고1</option>
			</select>
		</td>
	</tr>
</table>
</form>

<div class="warehousing-detail">
<h3>입고 상세 목록</h3>
<hr/>
<table id="warehousing" class="table table-bordered">
		<thead class="thead-dark">
			<tr>
				<th></th>
				<th>상품번호</th>
				<th>옵션번호</th>
				<th>상품코드</th>
				<th>상품</th>
				<th>옵션</th>
				<th>입고로케이션</th>
				<th>수량</th>
				<th colspan=2>단가</th>
				<th>금액</th>
				<th colspan=2>부과세</th>
			</tr>
		</thead>
</table>
</div>
</div>


<div class="search-form">

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="product-tab" data-toggle="tab" href="#product" role="tab" aria-controls="product" aria-selected="true">상품검색</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="placingOrder-tab" data-toggle="tab" href="#placingOrder" role="tab" aria-controls="placingOrder" aria-selected="false">발주검색</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="product" role="tabpanel" aria-labelledby="product-tab" >
  	<h3 class="search-header">상품검색</h3>
  	<div class="button-bar">
		<button class="btn btn-outline-info" onclick="addList()">리스트 추가</button>
	</div>
	<hr/>
	
<div>
<form action="/manageProduct/list" method="get">
<fieldset>
<table>
    <tr height="40px">
   		<td width="20%"><label>상품코드</label></td>
   		<td width="27%"><input id="searchProductNo" name="productNo" type="number" class="form-control" value='${param.productNo}'></td>	
   		<td width="6%"></td>
   		<td width="20%"><label>상품명</label></td>
   		<td width="27%"><input id="searchProductName" name="productName" type="text" class="form-control" value="${ param.productName }"></td>		
    </tr>
    <tr>
    	<td><label for="categoryBase">상품카테고리</label></td>
   		<td>
   			<select class="search-select select2-selection select2-selection--single form-control" id="categoryBase" onchange="getCategory(this)" name="categoryNo">
		      	<option value="0"></option>
		      	<c:forEach items="${ category }" var="c">
		        <option value="${ c.categoryNo }">${ c.categoryName }</option>
		        </c:forEach>
		      </select>
   		</td>
   		<td width="20px"></td>
    	<td><label for="categoryDetail">세부카테고리</label></td>
    	<td>
		      <select class="search-select select2-selection select2-selection--single form-control" id="categoryDetail" name="categoryMapNo">
					<option value="0"></option>
		      </select>
   		</td>
    </tr>
    <tr>
    	<td><label for="shop">입점매장</label></td>
    	<td>
		      <select class="search-select select2-selection select2-selection--single form-control" id="shop" name="shopNo">
		      	<c:if test="${ param.shopNo ne null }">
		      		<option value="${ param.shopNo }"></option>
		      	</c:if>
		      	<option value="0"></option>
		      	<c:forEach items="${ shop }" var="s">
		        <option value="${ s.shopNo }">${ s.shopName }</option>
				</c:forEach>
		      </select>
		</td>
		<td width="20px"></td>
   		<td colspan=2>
   			<div class="form-group">
   				<button type="button" class="btn btn-primary btn-block" id="product_search"><i class="fas fa-search">검색</i></button>
   			</div>
   		</td>
    </tr>
</table> 
</fieldset>
</form>
</div>
	<table id="searchProduct" class="table table-bordered">
	<thead class="thead-dark">
		<tr>
			<th></th>
			<th>상품이름</th>
			<th>이미지</th>
			<th>옵션</th>
			<th>수량</th>
<!-- 			<th colspan=2>단가</th> -->
			<th>금액</th>
<!-- 			<th colspan=2>부과세</th> -->
		</tr>
	</thead>
	</table>
  </div>
  
  <!--  -->
<!--   구분선 -->
  <!--  -->
  
  <div class="tab-pane fade" id="placingOrder" role="tabpanel" aria-labelledby="placingOrder-tab">
<div class="condition-container">
 	<h3 class="search-header">발주검색</h3>
  	<div class="button-bar">
		<button class="btn btn-outline-info" onclick="addList()">리스트 추가</button>
	</div>
  	<hr/>
<form action="/placingOrder/management" method="post" id="placingOrderForm">

<table class="table table-bordered">
	<tr>
		<th class="condition"><label for="placingOrderNo">발주번호</label></th>
		<td><input type="number" value="" id="placingOrderNo" name="placingOrderNo"/></td>
		<th class="condition"><label for="shopName">지점명</label></th>
		<td>
			<select name="shopNo" id="shopNo" class="search-select select2-selection select2-selection--single form-control">
				<option value="">전체</option>
				<c:forEach var="shop" items="${shopList }" >
					<option value="${shop.shopNo }">${shop.shopName }</option>
				</c:forEach>
			</select>
		</td>
		<td rowspan="3" style="vertical-align : middle;text-align:center;">
			<div class="form-group">
   				<button type="button" class="btn btn-primary btn-block" onclick="getList()"><i class="fas fa-search">검색</i></button>
   			</div>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="startDate">발주날짜</label></th>
		<td colspan="3">
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="startDate" name="startDate" value="2020-01-01">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
			<span class="space">~</span> 
			<input class="input--style-1 js-datepicker" type="text"
				placeholder="" id="endDate" name="endDate">
			<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
	</tr>
	<tr>
		<th class="condition"><label for="placingOrderStatus">발주상태</label></th>
		<td>
			<select name="placingOrderStatus" id="placingOrderStatus"
				class="select2-selection--single form-control">
				<option value="0">발주확인전</option>
				<option value="1">발주확인</option>
				<option value="2">출고대기</option>
				<option value="3">출고완료</option>
			</select>
		</td>
		<th class="condition"><label for="inStockStatus">입고상태</label></th>
		<td>
			<select name="inStockStatus" id="inStockStatus"
				class="select2-selection--single form-control">
				<option value="0">입고대기</option>
				<option value="1">입고완료</option>
			</select>
		</td>
	</tr>
</table>
</form>
</div>
<div>
<table id="placingProduct" class="table table-bordered">
    <thead class="thead-dark">
        <tr>
        	<th></th>
            <th>no</th>
            <th>발주번호</th>
            <th>지점명</th>
            <th>발주날짜</th>
            <th>총 발주수량</th>
            <th>발주금액</th>
            <th>발주상태</th>
            <th>입고상태</th>
        </tr>
    </thead>
</table>
</div>
  </div>
</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
