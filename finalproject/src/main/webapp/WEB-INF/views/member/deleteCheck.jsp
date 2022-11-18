<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
	
	<body>
		<form class="delete-form" action="deleteMember"  method="post" id="deleteCheck-form" name="deleteCheck-form">
		 <input type="checkbox" class="delete" name="agreecheck" id="agreecheck" >탈퇴 동의합니다.<br>		 
		 <input type="button" class="btn large loginBtn" value="탈퇴하기" name="checkButton" disabled>
		 
			
	</form>
	</body>
	<script>
	
	
	if($("#agreecheck").is(".checked")== true){
		console.log('체크된 상태');
	}
	if($("#agreecheck").is(".checked")== false){
		console.log('체크 안 된 상태');
	}
	
	</script>
	
<%@include file="../include/footer.jsp"%>
