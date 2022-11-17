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
          <input type="password" placeholder="패스워드" class="input" name="pw" id="signPw"><br />
          <input type="password" placeholder="패스워드 확인" class="input" name="pw2" id="signPw2"><br />
          <input type="button" class="btn large loginBtn" value="회원가입" onclick="signupCheck()"> 
       </form>
    </div>
  </div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
		
	<script type="text/javascript">
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
      </script>
      
<%@include file="../include/footer.jsp"%>