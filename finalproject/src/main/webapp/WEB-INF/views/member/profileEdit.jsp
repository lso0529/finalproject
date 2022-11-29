<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.profile-header {
	transform: translateY(5rem);
}

/*
	*
	* ==========================================
	* FOR DEMO PURPOSE
	* ==========================================
	*
	*/
</style>

<div id="main" style="width:100%; margin:auto;">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2 style="font-size: 50px">프로필 사진 수정</h2>
		</header>
		<div>
			<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 pt-0 pb-4 bg-dark">
					<div class="media align-items-end profile-header">
						<div class="profile mr-3"></div>
						<div class="media-body mb-5 text-white">
							<div class="small mb-4" style="font-size: 25px">
								<i style="font-size: 25px" class="fa fa-map-marker mr-2"></i> ${sessionScope.mycount } 편<br>
								<i style="font-size: 25px" class="fa fa-map-marker mr-2"></i> 좋아요 ${sessionScope.mylike } 개

								<ul>

								</ul>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="py-4 px-4">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<!--<h5 class="mb-0">내가 쓴 글</h5>-->
						<p style="font-size: 25px">글을 선택하면 상세보기 페이지로 넘어갑니다</p>
					</div>
					<br>
					<div class="row" align="center"
						style="width: 100%; height: 100%; margin: 0">
						

					
					</div>
				</div>

			</div>
		</div>
	</article>
</div>
<script>
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