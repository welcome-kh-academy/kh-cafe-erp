<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}

/* basic stylings ------------------------------------------ */
body {
	background: url(https://scotch.io/wp-content/uploads/2014/07/61.jpg);
}

.container {
	font-family: 'Roboto';
	width: 600px;
	margin: 30px auto 0;
	display: block;
	background: #FFF;
	padding: 10px 50px 50px;
}

h2 {
	text-align: center;
	margin-bottom: 50px;
}

h2 small {
	font-weight: normal;
	color: #888;
	display: block;
}

.footer {
	text-align: center;
}

.footer a {
	color: #53B2C8;
}

/* form starting stylings ------------------------------- */
.group {
	position: relative;
	margin-bottom: 45px;
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	display: block;
	width: 300px;
	border: none;
	border-bottom: 1px solid #757575;
}

input:focus {
	outline: none;
}

/* LABEL ======================================= */
label {
	color: #999;
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label {
	top: -10px;
	font-size: 14px;
	color: #5264AE;
}

/* BOTTOM BARS ================================= */
.bar {
	position: relative;
	display: block;
	width: 300px;
}

.bar:before, .bar:after {
	content: '';
	height: 2px;
	width: 0;
	bottom: 1px;
	position: absolute;
	background: #5264AE;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

.bar:before {
	left: 50%;
}

.bar:after {
	right: 50%;
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
	width: 50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
	position: absolute;
	height: 60%;
	width: 100px;
	top: 25%;
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}

/* active state */
input:focus ~ .highlight {
	-webkit-animation: inputHighlighter 0.3s ease;
	-moz-animation: inputHighlighter 0.3s ease;
	animation: inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@
-webkit-keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}

}
@
-moz-keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}

}
@
keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}
}
</style>
<meta charset="UTF-8">
<title>사원번호/이모티콘 찾기</title>
<script type="text/javascript">
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchPw").style.display = "none";
			document.getElementById("searchId").style.display = "";
		} else {
			document.getElementById("searchId").style.display = "none";
			document.getElementById("searchPw").style.display = "";
		}
	}
	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/userSearch?inputshopNo="
					+$('#shopNo').val()+"&inputemail="+$('#email').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}
	$(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
		});
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/findinfo/Modal.jsp" %>
	<div class="container">

		<h2>
			사원번호 / 비밀번호 찾기<small>KH-CAFE</small>
		</h2>

		<form action="/findinfo/findinfo" method="post">

			<div style="margin-bottom: 10px;">

				<input type="radio" id="search_1" name="search_total"
					onclick="search_check(1)" checked="checked" >사원번호 찾기
					
			</div>

			<div>
				 비밀번호 찾기<input type="radio" id="search_2" name="search_total"
					onclick="search_check(2)">
			</div>

			<div id="searchId">
				<div class="group">
					<input type="text" name="shopNo" id="shopNo" required> <span
						class="highlight"></span> <span class="bar"></span> <label>지점번호</label>

				</div>

				<div class="group">
					<input type="text" name="email" id="email" required> <span
						class="highlight"></span> <span class="bar"></span> <label>Email</label>
				</div>

				<div class="form-group">
					<button id="searchBtn" type="button" onclick="idSearch_click()"
						class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"
						href="${pageContext.request.contextPath}">취소</a>
				</div>
			</div>


			<div id="searchPw" style="display : none;">
				<div class="group">
					<input type="text" name="staffNo" id="staffNo" required> <span
						class="highlight"></span> <span class="bar"></span> <label>사원번호</label>

				</div>

				<div class="group">
					<input type="text" name="email" id="email" required> <span
						class="highlight"></span> <span class="bar"></span> <label>Email</label>
				</div>

				<div class="form-group">
					<button id="searchBtn" type="button" onclick="pwSearch_click()"
						class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"
						href="${pageContext.request.contextPath}">취소</a>
				</div>
			</div>

		</form>


	</div>
</body>
</html>