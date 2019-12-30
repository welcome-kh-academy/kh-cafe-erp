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

<!-- 게시판(테이블) dataTable 1.10.19 & 부트스트랩4 버전 -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


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
.dropdown:hover .dropdown-menu {
	margin-top:25px;
	background-color : #2C3E50;
    display: block;
    margin-top: 0;
}
.dropdown-menu ul li a{
	text-decoration : none;
}

.dropdown-menu ul li :hover{
	color : #25b09c;
}

.menubar li a{
	color : white;
	width: 150px;
    text-align: center;
    margin-right: 20px;
}

li{
	list-style:none;
	margin : 5px 0px;
}
.nav-link{
	font-size : 20px;
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
  <div class="collapse navbar-collapse menubar" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link" href="/product/index">상&nbsp;&nbsp;&nbsp;품</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="/manageProduct/list">상품 관리</a></li>
        	<li><a href="/product/index">상품 등록</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="#">주&nbsp;&nbsp;&nbsp;문</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="#">주문 관리</a></li>
        	<li><a href="#">주문 등록</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="#">발&nbsp;&nbsp;&nbsp;주</a>
        <div class="dropdown-menu">
        <ul>
        	<li><a href="#">발주 관리</a></li>
        	<li><a href="#">발주 등록</a></li>
        </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">정산 · 통계</a>
      </li>    
      <li class="nav-item">
        <a class="nav-link" href="#">직원&nbsp;&nbsp;&nbsp;관리</a>
      </li>    
    </ul>
  </div>
	<ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#myModal">로그아웃</a>
      </li>    
 	</ul>
</nav>
</div>

<div id="myModal" class="modal fade">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그아웃</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>로그아웃 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location.href='/login/logout'">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div id="wrapper">