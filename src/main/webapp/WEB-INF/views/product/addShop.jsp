<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {

// 	$("#addShop").click(function(){
// 	      $("#addShop").html("<div class='btn-group' role='group' aria-label='Button group with nested dropdown'> <button type='button' class='btn btn-outline-primary'>Primary</button>"+
// 	              "<div class='btn-group show' role='group'> <button id='btnGroupDrop1' type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'"+ 
// 	              "aria-haspopup='true' aria-expanded='true'></button><div class='dropdown-menu show' aria-labelledby='btnGroupDrop1'"+
// 	              "style='position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;' x-placement='bottom-start'>"+
// 	              "<a class='dropdown-item' href='#'>Dropdown link</a><a class='dropdown-item' href='#'>Dropdown link</a></div></div></div>");
// 	   })
	   
	
})
</script>
<h1>판매지점 등록하기이이이이이</h1>
<hr>
<div class="text-center">
<div id="addShop" class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-outline-primary">Primary</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;" x-placement="bottom-start">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
