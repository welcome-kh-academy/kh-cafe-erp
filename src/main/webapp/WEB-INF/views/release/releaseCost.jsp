<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
#divReleaseCost{
	margin:20px;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
// 	var table = $('#releaseCost').DataTable();
	//테이블에 버튼 만들기
// 	table.buttons(2-3).enable();
	
	var curPage =1;
	var table = $('#releaseCost').DataTable({
		"scrollY" : 600,
		"scrollCollapse" : true,
		"pagingType" : "full_numbers",
		"language" : {
			search : "빠른검색",
			"emptyTable" : "출고가 내역이 없습니다."
		},
		"length" : 5,
		"serverSide" : false,
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
			"url" : "/release/costList",
			"dataType" : "json",
			"data" : function() {
				
			},
			"dataSrc" : function(json){
				console.log(json.data[1][4].size);
				var sum = 0;
				var last = 0;
				for(let i=0; i<json.data.length; i++){
					console.log(i)
					if(json.data[i][6] == null){
						sum = sum + json.data[i][4];
						console.log(sum);
						if(i+1<json.data.length){
							if(json.data[i][0] != json.data[i+1][0]){
								json.data[i][6] = '총합'+sum;
								sum=0;
							}	
						} 
// 						for(let j=0; j<json.data[i].length; j++){
// 						sum = sum + json.data[i][4];
// 						console.log(sum);
// 							json.data[i][6] = '출고번호'+json.data[i][0]+'의 총 출고가: '+(json.data[i][4]+=json.data[i][j]);
// 						}
					}
					last = i
				}
				json.data[last][6] = '총합 '+sum;
				return json.data;
			}
		}
	})
})

</script>



<div id="divReleaseCost">
<fieldset>
<legend class="text-primary">출고가 관리</legend>
	<table id="releaseCost" class="display table table-bordered">
		<thead class="thead-dark">
			<tr>
				<th>출고번호</th>
				<th>출고날짜</th>
				<th>상품명</th>
				<th>출고단가</th>
				<th>출고가합계</th>
				<th>출고매장</th>
				<th>비고</th>
			</tr>
	</table>
</fieldset>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
