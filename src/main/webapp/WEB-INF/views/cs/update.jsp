<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- ck 에디어 라이브러리 -->
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
<!-- 스마트 에디터2 라이브러리 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
//<form>이 submit되면
// 스마트 에디터 내용을 <textarea>반영해주는 함수

// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {
 // 에디터의 내용이 textarea에 적용된다.
 oEditors.getById["cBoardContent"].exec("UPDATE_CONTENTS_FIELD", []);

 try {
     elClickedObj.form.submit(); // <form> submit 수행
 } catch(e) {}
}

</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//작성버튼 동작
	$("#btnUpdate").click(function(){
		// 스마트에디터의 내용을 <textarea>에 적용
		submitContents($("#btnUpdate"));
		
		// form submit
 		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
});

</script>


<style type="text/css">
#content {
	width : 95%;
}

span {
	display : inline-block;
	float : left;
	height : 40px;
	background: #ccc;
	padding-left : 1px;
	padding-top : 5px;
	padding-bottom : 5px;
	text-align : center;
}

div {
	margin-top : 2px;
	margin-bottom : 2px;
}

</style>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<div class="container">

<div>

<form action="/cs/update" method="post">

	<input type="hidden" name="cBoardDate" value="${sysdate }"/>
	<input type="hidden" name="cBoardNo" value="${update.cBoardNo }"/>
	<div class="form-group">
		<label for="cBoardTitle">제목</label>
		<input type="text" id="cBoardTitle" name="cBoardTitle" class="form-control" value="${update.cBoardTitle }"/>
	</div>
	<div class="form-group">
		<label for="cBoardContent">본문</label>
		<textarea rows="20" style="width:100%" id="cBoardContent" name="cBoardContent" >${update.cBoardContent }</textarea>
	</div>



</form>
</div>

<div style="text-align:right;">
	<button class="btn btn-primary" id="btnUpdate1"  data-toggle="modal" data-target="#updateModal">수정</button>
	<button class="btn btn-secondary" id="btnCancel">취소</button>
</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<!-- 스마트 에디터 적용 코드 -->
<!-- <textarea>태그에 스마트 에디터의 스킨을 입히는 코드 -->
<script type="text/javascript">
var oEditors = []; 
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "cBoardContent", // 에디터가 적용되는 <textarea>의 id
 sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
 fCreator: "createSEditor2"
});
</script>

<div id="updateModal" class="modal fade">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">상담 내역</h5>
      </div>
      <div class="modal-body">
        <p>상담내역을 수정하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <a href="/cs/list"><input type="submit" id="btnUpdate" class="btn btn-danger" data-dismiss="modal" value="확인"></a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
