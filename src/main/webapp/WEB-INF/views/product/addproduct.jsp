<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<link href="/resources/css/add-product.css" rel="stylesheet">

<style type="text/css">

#crumbs ul li #productHeader_2 {
  background-color: #2C3E50;
  color: #fff;
}

fieldset{
	margin : 28px 30px;
}
table{
	width : 90%;
	margin : 20px;
}
td div{
	margin : 0px 20px;
	margin-bottom:5px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	//경고 모달 호출 메서드
	function warningModal(content) {
		$(".modal-contents").text(content);
		$("#defaultModal").modal('show');
	}
	
	$(function(){
		//필수 입력사항 검사
        //빈칸 여부 검사
        $('#productName').keyup(function(event){
             
            var divProductName = $('#divProductName');
             
            if($('#productName').val()==""){
            	divProductName.removeClass("has-success");
            	divProductName.addClass("has-error");
            }else{
            	divProductName.removeClass("has-error");
                divProductName.addClass("has-success");
            }
        });
		
        $('#productOrigin').keyup(function(event){
             
            var divProductOrigin = $('#divProductOrigin');
             
            if($('#productOrigin').val()==""){
            	divProductOrigin.removeClass("has-success");
            	divProductOrigin.addClass("has-error");
            }else{
            	divProductOrigin.removeClass("has-error");
            	divProductOrigin.addClass("has-success");
            }
        });
        $('#productContent').keyup(function(event){
             
            var divProductContent = $('#divProductContent');
             
            if($('#productContent').val()==""){
            	divProductContent.removeClass("has-success");
            	divProductContent.addClass("has-error");
            }else{
            	divProductContent.removeClass("has-error");
            	divProductContent.addClass("has-success");
            }
        });
        $('#productImage').keyup(function(event){
             
            var divProductImage = $('#divProductImage');
             
            if($('#productImage').val()==""){
            	divProductImage.removeClass("has-success");
            	divProductImage.addClass("has-error");
            }else{
            	divProductImage.removeClass("has-error");
            	divProductImage.addClass("has-success");
            }
        });
       
		$('#originPrice').keyup(function(event){
             
            var divOriginPrice = $('#divOriginPrice');
             
            if($('#originPrice').val()==""){
            	divOriginPrice.removeClass("has-success");
            	divOriginPrice.addClass("has-error");
            }else{
            	divOriginPrice.removeClass("has-error");
            	divOriginPrice.addClass("has-success");
            }
        });
       
		$('#price').keyup(function(event){
             
            var divPrice = $('#divPrice');
             
            if($('#price').val()==""){
            	divPrice.removeClass("has-success");
            	divPrice.addClass("has-error");
            }else{
            	divPrice.removeClass("has-error");
            	divPrice.addClass("has-success");
            }
        });
		
		$("form").submit(function(event) {
            var divProductName = $('#divProductName');
            var divProductOrigin = $('#divProductOrigin')
            var divProductContent = $('#divProductContent')
            var divProductImage = $('#divProductImage')
            var divOriginPrice = $('#divOriginPrice');
            var divPrice = $('#divPrice');
            
            if($('#productName').val()==""){
                warningModal("제품명을 입력하여 주시기 바랍니다.");
                 
                divProductName.removeClass("has-success");
                divProductName.addClass("has-error");
                $('#productName').focus();
                return false;
            }else{
            	divProductName.removeClass("has-error");
            	divProductName.addClass("has-success");
            }
           
            if($('#productOrigin').val()==""){
                warningModal("제조사를 입력하여 주시기 바랍니다.");
                 
                divProductOrigin.removeClass("has-success");
                divProductOrigin.addClass("has-error");
                $('#productOrigin').focus();
                return false;
            }else{
            	divProductOrigin.removeClass("has-error");
            	divProductOrigin.addClass("has-success");
            }
           
            if($('#productContent').val()==""){
                warningModal("제품소개를 입력하여 주시기 바랍니다.");
                 
                divProductContent.removeClass("has-success");
                divProductContent.addClass("has-error");
                $('#productContent').focus();
                return false;
            }else{
            	divProductContent.removeClass("has-error");
            	divProductContent.addClass("has-success");
            }
           
            if($('#productImage').val()==""){
                warningModal("제품사진을 등록하여 주시기 바랍니다.");
                 
                divProductImage.removeClass("has-success");
                divProductImage.addClass("has-error");
                $('#productImage').focus();
                return false;
            }else{
            	divProductImage.removeClass("has-error");
            	divProductImage.addClass("has-success");
            }

            if($('#originPrice').val()==""){
                warningModal("원가를 입력하여 주시기 바랍니다.");
                 
                divOriginPrice.removeClass("has-success");
                divOriginPrice.addClass("has-error");
                $('#originPrice').focus();
                return false;
            }else{
            	divOriginPrice.removeClass("has-error");
            	divOriginPrice.addClass("has-success");
            }

            if($('#price').val()==""){
                warningModal("판매가를 입력하여 주시기 바랍니다.");
                 
                divPrice.removeClass("has-success");
                divPrice.addClass("has-error");
                $('#price').focus();
                return false;
            }else{
            	divPrice.removeClass("has-error");
            	divPrice.addClass("has-success");
            }
		})
	})
})
</script>

