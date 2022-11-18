<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<% 
String user_email = (String)session.getAttribute("user_email");
String user_name =  (String)session.getAttribute("user_name");

session.setAttribute("user_email", user_email);

%>

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

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>회원정보</h2>
		</header>
		<form action="#" method="post">
			<div>
				<div class="bg-white shadow rounded overflow-hidden">
					<div class="px-4 pt-0 pb-4 bg-dark">
						<div class="media align-items-end profile-header">
							<div class="profile mr-3"></div>
							<div class="media-body mb-5 text-white">
								<h4 class="mt-0 mb-0"><%=user_name%></h4>
								<div class="small mb-4">
									<i class="fa fa-map-marker mr-2"></i><%=user_email%>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="py-4 px-4">
						<div
							class="d-flex align-items-center justify-content-between mb-3">

							<a href="deleteCheck" >회원탈퇴</a>
							<a>비밀번호 변경 </a>
						</div>
					</div>
				</div>
			</div>
			<!-- End profile widget -->
</div>
<!-- include jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!--  jQuery Model -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-model/0.9.1/jquery.model.min.js"></script>



<%@include file="../include/footer.jsp"%>