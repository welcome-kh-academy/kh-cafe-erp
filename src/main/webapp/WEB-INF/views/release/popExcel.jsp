<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready( function () {
	$("#uploadBtn").click(function(){
		var form = document.excelUpload;
		
		form.submit();
		window.opener.location.reload();
// 		window.close();
	});
});

</script>

<form action="/release/upload" method="post" class="releaseMassive" name="excelUpload" enctype="multipart/form-data">
	<input type="file" name="excelFile" style="margin-bottom: 15px" /><br>
	<input id="uploadBtn" class="btn btn-outline-primary" type="button" value="업로드" />
</form>
