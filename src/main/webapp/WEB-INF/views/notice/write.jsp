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
 oEditors.getById["nBoardContent"].exec("UPDATE_CONTENTS_FIELD", []);

 try {
     elClickedObj.form.submit(); // <form> submit 수행
 } catch(e) {}
}

</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//작성버튼 동작
	$("#btnWrite").click(function(){
		
		//타이틀 비었는지 검사
		$("form").bind("submit", function(){
			if($("input[name=nBoardTitle]").val()=='') {
				//input value가 빈값 일 경우
				alert("제목을 입력해주세요");
				$("input[name=nBoardTitle]").focus();
				
				return false;
			}
		});

		// 스마트에디터의 내용을 <textarea>에 적용
		submitContents($("#btnWrite"));
		
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
<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 

<div class="container">

<h1>게시글 쓰기</h1>
<hr>

<div>

<!--  enctype="multipart/form-data" -->
<form action="/notice/write" method="post">

	<input type="hidden" name="nBoardDate" value="${sysdate }"/>
	<div class="form-group">
		<label for="staffName">작성자</label>
		<input type="text" id="staffName" name="staffName" value="${staffName }" readonly="readonly" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="nBoardTitle">제목</label>
		<input type="text" id="nBoardTitle" name="nBoardTitle" class="form-control" />
	</div>
	<div class="form-group">
		<label for="nBoardContent">본문</label>
		<textarea rows="10" style="width:100%" id="nBoardContent" name="nBoardContent"></textarea>
	</div>



</form>
</div>

<div style="text-align:right;">
	<button class="btn btn-info" id="btnWrite">작성</button>
	<button class="btn btn-danger" id="btnCancel">취소</button>
</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<!-- 스마트 에디터 적용 코드 -->
<!-- <textarea>태그에 스마트 에디터의 스킨을 입히는 코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "nBoardContent", // 에디터가 적용되는 <textarea>의 id
 sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
 fCreator: "createSEditor2"
});
</script>
