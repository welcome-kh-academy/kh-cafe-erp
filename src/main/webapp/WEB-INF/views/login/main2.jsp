<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
   <title>메인 화면</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/fontawesome-free/css/all.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
   <link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<!--===============================================================================================-->


</head>
<body>
   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
               <img src="/resources/images/khlogo.png" alt="IMG">
            </div>

            
               <c:if test="${ login }">
                  <div class="container-login100-form-btn">
                  <a href="/dashboard/index">
                     <button class="login100-form-btn">
                        대쉬보드 시작하기
                     </button>
                  </a>
                  <br>
                  <a href="/login/logout">
                     <button class="login100-form-btn">
                        로그아웃
                     </button>
                  </a>
               </div>
               </c:if>
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
   <script src="/resources/vendor/tilt/tilt.jquery.min.js"></script>
   <script >
      $('.js-tilt').tilt({
         scale: 1.1
      })
   </script>
<!--===============================================================================================-->
   <script src="/resources/js/login.js"></script>

</body>
</html>