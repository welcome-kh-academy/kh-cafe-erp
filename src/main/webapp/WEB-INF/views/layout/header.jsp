<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 제이쿼리 3.2.1 버전 -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<!-- 헤더 -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- select2 4.0.5 버전 -->
<link rel="stylesheet" href="/resources/vendor/select2/select2.min.css" />

<!-- datepicker -->
<link href="/resources/css/datepicker.css">
<link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

<!-- select2 4.0.12 버전 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" /> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script> -->

<!-- 폰트 어썸 4.7 버전 -->
<link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">



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
        <a class="nav-link" href="/product/index">상품관리</a>
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