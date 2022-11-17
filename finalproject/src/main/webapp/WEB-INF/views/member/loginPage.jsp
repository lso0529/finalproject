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
      
     
      <form class="login-form" action="login" method="post">
          <input type="email" placeholder="이메일" class="input" name="email"><br />
          <input type="password" placeholder="패스워드" class="input" name="pw"><br />
          <button type="submit" class="btn large loginBtn">로그인</button>
          <span><a style="font-size: 12" href="findPw">비밀번호 찾기</a></span>
       </form>
       
      <form class="signup-form" action="signUp" method="post">
          <input type="email" placeholder="이메일" class="input" name="email" id="email"><br />
          <input type="text" placeholder="닉네임" class="input" name="name" id="name"><br />
          <input type="password" placeholder="패스워드" class="input" name="pw" id="pw"><br />
          <button type="submit" class="btn large loginBtn">회원가입</button>
       </form>
       
    </div>
  </div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
	
	
	
<%@include file="../include/footer.jsp"%>