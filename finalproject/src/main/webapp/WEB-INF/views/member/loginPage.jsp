<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css">
	<script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
  	<style>
  	button.loginBtn{
  		vertical-align:middle;
  	}
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
          <input type="button" class="btn large loginBtn" value="로그인" onclick="loginCheck()"> 
          <span><a style="font-size: 12" href="findPw">비밀번호 찾기</a></span>
       </form>
       
      <form class="signup-form" action="signUp" method="post" id="signup-form">
          <input type="email" placeholder="이메일" class="input" name="email" id="signEmail"><br />
          <input type="text" placeholder="닉네임" class="input" name="name" id="signName"><br />
          <input type="button" class="btn btn-primary btn-user btn-block" value="중복체크" onclick="nameCheck()">								
          <input type="password" placeholder="패스워드" class="input" name="pw" id="signPw"><br />
          <input type="password" placeholder="패스워드 확인" class="input" name="pw2" id="signPw2"><br />
          <input type="button" class="btn large loginBtn" value="회원가입" onclick="signupCheck()"> 
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
	
	    if($("#signEmail").val()==""){
	        alert("이메일을 입력하세요");
	        return;
	    }else if($("#signName").val()==""){
	        alert("닉네임을 입력하세요");
	        return;
	    }else if($("#signPw").val()==""){
	        alert("비밀번호를 입력하세요");
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
	// 닉네임 유효성 검사      
	function nameCheck() {
		
		var name = $("#signName").val(); //id태그 값에 접근
		var checkName= {"checkName":name};  //전송할 데이터의 key:value설정
		
		if(name.length < 1){
			alert("닉네임은 1글자 이상 입력하세요");	
		}else{  //아이디 중복 체크 
	
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
					
					if(result == "1"){ //중복된 아이디가 존재함
						alert("이미 존재하는 아이디가 있습니다.");
					}else{
						alert("사용가능한 닉네임 입니다.");
						//attr(속성, 변경할 값)함수는 태그의 내부속성을 변경하는 함수
					}
				}
			});
		}//else가 끝나는 부분
		console.log(checkName);
	}
 
</script>
      
<%@include file="../include/footer.jsp"%>