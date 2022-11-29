<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css">
	<script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
  	<style>
  	/*button.loginBtn{
  		vertical-align:middle;
  	}
  	html{
  		font-size: 22px;
  	}*/
  	</style>
</head>
<body>

	<div class="wrapper">
    <div class="container">
    
      <div class="login">Log In</div>
      <div class="signup">Sign Up</div>
      
     
      <form class="login-form" action="login" method="post" id="login-form">
          <input type="email" placeholder="이메일" class="input" name="email" id="loginEmail"><br />
          <input type="password" placeholder="패스워드" class="input" name="pw" id="loginPw"><br />
          <input type="button" style="width: 100%"  value="로그인" onclick="loginCheck()" style="padding: 0px"> 
           <font  style = "font-family: Hi Melody"> </font>
          <span><a style="font-size: 8;" href="findPw">비밀번호 찾기</a></span>
       </form>
       
      <form class="signup-form" action="signUp" method="post" id="signup-form">
          <input type="email" placeholder="이메일" class="input" name="email" id="signEmail"><br />
           <font id = "checkEmail2" size = "3"></font>
          
          <!--<input type="button" class="btn" value="이메일 중복 체크" onclick="emailCheck()"> -->
          
          <input type="text" placeholder="닉네임" class="input" name="name" id="signName"><br />
          <font id = "checkNickName" size = "3"></font>
          <!-- <input type="button" class="btn loginBtn" value="닉네임 중복 체크" onclick="nameCheck()"> -->
          <input type="hidden" id="duplicateCheck" value="idUncheck">								
          
          <input type="password" placeholder="패스워드" class="input" name="pw" id="signPw"><br />
          <input type="password" placeholder="패스워드 확인" class="input" name="pw2" id="signPw2"><br />
          
          <input type="button" value="회원가입" style="width: 100%;" onclick="signupCheck()" id="sign_btn" style="padding: 0px">
          <!-- <button type="button" value="회원가입" style="width: 100%;" onclick="signupCheck()" id="sign_btn" style="padding: 0px">회원가입</button> -->
          <!-- <button type="button" style = "font-size: 20px; height: 50px; width: 130px; line-height: 25px" onclick="location.href='list?topic=${vo.topic}'">목록으로</button> -->
      	  <font  id="sign_btn" style = "font-family: Hi Melody"> </font>
       </form>
    </div>
  </div>

<script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
	
<script type="text/javascript">
	// 로그인 실패 메시지 
	var msg = "${msg}"
	if (msg != ""){
		alert(msg);
	}
	
	function signupCheck() {
		var pw= $("#signPw").val();

	    if($("#signEmail").val()==""){
	        alert("이메일을 입력하세요");
	        return;
	    }else if($("#signName").val()==""){
	        alert("닉네임을 입력하세요");
	        return;
	    }else if($("#signPw").val()==""){
	        alert("비밀번호를 입력하세요");
	        return;
	    }else if(pw.length < 8 ){
			alert("비밀번호 8글자 이상 입력하세요");	    
			return;
	    }else if($("#signPw").val() != $("#signPw2").val()){
	        alert("비밀번호가 일치하지 않습니다.");    
	        return;
	    }else {
	        $("#signup-form").submit();
    	}  
	}
	 
	function loginCheck() {
	
	    if($("#loginEmail").val()==""){
	        alert("이메일을 입력하세요");
	        return;
	    }else if($("#loginPw").val()==""){
	        alert("비밀번호를 입력하세요");
	        return;
	    }else {
	        $("#login-form").submit();
	    }
	}
	
	// 닉네임 중복 검사      
	$("#signName").focusout(function nameCheck() {
		
		var name = $("#signName").val(); //id태그 값에 접근
		var checkName= {"checkName":name};  //전송할 데이터의 key:value설정
		var specialCharacter = /[~!@#$%^&*()+|<>?:{}]/;
		
		if(name.length < 1){
			alert("닉네임은 1글자 이상 입력하세요");	
		}else if(specialCharacter.test(name)==true){
			alert("닉네임은 _를 제외한 특수문자를 포함 할 수 없습니다");	
		}else{  //아이디 중복 체크 
	
			//ajax문법
			//ajax문법
			$.ajax({
				type : "post", 		//요청형식
				url : "/member/checkName",	//요청할 주소
				data : checkName, //서버에 전송할 데이터 json형식 {key:value}
				datatype : "text", //서버에서 요청후 리턴해 주는 타입
				error : function(request, error){
					alert(error + "\n" + request.status)
				},
				success : function(result){
					//ajax통신에 성공했을 때에 호출될 자바스크립트 함수, 결과 여부가
					//result매개변수로 전달됨.
					console.log("있음(1)없음(0) 여부 : "+result);
					
						<!--document.querySelector("#signName").style.setProperty('padding','5px');-->
						document.querySelector("#signName").style.setProperty('margin','5px');
						
					if(result == "1"){ //중복된 아이디가 존재함
						$("#checkNickName").html("이미 존재하는 닉네임이 있습니다.");
					    $("#checkNickName").attr('color','red')
					    
					}else{
						console.log(result);
						$("#checkNickName").html("사용가능한 닉네임 입니다.");
						$("#checkNickName").attr('color','black')
						$("#duplicateCheck").val("idCheck");
						//attr(속성, 변경할 값)함수는 태그의 내부속성을 변경하는 함수
					}
				}
			});
		}//else가 끝나는 부분
	});
	
	// 이메일 중복 검사
	$("#signEmail").focusout(function emailCheck() {
		var email = $("#signEmail").val(); //id태그 값에 접근
		var checkEmail= {"checkEmail":email};  //전송할 데이터의 key:value설정
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		
		if(exptext.test(email)==false){
			alert("이메일 형식이 옳바르지 않습니다.");	
		}else{  //아이디 중복 체크 
	
			//ajax문법
			$.ajax({
				type : "post", 		//요청형식
				url : "/member/checkEmail",	//요청할 주소
				data : checkEmail, //서버에 전송할 데이터 json형식 {key:value}
				datatype : "text", //서버에서 요청후 리턴해 주는 타입
				error : function(request, error){
					alert(error + "\n" + request.status)
				},
				success : function(result){
					//ajax통신에 성공했을 때에 호출될 자바스크립트 함수, 결과 여부가
					//result매개변수로 전달됨.
					console.log("있음(1)없음(0) 여부 : "+result);
					
					<!--document.querySelector("#signEmail").style.setProperty('padding','5px');-->
					document.querySelector("#signEmail").style.setProperty('margin','5px');
					if(result == "1"){ //중복된 이메일이 존재함
						$("#checkEmail2").html("이미 존재하는 이메일이 있습니다.");
						$("#checkEmail2").attr('color','red')
					
					}else{
						console.log(result);
						$("#checkEmail2").html("사용가능한 이메일 입니다.");
						$("#checkEmail2").attr('color','black')
						$("#duplicateCheck").val("idCheck");
						//attr(속성, 변경할 값)함수는 태그의 내부속성을 변경하는 함수
					}
				}
			});
		}//else가 끝나는 부분
		console.log(checkEmail);
		
	});
	
</script>
      
<%@include file="../include/footer.jsp"%>