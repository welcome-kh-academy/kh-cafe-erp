<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<link href="/resources/css/add-product.css" rel="stylesheet">

<style type="text/css">
/*브레드크럼 스타일 지정*/
#crumbs ul li #productHeader_4 {
  background-color: #2C3E50;
  color: #fff;
}

#crumbs ul li #productHeader_4:after {
	border-left: 40px solid #2C3E50;
}
#map {
	height: 100%;
	width: 100%;
}
/* Optional: Makes the sample page fill the window. */
#map_body {
	height: 500px;
	width: 40%;
	margin-left: 20px;
}
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
/**/
</style>

<script type="text/javascript">
var map;

$(document).ready(function() {
	$("#addShop a.dropdown-item").click(function(){
		$("#addShop > button").html( $(this).html() );
	})
	
	$("#select").click(function() {
		$f = $("<form>").attr({"action": "/product/addShop", "method": "post"})
			.append( $("<input>").attr({"type": "hidden", "name": "shopName", "value": $("#addShop > button").html()}) )
			.appendTo( $(document.body) );
// 		$f.submit();
	});
	
	
	
})
</script>

<!-- 상품헤더 -->
<div id="crumbs">
	<ul>
		<li><a id=productHeader_1 href="#1"><b>카테고리 등록</b></a></li>
		<li><a id=productHeader_2 href="#2"><b>상품기초정보등록</b></a></li>
		<li><a id=productHeader_3 href="#3"><b>상품 옵션 등록</b></a></li>
		<li><a id=productHeader_4 href="#4"><b>판매 지점 등록</b></a></li>
	</ul>
</div>


<h1>판매지점 등록</h1>
<hr>
<div class="text-center">
<div id="addShop" class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;" x-placement="bottom-start">
      <c:forEach items="${ shopList }" var="list">
      <a class="dropdown-item" href="#">${ list.shopName }</a>
      </c:forEach>
    </div>
  </div>
</div>

	<button id="select" type="button" class="btn btn-primary">등록</button>
	<div id="map_body">
	<div id="map"></div>
	</div>
	<script
		src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">
	</script>

</div>


<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>
