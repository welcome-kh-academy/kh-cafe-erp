<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>
    
    <!-- Icons font CSS-->
    <link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/resources/css/join.css" rel="stylesheet" media="all">
    
    <!-- 제이쿼리 -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    
    <script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		
        var idLength = $("#staffNo").val();  // id 입력
        var idLengthCheck =  /^.{4,15}$/.test(idLength);   //영문,숫자
		

        
		
        //pw 유효성 검사
        $("#pw").blur(function(){
        	
         	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/g;  //영문,숫자
         	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,15}$/g;  //영문,특수문자
         	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,15}$/g;  //특수문자, 숫자
        	
            if(!(check1||check2||check3).test( $("#pw").val() )){
          		alert("비밀번호는 숫자, 대/소문자, 특수문자 중 2가지 이상을 조합한 8~15 자리가 가능합니다")
          		
          	}
        	
        })
        
       //이름 - 한글만 입력할 수 있도록, 한글이 아니라면 빈칸으로 대체됨(지워짐)
         $("#staffName").keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
             }
         });
        
        //닉네임
        $("#nick").blur(function(){
        	
            var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            
            if( !idReg.test( $("#nick").val() ) ) {
                alert("닉네임을 다시 입력해 주세요");
                
            }
  
        	
        })
        
        //이메일 
        $("#email").blur(function(){
        	
        	if($('#email').val().includes('@') == false){
        		alert("이메일은 @를 포함해야합니다.");
                 	
                	
            }
  
        	
        })
        
        
        
        //휴대폰 번호 - 숫자만 입력할 수 있도록, 숫자가 아니라면 빈칸으로 대체됨(지워짐)
        $("#cellNum").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
        
        //지점 번호 - 숫자만 입력할 수 있도록, 숫자가 아니라면 빈칸으로 대체됨(지워짐)
        $("#shopNo").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
        
        //직원등급 번호 - 숫자만 입력할 수 있도록 3까지, 숫자가 아니라면 빈칸으로 대체됨(지워짐)
        $("#position").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-3]/gi,''));
            }
        });
        
        
		
		//회원가입 버튼 눌렀을 때
		$('#btnJoin').click(function(){
			            
			if($.trim($('#staffName').val()) == ''){
				alert("아이디 입력하세요");
				$('#staffName').focus();
				
			}else if($.trim($('#pw').val()) == ''){
				alert("패스워드 입력하세요");
				$('#pw').focus();
				
			}
			//패스워드 확인
			else if($('#pw').val() != $('#pwConfirm').val()){
				alert('패스워드가 다릅니다.');
				$('#pw').focus();
				
			}else if($.trim($('#staffName').val()) == ''){
				alert("이름을 입력하세요");
				$('#name').focus();
					
			}else if($.trim($('#nick').val()) == ''){
				alert("닉네임을 입력하세요");
				$('#nick').focus();
					
			}else if($.trim($('#nick').val()) == ''){
				alert("닉네임을 입력하세요");
				$('#nick').focus();
					
			}else if($.trim($('#email').val()) == ''){
				alert("이메일을 입력하세요");
				$('#email').focus();
				
			}else if($.trim($('#cellNum').val()) == ''){
				alert("휴대전화번호를 입력하세요");
				$('#cellNum').focus();
			
			}else if($.trim($('#shopNo').val()) == ''){
				alert("휴대전화번호를 입력하세요");
				$('#cellNum').focus();	
					
			}else if($.trim($('#position').val()) == ''){
				alert("휴대전화번호를 입력하세요");
				$('#cellNum').focus();
				
			}else if($.trim($('#hiredDate').val()) == ''){
				alert("입사일을 입력하세요");
				$('#hiredDate').focus();
					
			}else if($.trim($('#gender').val()) == ''){
				alert("성별을 입력하세요");
				$('#gender').focus();
					
			}
			
			
			
			if(idx==false){
				alert("닉네임 중복체크를 해주세요.");
				
			}else{
				$('#joinForm').submit();
			}
		});
		
		$('#ncheck').click(function(){
			$.ajax({
				url: "/join/nickcheck",
				type: "GET",
				data:{
					"nick":$('#nick').val()
				},
				dataType : "html",
				success: function(data){
					console.log("ajax 성공")
					if(data == 0 && $.trim($('#nick').val()) != '' ){
						idx=true;
						$('#nick').attr("readonly", false);
						var html="<p style='color: green'>사용가능</p>";
						$('#nickCheck').empty();
						$('#nickCheck').append(html);
					}else{

						var html="<p style='color: red'>사용 불가능한 아이디 입니다.</p>";
						$('#nickCheck').empty();
						$('#nickCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
		$('#icheck').click(function(){
			
			
			
			$.ajax({
				url: "/join/idcheck",
				type: "GET",
				data:{
					"staffNo":$('#staffNo').val()
				},
				dataType : "json",
				success: function(data){
					console.log("ajax 성공")
					
					if(data.check == 0 && $.trim($('#staffNo').val()) != '') {
						var html="<p style='color: green'>사용가능</p>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					} else {
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
		
		 //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 marketingAgree, privacyInfoAgree인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=privacyInfoAgree]").prop("checked",true);
	            $("input[name=marketingAgree]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 marketingAgree, privacyInfoAgree인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=privacyInfoAgree]").prop("checked",false);
	            $("input[name=marketingAgree]").prop("checked",false);
	        }
	    })
		
		
		
	});
</script>
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">회원가입</h2>
                    <form id="joinForm" action="/join/join" method="post">
                    	<div class="row row-space">
                    	<div class="col-2">
                        <div class="input-group">
                          	 아이디<input class="input--style-1" type="text" placeholder="직원번호" id="staffNo" name="staffNo">
                        </div>
                        </div>
						<div class="col-2">
                        <div class="input-group">
                         	<br><br>
                            <input type="button" id="icheck" value="아이디 중복 체크">
                            <div id="idCheck"></div>        
                        </div>
                        </div>
                        </div>
                        
                        <div class="row row-space">
                        <div class="col-2">
                        <div class="input-group">
                           	닉네임<input class="input--style-1" type="text" placeholder="6~20자 영문자 또는 숫자" id="nick" name="nick">     
                        </div>      
                        </div>
                        <div class="col-2">
                        <div class="input-group">
                        		<br><br>                        
                            <input type="button" id="ncheck" value="닉네임 중복 체크">
                            <div id="nickCheck"></div>        
                        </div>
                        </div>
                        </div>
                        
                        <div class="input-group">
                            	비밀번호<input class="input--style-1" type="password" placeholder="숫자, 대/소문자, 특수문자 중 2가지 이상을 조합한  8~15자리" id="pw" name="pw">
                        </div>
                        <div class="input-group">
                           	 비밀번호 확인<input class="input--style-1" type="password" placeholder="비밀번호 확인" id="pwConfirm" name="pwConfirm">
                        </div>
                        <div class="input-group">
                            	이름<input class="input--style-1" type="text" placeholder="한글만 입력 가능" id="staffName" name="staffName">
                        </div>
                        <div class="input-group">
                            	이메일<input class="input--style-1" type="text" placeholder="예)id@domain.com" id="email" name="email">           
                        </div>
                        <div class="input-group">
                            	휴대전화번호<input class="input--style-1" type="text" placeholder="-를 제외하고 숫자만 입력" id="cellNum" name="cellNum">           
                        </div>
                        
                        <div class="row row-space">
                    	<div class="col-2">
                        <div class="input-group">
                            	지점번호<input class="input--style-1" type="text" placeholder="" id="shopNo" name="shopNo">
                        </div>
                        </div>
                        <div class="col-2">
                        <div class="input-group">
                           	직원등급<input class="input--style-1" type="text" placeholder="0~3" id="position" name="position">     
                        </div>      
                        </div>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    	입사일<input class="input--style-1 js-datepicker" type="text" placeholder="" id="hiredDate" name="hiredDate">
                                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <br><select id="gender" name="gender">
                                            <option disabled="disabled" selected="selected">성별</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

<!-- 회원약관 -->
	<div class="form-group">
		<label for="allAgree">모두 동의</label>
		<div id="allAgree">
			<div class="checkbox">
				<label> 
					<input type="checkbox"  id="checkall" autofocus="autofocus">
				</label>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label for="privacyInfoAgree"><a href ="/privacyRegulation.jsp" target="_blank" id= "privacy" >개인 정보 이용 동의 약관</a> <small id = redText> (필수)</small></label>
		<div id="privacyInfoAgree">
			<div class="checkbox">
				<label> 
					<input type="checkbox" name="privacyInfoAgree"  id="privacyInfoAgree"  value="1" autofocus="autofocus">
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="marketingAgree">마케팅 수신 동의 <small id = marketing>(선택)</small></label>
		<div  id="marketingAgree">
			<div class="checkbox">
				<label> 
					<input type="checkbox" name="marketingAgree"  id="marketingAgree" value="1" autofocus="autofocus">
				</label>
			</div>
		</div>
	</div>


                        <div class="p-t-20">
                            <button class="btn btn--radius " type="button" id="btnJoin" style="float: right; background-color: rgb(46, 62, 114);">가입</button>
                            <button class="btn btn--radius " type="button" id="btnCancel" style="float: right; margin-right: 8px; background-color: gray;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Vendor JS-->
    <script src="/resources/vendor/select2/select2.min.js"></script>
    <script src="/resources/vendor/datepicker/moment.min.js"></script>
    <script src="/resources/vendor/datepicker/daterangepicker.js"></script>

    <!-- Join JS-->
    <script src="/resources/js/join.js"></script>


</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->
    
    
    