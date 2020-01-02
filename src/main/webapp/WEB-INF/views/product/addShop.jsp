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
function openWindow(){
	var divInd = $(this.parentNode);
	var divBody=$(".index_body .selected_index")
	var index=divInd.index();
	var info ;
	console.log(divInd.attr("data-place_no"))
	console.log(divBody)
	console.log(index)
	var opwin=window.open("../map/test?startNo="+divBody.children("div").eq(index-1).attr("data-place_no")+"&endNo="+divInd.attr("data-place_no")
			,"childForm", "width=900px, height=600px, resizable = no, scrollbars = no"); 

}
function searchAll(){
	var divBody=$(".index_body")
	var info ;
	info = "../map/test?startNo="+divBody.children(".selected_index").children().eq(0).attr("data-place_no")+"&endNo="+divBody.children(".selected_index").children().eq(-1).attr("data-place_no");
	console.log($(".index_body").children(".selected_index").children().size())
	if ($(".index_body").children(".selected_index").children().size()>2){
		for(var i = 1 ; i<= $(".index_body").children(".selected_index").children().size()-2;i++){
			info+=("&index"+i+"="+divBody.children(".selected_index").children().eq(i).attr("data-place_no"));
			console.log(info);
			console.log(divBody.children(".selected_index").children().eq(i).attr("data-place_no"));
		}
	}
	var opwin=window.open(info,"childForm", "width=900px, height=600px, resizable = no, scrollbars = no"); 
	
	
	
	
}
function addIndex(ind){
	$.ajax({
		type: "get"
		, url: "/planner/placeInfo"
		, data: {"place_number":result[ind].place_number}
		, dataType: "html"
		, success: function(data) {
			$("#indexList").html(data);
		}
		, error: function() {
			console.log("fail");
		}
	})

      var button = div.children().children().eq(-1);
      button.on('click', function(){
    	  var indexDiv=$(this.parentNode);
    	  var indexBody=$(this.parentNode.parentNode);
    	  var index = indexDiv.index();
    	  var data_index=indexDiv.attr("data-index"); 
//     	  console.log(indexDiv.find('input').eq(0).val());
//     	  console.log(indexBody.children().eq(1).children('input').eq(0).val());
    	  if (index==0){
    		  if(indexBody.children().eq(1).children('input').eq(0).val()!="숙소"){
    		  alert("첫번째 장소는 무조건 숙소여야만 합니다.")
    		  return false;
    		  }
    	  }
    		indexBody.children().eq(index).remove();
    		indexBody.children().eq(index).attr("data-index",data_index);
    		path.removeAt(index);
    		if(index==0){
    		indexBody.children().eq(0).children("button").eq(0).remove();
    		}
      })
      
    
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