<!-- 상품헤더-->
<div id="crumbs">
	<ul>
		<li><a id=productHeader_1 href="#1"><b>카테고리 등록</b></a></li>
		<li><a id=productHeader_2 href="#2"><b>상품기초정보등록</b></a></li>
		<li><a id=productHeader_3 href="#3"><b>상품 옵션 등록</b></a></li>
		<li><a id=productHeader_4 href="#4"><b>판매 지점 등록</b></a></li>
	</ul>
</div>


<div id="addProduct">
	<fieldset>
		<legend class="text-primary">상품 기본 정보</legend>
		<form class="addProductForm" action="/product/saveRegisterMap" method="post" enctype="multipart/form-data">
			<table>
				<tr style="height:10px"><td></td></tr>
				<tr>
					<td>
					<div>
						<label for="categoryBase">카테고리</label>
						<input type="text" class="form-control" id="categoryBase" value="${addProduct.categoryName }" disabled>
						<input type="hidden" class="form-control" name="categoryBase" value="${addProduct.categoryNo }">
					</div>
					</td>
					<td style="width:50%">
					<div>
						<label for="categoryDetail">상세 카테고리</label>
						<input type="text" class="form-control" id="categoryDetail" value="${addProduct.categoryDetailName }" disabled>
						<input type="hidden" class="form-control" name="categoryDetail" value="${addProduct.categoryDetailNo }">
					</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="divProductName">
							<label for="productName">제품명</label>
							<input type="text" class="form-control" id="productName" name="productName">
						</div>
					</td>
					<td>
						<div id="divProductOrigin">
							<label for="productOrigin">제조사</label>
							<input type="text" class="form-control" id="productOrigin" name="productOrigin">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="divProductContent">
							<label for="productContent">상품 소개</label>
							<textarea class="form-control" id="productContent" name="productContent" style="width:100%; height:200px; resize: none; overflow:auto"></textarea>
						</div>
					</td>
					<td>
						<div id="divProductImage" style="padding-bottom:155px;">
							<label for="productImage">제품 이미지</label>
							<input type="file" class="form-control-file" name="productImage" id="productImage">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="divOriginPrice">
							<label for="originPrice">원가</label>
							<input type="number" class="form-control" id="originPrice" name="originPrice">							
						</div>
					</td>
					<td>
						<div id="divPrice">
							<label for="price">판매가</label>
							<input type="number" class="form-control" id="price" name="price">							
						</div>
					</td>
				</tr>
				</table>
		</form>
	</fieldset>

</div>

<!-- 경고 모달창 -->
<div class="modal fade" id="defaultModal">
	 <div class="modal-dialog">
	     <div class="modal-content panel-danger">
    	     <div class="modal-header panel-heading">
        	     <h4 class="modal-title">오류 메시지</h4>
              </div>
              <div class="modal-body">
              	<p class="modal-contents"></p>
              </div>
              <div class="modal-footer">
              	<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
              </div>
          </div>
      </div>
</div>


<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>