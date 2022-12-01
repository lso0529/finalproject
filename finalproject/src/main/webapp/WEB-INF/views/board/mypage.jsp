<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.profile-header {
	transform: translateY(5rem);
}

</style>

<div id="main" style="width: 100%; margin: auto;">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2 style="font-size: 50px">${sessionScope.user_name }님이 쓴 글</h2>
		</header>
		<div>
			<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 pt-0 pb-4 bg-dark">
					<div class="media align-items-end profile-header">
						<div class="profile mr-3"></div>
						<div class="media-body mb-5 text-white">
							<div class="small mb-4" style="font-size: 25px">
								<i style="font-size: 25px" class="fa fa-map-marker mr-2"></i>
								${sessionScope.mycount } 편<br>

								<ul>

								</ul>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="py-4 px-4">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<p style="font-size: 25px">글을 선택하면 상세보기 페이지로 넘어갑니다</p>
					</div>
					<br>
					<div class="row" align="center"
						style="width: 100%; margin: 0">
						<c:forEach var="mylist" items="${sessionScope.mylist }">
							<div class="col-lg-6 mb-2 pr-lg-1"
								style="background-color: #E4E4E4; width: 80%; height: 400px; margin: auto; margin-bottom: 10px; line-height: 400px; padding: 0;"
								align="center">
								<button
									style="background-color: #E4E4E4; color: black; font-size: 25px; display: block; height: 20%; line-height: 20%">
									글감: ${mylist.topic }</button>
								<button
									style="background-color: #E4E4E4; color: black; font-size: 25px"
									onclick="location.href='${pageContext.request.contextPath}/board/content?bno=${mylist.bno}'">${mylist.content }</button>

							</div>
							<div align="center"
								style="padding: 0; line-height: 400px;">
								<button type="button"
									style="color: black; background-color: white;">
									♡<br>${mylist.likes }</button>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
</div>
</article>
</div>

<script>
//업로드된 파일 섬네일로 출력
var uploadResult = $(".uploadResult");

function showUploadedFile(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length == 0){}
	
	var uploadResult = $(".uploadResult");
	
	var str = "";
	
	$(uploadResultArr).each(function(i, obj){
		
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "-" + obj.fileName);
			console.log(fileCallPath);
			
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
	var email = "${sessionScope.user_name }";
	
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