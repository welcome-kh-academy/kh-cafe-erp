<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/header-pop.jsp"/>
<style type="text/css">
.condition {
    color: #FFFFFF;
    background-color: #2C3E50;
    border-color: #DEE2E6;
}

.condition-container {
	margin : 20px;
}

.space {
	margin-left : 20px;
	margin-right : 20px;
}

.btn-lg {
	width: 100%;
	height : 70px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>주문 상세정보</h3>
<table id="myTable" class="display table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th>주문번호</th>
            <th>상품인덱스</th>
            <th>상품번호</th>     
            <th>상품수량</th>
            
        </tr>
    </thead>
</table>
</body>
</html>