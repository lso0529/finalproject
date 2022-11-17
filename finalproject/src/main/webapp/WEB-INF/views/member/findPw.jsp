<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/login.css">
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="container">

			<form class="findPw-form" action="emailCheckAndfindPwPage" method="POST" id="email_check_form">
			
				<input type="email" placeholder="이메일을 입력하세요" class="input"name="email" id="email">
				<input type="button"class="btn large loginBtn" value="확인" onclick="checkEmail()"> 
				<input type="button" class="btn large loginBtn" value="취소" onclick="location.href='loginPage'">

			</form>

		</div>
	</div>
	
<script type="text/javascript">

	var msg = "${msg}";
	
	if (msg != "") {
		alert(msg);
	}

	function checkEmail() {
		
		
	
		if($("#email").val()==""){
	        alert("이메일을 입력해주세요.");
	        return;
	    }else {
	        $("#email_check_form").submit();
	    }
		
	}

	
</script>

<%@include file="../include/footer.jsp"%>