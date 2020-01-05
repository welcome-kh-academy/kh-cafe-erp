<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
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
	float: left;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#shop_list {
	height: 500px;
	width: 10%;
	margin-left: 20px;
	float: left;
	
}

#shop_list>div {
	border: 1px solid #2C3E50;
	margin-bottom: 3px;
}
#index_body{
	height:500px;
	width:10%;
	float:left;
	border: 1px solid #2C3E50;
	margin-left: 20px;
	overflow: auto;
}
.selected{
	background: #2C3E50;
	color: white;
}
/**/
</style>

<script type="text/javascript">
var map;

$(document).ready(function() {
// 	$("#addShop a.dropdown-item").click(function(){
// 		$("#addShop > button").html( $(this).html() );
// 	})
	
// 	$("#select").click(function() {
// 		$f = $("<form>").attr({"action": "/product/addShop", "method": "post"})
// 			.append( $("<input>").attr({"type": "hidden", "name": "shopName", "value": $("#addShop > button").html()}) )
// 			.appendTo( $(document.body) );
// // 		$f.submit();
// 	});
	$("#shop_list > div").on("click", function(){
		addIndex($(this).index());
// 		console.log($(this).index());
		
	})
})

var index = new Array();
var result = new Array();
var zoomVal=0;
function initMap() {
	zoomVal=14;
 map = new google.maps.Map(document.getElementById('map'), {
center : new google.maps.LatLng(${37.4978525}, ${127.0285875}),
	zoom: zoomVal
 
});
var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

<c:forEach items="${shopList}" var="marker">
	var json  =new Object();
	json.shopNo=${marker.shopNo}
	json.shopName="${marker.shopName}"
	json.shopLat=${marker.shopLat};
	json.shopLng=${marker.shopLng};
	result.push(json);
</c:forEach>
//	console.log("jsoninfo="+JSON.stringify(result));
			
var infowindow = new google.maps.InfoWindow();
var markers = new Array();
var marker, i;
for (i = 0; i < result.length; i++) {
	$("#shop_list").append	
  marker = new google.maps.Marker({
    id:result[i].shopNo,
    name:result[i].shopName,
    label:{text:result[i].shopName,color:"white"},
    position: new google.maps.LatLng(result[i].shopLat, result[i].shopLng),
    map: map,
    icon : "/resources/images/icons/icon1.png"
    
  });
  markers.push(marker);
//     console.log(result[i]);
  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(result[i].shopName+"<br><button type='button' id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 지점 추가 </button>");
      infowindow.open(map, marker);
      
    }
  })(marker, i));
  	marker.addListener('click', function() {
      map.setZoom(15);
      map.setCenter(this.getPosition());
    });

};
////-------------
var markerCluster = new MarkerClusterer(map, markers,
        {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',gridSize:50} );
};
    

function addIndex(ind){
	
	for (var i =0 ; i<$("#index_body").children().length;i++){
		var no = $("#index_body").children("div").eq(i).children("input").eq(0).val();
		if(no == result[ind].shopNo){
			var index = $("#index_body").children("div").eq(i).index();
// 			console.log(index);
			$("#index_body").children("div").eq(index).remove();
			for(var j = i ; j<$("#index_body").children().length;j++){
				$("#index_body").children("div").eq(j).attr("data-index",j);
			}
    		$("#shop_list").children("div").eq(ind).removeClass("selected")		
			return false;
		}
	}
	var shop_div=$("#shop_list").children("div").eq(ind).addClass("selected")
	var div = $("#index_body").append("<div class='index_ele' data-index='"+$("#index_body").children().length+"'><input type='hidden' name='shopNo' value='"+result[ind].shopNo+"'/>"+result[ind].shopName+"</div>");
	
}


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


	<div id="map_body">
		<div id="map"></div>
	</div>
	<div id="shop_list">
		<c:forEach items="${shopList}" var="marker">
			<div>${marker.shopName }</div>
		</c:forEach>

	</div>
	<form>
		<div id="index_body"></div>
	</form>	
	<script
		src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">
	</script>

</div>


<jsp:include page="/WEB-INF/views/layout/product-footer.jsp" />
