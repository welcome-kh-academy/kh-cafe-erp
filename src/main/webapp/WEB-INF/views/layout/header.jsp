<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 헤더 -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- 제이쿼리 3.2.1 버전 -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<title>: : : KH-CAFE ERP : : :</title>
<style type="text/css">
#wrapper{
	min-height:800px;
}
#footer{
	padding : 2rem;
	text-align : center;
	height : 130px;
	background-color : #2C3E50;
}
#regulation, #corporationInfo, #copyright {
	margin-bottom : 0.5rem;
}
</style>

</head>
<body>

<div id="header">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary static-top">
  <a class="navbar-brand" href="/dashboard/index" style="margin-top:5px"><img src="/resources/img/KH.png" style="height:40px; margin-bottom:5px;"/>ERP 통합 관리 프로그램</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">상품관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">주문관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">정산통계</a>
      </li>    
    </ul>
  </div>
	<ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">로그아웃</a>
      </li>    
 	</ul>
</nav>
</div>

<div id="wrapper">