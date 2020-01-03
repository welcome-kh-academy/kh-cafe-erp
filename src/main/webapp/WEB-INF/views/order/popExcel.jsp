<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="/WEB-INF/views/layout/header-pop.jsp"/>

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready( function () {
	$("#uploadBtn").click(function(){
		var form = document.excelUpload;
		
		form.submit();
// 		opener.location.reload();
// 		window.close();
	});

});

</script>



<div id="pop" style="margin:20px">
<form action="/order/upload" method="post" class="orderMassive" name="excelUpload" enctype="multipart/form-data">
<fieldset>
<legend class="text-primary">엑셀 업로드</legend>
<p class="text-danger">엑셀 파일(.xlsx) 파일만 업로드 가능합니다</p>
<div class="form-group">
    <input type="file" name="excelFile" style="margin-bottom: 15px" /><br>
	<input style="float:right" id="uploadBtn" class="btn btn-outline-primary" type="button" value="업로드" />
  </div>
 </fieldset>
</form>
</div>

