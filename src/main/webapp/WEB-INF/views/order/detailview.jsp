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
</style>

<body>
<h5><b>주문 상세정보</b></h5>
<table id="myTable" class="display table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th>주문번호</th>
            <th>상품번호</th>     
            <th>상품명</th>
            <th>상품수량</th>
            <th>총금액</th>
            <th>제조사</th>
        </tr>
      
      <c:forEach items="${orderProductlist}" var="orderProductlist">
        <tr>
      <td>${orderProductlist.orderNo}</td>
      <td>${orderProductlist.productNo}</td>
      <td>${orderProductlist.productName}</td>
      <td>${orderProductlist.productCnt}</td>
      <td>
      <fmt:formatNumber groupingUsed="true" value="${orderProductlist.price * orderProductlist.productCnt}" />  
        <small>(단위: 원)</small>
<%-- 통화표시 하는 같은값,다른방법  <fmt:formatNumber pattern="0,000.0" value="${orderProductlist.price * orderProductlist.productCnt}"/> --%>  
      </td>
      <td>${orderProductlist.productorigin}</td>
      </tr>
      </c:forEach>
        
    </thead>
</table>
</body>
