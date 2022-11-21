<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    
    <script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
	
	<body>
		<form class="delete-form" action="deleteMember"  method="post" id="deleteCheck-form" name="deleteCheck-form">
		 <input type="checkbox" class="delete" name="agreecheck" id="agreecheck">탈퇴 동의합니다.<br>		 
		 <input type="submit" class="btn large loginBtn" value="탈퇴하기" name="checkButton" id="checkButton" disabled>
		 
			
	</form>
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
