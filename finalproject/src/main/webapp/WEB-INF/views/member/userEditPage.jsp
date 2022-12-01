<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<style>
.profil-div{
	width: 70px; height: 70px;
	border-radius: 70%;
	overflow: hidden;
}
.profil-image{
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.item-wrapper {
    position: relative;
}
.item-over-image1 {
    right: 0;
    bottom: 1px;
}
.item-over-image2 {
    position: relative;
    right: -45px;
    top: -20px;
    bottom: 0px;
    background-color: white;
    border-radius: 70%
}
</style> 

<% 
String user_email = (String)session.getAttribute("user_email");
String user_name =  (String)session.getAttribute("user_name");

session.setAttribute("user_email", user_email);

%>

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>회원정보</h2>
		</header>
		
		<div>
			<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 pt-0 pb-4 bg-dark">
					<div class="media align-items-end profile-header">
						<div class="media-body mb-5 text-white">
						
						<div class="wrapper item-wrapper">
							<div class="profil-div">
								<div class="uploadResult">
									<!-- <img class="profil-image item-over-image" src="${pageContext.request.contextPath}/resources/images/test profil.jpg" alt="프로필"> -->
								</div>
							</div>								
							<div class="uploadDiv">
								<img class="item-over-image2" id=target_image title="프로필 사진 수정"src="${pageContext.request.contextPath}/resources/images/free-icon-camera-4778794.png">
								<input type="file" id="uploadfile" name="uploadfile" accept="image/*" style="display: none;" multiple>
							</div>
						</div>
							<h4 class="mt-0 mb-0"><%=user_name%></h4>
							<div class="small mb-4">
								<i class="fa mr-2"></i><%=user_email%>
							</div>
						</div>
					</div>
				</div>
				<br> <br>
				<div class="py-4 px-4">
					<div class="d-flex align-items-center justify-content-between mb-3">
						
						<a href="deleteCheck" >회원탈퇴</a>
						<a href="pwUpdatePage">비밀번호 변경 </a>
					</div>
				</div>
			</div>
		</div>
	</article>
			<!-- End profile widget -->
</div>
<!-- include jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" intergrity="sha256-FgqCb/KJQILNfOu91ta32o/NMZxItwRo8qtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>

	$('#target_image').click(function (e) {
    	$('#uploadfile').click();
	});  
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 파일 확장자 제한 
	var maxSize = 5242880; // 5MB 제한
	
	// 업로드전 파일 체크 
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// 파일 업로드 함수 
	$(function(){
		$("#uploadfile").on("change", function(e){
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var fileInput = e.target;
			var files = fileInput.files[0];
			
			console.log(fileInput);
			console.log(fileInput.files[0]);
			console.log(inputFile);
			console.log(inputFile[0]);
			
			console.log(files);
			
			var email = "<%=user_email%>";
			
			// 업로드전 파일 체크 함수 실행
			if(files != null){
				if(!checkExtension(files.name, files.size)){
					return false;
				}
					formData.append("uploadFile", files);
					formData.append("email", email);
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result){
					alert("업로드 완료!");
					console.log("result"+result);
					
					showUploadedFile(result);// 업로드 결과 처리 함수
					window.location.replace("/member/userEditPage");
				}
			}); // $.ajax
		});
	});
	
	// 업로드된 파일 섬네일로 출력
	var uploadResult = $(".uploadResult");
	
	function showUploadedFile(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){}
		
		var uploadResult = $(".uploadResult");
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "-" + obj.fileName);
				console.log("fileCallPath:"+fileCallPath);
				
				str += "<img class='profil-image item-over-image1' src='/display?fileName="+fileCallPath+"'>";
		
		});
		uploadResult.append(str);
	}
	
	// 페이지내의 세션중에 user_email 정보를 받아서 
	// ajax로 통신하여 email을 매개로 DB에 
	// 저장된 uuid,filePath,fileName을 가져와 서버내에 
	// 저장되어 있는 이미지파일을 불러와야 한다.
	$(function(){
		
		var formData = new FormData();
		var email = "<%=user_email%>";
		
		formData.append("email", email);
		
		$.ajax({
			url: '/loadProfile',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log("다녀왔어: "+result);
				
				showUploadedFile(result);// 업로드 결과 처리 함수
				
			}
		}); // $.ajax
	});

</script>



<%@include file="../include/footer.jsp"%>