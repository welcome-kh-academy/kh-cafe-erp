<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>사원번호/비밀번호 찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/fontawesome-free/css/all.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<!--===============================================================================================-->
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

</script>

</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">

				<h2>사원번호/비밀번호 찾기</h2>

				<form class="login100-form validate-form"
					action="/findinfo/findidinfo" method="post">

					<div style="margin-bottom: 10px;">
						
						<input type="radio"  id="search_1"
							name="search_total" onclick="search_check(1)" checked="checked">
						<label for="search_1">사원번호 찾기</label>
					</div>


					<div>
						<input type="radio"  id="search_2"
							name="search_total" onclick="search_check(2)"> <label
							for="search_2">비밀번호 찾기</label>
					</div>



					




					<div id="searchId">
						<div class="wrap-input100 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input100" type="text" name="shopNo" id="shopNo"
								placeholder="지점번호 입력" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-user-o" aria-hidden="true"></i>
							</span>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input100" type="email" name="email" id="email"
								placeholder="이메일 입력" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-user-o" aria-hidden="true"></i>
							</span>
						</div>
						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="submit"
								name="findidbutton" onclick="idSearch_click()">찾기</button>
						</div>						
					</div>
					
					<div id="searchPw" style="display: none;">
						<div class="wrap-input100 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input100" type="text" name="staffNo" id="staffNo"
								placeholder="사원번호 입력" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-user-o" aria-hidden="true"></i>
							</span>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input100" type="email" name="email" id="email"
								placeholder="이메일 입력" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-user-o" aria-hidden="true"></i>
							</span>
						</div>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="submit"
								name="findpwbutton" onclick="idSearch_click()">찾기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->

</body>
</html>