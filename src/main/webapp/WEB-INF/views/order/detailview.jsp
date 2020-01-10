<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header-pop.jsp"/>


<style type="text/css">
small, .small {
     font-size: 70%; 
   
}
table{

}
#wrapper{
	margin : 20px;
}
</style>
<script type="text/javascript">
function closePop(){
	console.log("dfdfsa")
	window.close();
}
</script>
<body>
<div id="wrapper">
<h5><b>주문 상세정보</b></h5>
<table id="myTable" class="display table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th>주문번호</th>
            <th>상품번호</th>     
            <th>상품명</th>
            <th>상품수량</th>
            <th>금액</th>
            <th>제조사</th>
        </tr>
      

	<c:set var="sum" scope="page" value="0"/>
      <c:forEach items="${orderProductlist}" var="orderProductlist">
		<c:set var="sum" scope="page" value="${sum + orderProductlist.price * orderProductlist.productCnt}"/>
      
        <tr>
      <td>${orderProductlist.orderNo}</td>
      <td>${orderProductlist.productNo}</td>
      <td>${orderProductlist.productName}</td>
      <td>${orderProductlist.productCnt}</td>
      <td><fmt:formatNumber groupingUsed="true" value="${orderProductlist.price * orderProductlist.productCnt}" />  
        <small>(단위: 원)</small></td>
<%-- 통화표시 하는 같은값,다른방법  <fmt:formatNumber pattern="0,000.0" value="${orderProductlist.price * orderProductlist.productCnt}"/> --%>  
    <td>${orderProductlist.productorigin}</td>
      </tr>
      </c:forEach>
        
    </thead>
</table>
<div style="text-align:right">
<h3>합계 : <fmt:formatNumber groupingUsed="true" value="${sum}" /></h3></div>
<br><br>
	<div style="text-align:center">
		<button class="btn btn-primary btn-sm" onclick="closePop()">닫기</button>
	</div>
</div>
</body>
