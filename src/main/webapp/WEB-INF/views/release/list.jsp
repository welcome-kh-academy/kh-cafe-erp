<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
table{
	width : 90%;
}
td div{
	margin : 0px 20px;
	margin-bottom:5px;
}
fieldset, .divReleaseList, .divSearchRelease{
	margin : 20px;
}
tr td:nth-child(6){
	text-align:center;
}
</style>

<script type="text/javascript">
window.name="listPage"
$(document).ready( function () {
	
	var curPage = 1; //페이지 변수를 1로 초기화
	
    $('.divReleaseList #myTable').DataTable({
    	"scrollY" : 400, //테이블 고정 크기 설정
    	"scrollCollapse" : true, //가변 크기 막기
    	"pagingType" : "full_numbers", //다음, 이전, 맨끝으로
    	"language" : {
    		search: "빠른검색 ", //한글
    		"emptyTable": "출고 목록이 존재하지 않습니다."
    	},
    	"length" : 5, //한페이지에 보여줄 페이지 갯수
    	"bPaginate" : true, //페이징 처리를 할 것인가
    	"serverSide" : false, //클라이언트에서 처리
    	"processing" : true, 
    	"bInfo" : false,
    	"columnDefs": [{
    		   "targets": -1,
    		   "data": null,
    		   "render": function(data, type, row){
    		    return '<button class="btn btn-primary" onclick="#">출고 등록</button>';
    	},
    	"orderable": false

    		  }],
    	ajax : {
			"type" : "GET",
			"url" : "/release/search",
			"data" : function(d) {
				d.formData = $(".divSearchRelease").serialize(); //검색조건
			},
			"dataSrc" : function(json){
				
				console.log(json.data);
// 				console.log(JSON.stringify(json.data))
				return json.data;
			}
		}
    });
});	


function popupOpen(){
	var url ="/release/popExcel";
	var winWidth = 500;
	var winHeight = 300;
	
	
	var winLeft = Math.ceil(( window.screen.width - winWidth )/2);
	var winTop = Math.ceil(( window.screen.width - winHeight )/2);
	var popupOption = "width=" + winWidth+ ", height=" + winHeight +", left=" + winLeft + ", winTop=" + winTop;
	var myWindow = window.open(url, "", popupOption);
}
</script>

<div class="divSearchRelease" style="margin : 10px; height:230px">
	<form action="/product/option/register" method="post">
	<fieldset>
		<legend class="text-primary">상품 출고 관리</legend>
		<table>
			
		</table>
	</fieldset>
	</form>
</div>




<div class="divReleaseList">
<fieldset>
	<legend class="text-primary">상품 출고 목록</legend>
	<div>
	<div class="custom-control custom-checkbox">
		<input type="checkbox" value="1" id="complete" class="custom-control-input"/><label class="custom-control-label" for="complete">출고</label>
	</div>
	<div class="custom-control custom-checkbox">
		<input type="checkbox" value="2" id="notComplete" class="custom-control-input"/><label class="custom-control-label" for="notComplete">미출고</label>
	</div>
	</div>
	<!-- <div>
	</div> -->
	<div style="float:right;">
		<button class="btn btn-outline-primary">Excel 다운로드</button>
		<button class="btn btn-outline-primary" onclick="popupOpen()">Excel 업로드</button>
	</div>
	<table id="myTable" class="display table table-bordered">
    	<thead class="thead-dark">
        	<tr class="table-primary">
				<th width="15%">출고번호</th>
				<th width="15%">발주번호</th>
				<th width="15%">지점명</th>
				<th width="20%">상태</th>
				<th width="20%">출고일</th>
				<th width="15%"></th>
			</tr>
    	</thead>	
	</table>
</fieldset>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>