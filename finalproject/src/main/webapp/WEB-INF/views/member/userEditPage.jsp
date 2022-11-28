<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<style>
.profil-modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.profil-modal-content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
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
						<div class="profile mr-3"></div>
						<div class="media-body mb-5 text-white">
							<div class="profil-div">
								<img class="profil-image" src="${pageContext.request.contextPath}/resources/images/test profil.jpg" alt="프로필">
							</div>
							<div class="uploadResult">
								<ul>
									
								</ul>
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
					<div
						class="d-flex align-items-center justify-content-between mb-3">

						<a href="deleteCheck" >회원탈퇴</a>
						<a href="pwUpdatePage">비밀번호 변경 </a>
					</div>
				</div>
			</div>
		</div>
	</article>
			<!-- End profile widget -->
			<!-- modal -->
	<div class="profil-modal">
		<div class="profil-modal-content" style="padding: 0px;">
			<h4 style="padding-bottom: 10px;">프로필 사진 수정</h4>
				<div>
					<input type="file" name="uploadFile">
				</div>
				<button id="uploadBtn">업로드</button>
				<button id="send">완료</button>
		</div>	
	</div>
</div>
<!-- include jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" intergrity="sha256-FgqCb/KJQILNfOu91ta32o/NMZxItwRo8qtmkMRdAu8="
		crossorigin="anonymous"></script>
<!--  jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.2/jquery.modal.min.js" 
integrity="sha512-ztxZscxb55lKL+xmWGZEbBHekIzy+1qYKHGZTWZYH1GUwxy0hiA18lW6ORIMj4DHRgvmP/qGcvqwEyFFV7OYVQ==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	// 모달 함수
	$(function(){
		
		$(".profil-image").click(function(){
			$(".profil-modal").fadeIn();
		});
		
		$("#send").click(function(){
			$(".profil-modal").fadeOut();
		});
		
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
		$("#uploadBtn").on("click", function(e){
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(inputFile);
			console.log(files);
			
			// 업로드전 파일 체크 함수 실행
			for(var i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
					formData.append("uploadFile", files[i]);
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
					console.log(result);
					
					showUploadedFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
				}
			}); // $.ajax
		});
	});

	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			
			if(!obj.image){
				str += "<li><img class='profil-image' src='${pageContext.request.contextPath}/resources/images/test profil.jpg alt='프로필'></li>"+obj.fileName+"</li>";
			}else{
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.fileName);
				
				str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
			}
		});
		uploadResult.append(str);
	}
</script>



<%@include file="../include/footer.jsp"%>