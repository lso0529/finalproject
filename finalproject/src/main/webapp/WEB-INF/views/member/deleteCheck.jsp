<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css">
    <script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
	
	<body>
	
			<div class="wrapper">
           <div class="container">
	     
	    
		<form class="delete-form" action="deleteMember"  method="post" id="deleteCheck-form" name="deleteCheck-form">
		<div align="center">
			<input type="checkbox" style="width: 5%; text-align: center;" class="delete" name="agreecheck" id="agreecheck" >탈퇴 동의합니다.<br>
		</div>		 
		<!-- <input type="submit" class="btn large loginBtn" value="탈퇴하기" name="checkButton" id="checkButton" disabled>-->
		<div style="padding:1px;"> </div>
		<div align="center">	
			<button type="button" style = "font-size: 20px; height: 50px; width: 130px; line-height: 25px" name="checkButton" id="checkButton" disabled>탈퇴하기</button>
			<button type="button" style = "font-size: 20px; height: 50px; width: 130px; line-height: 25px" onclick="location.href='userEditPage'">취소</button>	
		</div>
	</form>
	</div>
	</div>
	</body>
	<script>
	
	$('#agreecheck').click(function(){
		let check = $('#agreecheck').prop('checked');
		
		if(check){
			console.log("체크");
			const target = document.getElementById('checkButton');
			target.disabled= false;		
		}else{
			console.log("체크 해제")
			const target = document.getElementById('checkButton');
			target.disabled= true;
		}
	})
	
	
	
	</script>
	
<%@include file="../include/footer.jsp"%>