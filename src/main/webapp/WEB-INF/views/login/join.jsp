<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery.com 의 CDN을 이용한 설치(배포) -->
<script type="text/javascript"
 src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		
        var idLength = $("#id").val();  // id 입력
        var idLengthCheck =  /^.{4,15}$/.test(idLength);   //영문,숫자
		

        
        //id 유효성 검사
        $("#id").blur(function(){
        	
            var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            
            if( !idReg.test( $("#id").val() ) ) {
                alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
                
                return;
            }
  
        	
        })
		
        //pw 유효성 검사
        $("#pw").blur(function(){
        	
         	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/g;  //영문,숫자
         	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,15}$/g;  //영문,특수문자
         	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,15}$/g;  //특수문자, 숫자
        	
            if(!(check1||check2||check3).test( $("#pw").val() )){
          		alert("비밀번호는 숫자, 대/소문자, 특수문자 중 2가지 이상을 조합한 8~15 자리가 가능합니다")
          		return;
          	}
        	
        })
        
       //이름 - 한글만 입력할 수 있도록, 한글이 아니라면 빈칸으로 대체됨(지워짐)
         $(".onlyHangul").keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
             }
         });
        
        //닉네임
        $("#nickname").blur(function(){
        	
            var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            
            if( !idReg.test( $("#nickname").val() ) ) {
                alert("닉네임은 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
                
            }
  
        	
        })
        
        //이메일 
        $("#email").blur(function(){
        	
        	if($('#email').val().includes('@') == false){
        		alert("이메일은 @를 포함해야합니다.");
                 
                return;
            }
  
        	
        })
        
        
        
        //휴대폰 번호 - 숫자만 입력할 수 있도록, 숫자가 아니라면 빈칸으로 대체됨(지워짐)
        $(".onlyNumber").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
        
        
		
		//회원가입 버튼 눌렀을 때
		$('#signUp').click(function(){
			            
			if($.trim($('#id').val()) == ''){
				alert("아이디 입력하세요");
				$('#id').focus();
				return;
			}else if($.trim($('#pw').val()) == ''){
				alert("패스워드 입력하세요");
				$('#pw').focus();
				return;
			}
			//패스워드 확인
			else if($('#pw').val() != $('#pwconfirm').val()){
				alert('패스워드가 다릅니다.');
				$('#pw').focus();
				return;
			}else if($.trim($('#name').val()) == ''){
				alert("이름을 입력하세요");
				$('#name').focus();
				return;	
			}else if($.trim($('#nickname').val()) == ''){
				alert("닉네임을 입력하세요");
				$('#nickname').focus();
				return;	
			}else if($.trim($('#nickname').val()) == ''){
				alert("닉네임을 입력하세요");
				$('#nickname').focus();
				return;	
			}else if($.trim($('#email').val()) == ''){
				alert("이메일을 입력하세요");
				$('#email').focus();
				return;
			}else if($.trim($('#phone').val()) == ''){
				alert("휴대전화번호를 입력하세요");
				$('#phone').focus();
				return;	
			}	
			if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				$('#joinForm').submit();
			}
		});
		
		$('#check').click(function(){
			$.ajax({
				url: "/login/idcheck",
				type: "GET",
				data:{
					"id":$('#id').val()
				},
				dataType : "html",
				success: function(data){
					console.log("ajax 성공")
					if(data == 0 && $.trim($('#id').val()) != '' ){
						idx=true;
						$('#id').attr("readonly", false);
						var html="<p style='color: green'>사용가능</p>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<p style='color: red'>사용 불가능한 아이디 입니다.</p>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
	});
</script>



</head>
<body>

<h1>회원가입</h1>
<hr>

<form id="joinForm" action="/login/join" method="post">

<!-- 아이디 -->
<div class="form-group" style="width: 30%;">
	<label for="id">아이디</label>
		<input type="text" class="form-control" id="id" name="id" placeholder="아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자" required>
		<input type="button" id="check" value="중복체크">
		
<div id="idCheck"></div>
</div>

<!-- 패스워드 -->
<div class="form-group" style="width: 30%;">
	<label for="pw">비밀번호</label>
		<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" required>
</div>

<!-- 패스워드 확인 -->
<div class="form-group" style="width: 30%;">
	<label for="pwconfirm">비밀번호 확인</label>
		<input type="password" class="form-control" id="pwconfirm" name="pwconfirm" placeholder="비밀번호 확인" required>
</div>

<!-- 이름 -->
<div class="form-group" style="width: 30%;">
	<label for="name">이름</label>
		<input type="text" class="form-control onlyHangul" id="name" name="name" placeholder="한글만 입력 가능" required>
</div>

<!-- 닉네임-->
<div class="form-group" style="width: 30%;">
	<label for="nickname">닉네임</label>
		<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임" required>
</div>

<!-- 이메일-->
<div class="form-group" style="width: 30%;">
	<label for="email">이메일</label>
		<input type="email" class="form-control" id="email" name="email" placeholder="이메일" required>
</div>

<!-- 휴대전화번호 -->
<div class="form-group" style="width: 30%;">
	<label for="phone">휴대전화번호</label>
		<input type="text" class="form-control onlyNumber" id="phone" name="phone" placeholder="-를 제외하고 숫자만 입력" required>
</div>


<input type="button" id="signUp" value="회원가입" />

</form>

</body>
</html>