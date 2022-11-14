<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css">
	<script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
    <div class="container">
    
      <div class="login">Log In</div>
      <div class="signup">Sign Up</div>
      
     
      <form class="login-form">
          <input type="email" placeholder="이메일" class="input"><br />
          <input type="password" placeholder="패스워드" class="input"><br />
          <button type="submit" class="btn">로그인</button>
          <span><a style="font-size: 12" href="#">비밀번호 잊어버렸어요.</a></span>
       </form>
       
      <form class="signup-form">
          <input type="email" placeholder="Your Email Address" class="input"><br />
          <input type="text" placeholder="Choose a Username" class="input"><br />
          <input type="password" placeholder="Choose a Password" class="input"><br />
          <div class="btn">Create account</div>
       </form>
       
    </div>
  </div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
	
<%@include file="../include/footer.jsp"%>