<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>사원번호 찾기실패</title>
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
</script>

</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">

				<h2>사원번호 안내</h2>

				<br><br>
					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						일치하는 사원번호가 없습니다. 
					</div>
					

					<div class="container-login100-form-btn">
						<a href="/login/main"> <button class="login100-form-btn" type="submit"
							name="gogologin">로그인화면으로</button></a>
					</div>
					
					<div class="container-login100-form-btn">
						<a href="/findinfo/findinfo"> <button class="login100-form-btn" type="submit"
							name="gogologin">다시조회하기</button></a>
					</div>

				
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