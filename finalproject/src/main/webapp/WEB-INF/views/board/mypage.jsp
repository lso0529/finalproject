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
							<!-- <h4 class="mt-0 mb-0">${sessionScope.user_name }</h4> -->
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
						<!--<h5 class="mb-0">내가 쓴 글</h5>-->
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
					
					<!--<div class="col-lg-6 mb-2 pr-lg-1" style="background-color: #E4E4E4; width: 70%; height: 400px; margin: auto; line-height:400px; padding: 0;" align="center">
								<button
								style="background-color: #E4E4E4; color: black; font-size: 20px; line-height:50px; padding: 0"
								onclick="location.href='content?'">(주제)</button><br>
								<button
								style="background-color: #E4E4E4; color: black; font-size: 20px; line-height:350px; padding: 0"
								onclick="location.href='content?'">(쓴 글)</button>-->
				</div>
			</div>

		</div>
</div>
</article>
</div>


<%@include file="../include/footer.jsp"%>