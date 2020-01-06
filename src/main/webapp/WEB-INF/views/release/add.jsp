<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$(document).ready(function(){
	
	var table = $('#addRelease').DataTable();
	//테이블에 버튼 만들기
	table.buttons(2-3).enable();
	
	var curPage =1;
	$('#addRelease').DataTable({
		"scrollY" : 200,
		"scrollCollapse" : true,
		"pagingType" : "full_numbers",
		"language" : {
			search : "빠른검색",
			"emptyTable" : "출고할 내역이 없습니다."
		},
		"length" : 5,
		"bPaginate" : false,
		"processing" : true,
		//유진이가 보내준 버튼
// 		"columnDefs": [{
//             "targets": -1,
//             "data": null,
//             "render": function(data, type, row){
//              return '<button class="btn btn-primary" onclick="#">출고 등록</button>';
// 	    },
// 	    "orderable": false
//            }],
		ajax : {
			"type" : "get",
			"url" : "/release/add",
			"data" : function(d) {
				
			},
			"dataSrc" : function(json){
				console.log(json.data);
				return json.data;
			}
		}
	})
})

</script>

<div>
	<table id="addRelease" class="display table table-bordered">
		<thead class="thead-dark">
			<tr>
				<th>주문날짜</th>
				<th>출고날짜</th>
				<th>오늘날짜</th>
				<th>상품코드</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>요청 수량</th>
				<th>출고 수량</th>
				<th>출고가</th>
				<th>출고매장</th>
				<th>출고 상태</th>
				<th>비고</th>
			</tr>
	</table>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
