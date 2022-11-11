<%@include file="../include/header.jsp"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css">
	<script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
    <div class="container">
      
      <div class="signup">Sign Up</div>
      <div class="login">Log In</div>
      
       <div class="signup-form">
          <input type="text" placeholder="Your Email Address" class="input"><br />
          <input type="text" placeholder="Choose a Username" class="input"><br />
          <input type="password" placeholder="Choose a Password" class="input"><br />
          <div class="btn">Create account</div>
       </div>
      
      <div class="login-form">
          <input type="text" placeholder="Email or Username" class="input"><br />
          <input type="password" placeholder="Password" class="input"><br />
          <div class="btn">log in</div>
          <span><a href="#">I forgot my username or password.</a></span>
       </div>
      
    </div>
  </div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
	
<%@include file="../include/footer.jsp"%>