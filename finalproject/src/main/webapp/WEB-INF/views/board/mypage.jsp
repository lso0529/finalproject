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

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>내가 쓴 글</h2>
		</header>
		<form action="#" method="post">
			<div>
				<div class="bg-white shadow rounded overflow-hidden">
					<div class="px-4 pt-0 pb-4 bg-dark">
						<div class="media align-items-end profile-header">
							<div class="profile mr-3"></div>
							<div class="media-body mb-5 text-white">
								<h4 class="mt-0 mb-0">${sessionScope.user_name }</h4>
								<div class="small mb-4">
									<i class="fa fa-map-marker mr-2"></i> ${sessionScope.mycount } 편 씀
									<ul>
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="py-4 px-4">
						<div
							class="d-flex align-items-center justify-content-between mb-3">
							<!--<h5 class="mb-0">내가 쓴 글</h5>-->
							<p>글을 선택하면 상세보기 페이지로 넘어갑니다</p>
						</div>
						<br>
						<div class="row" align="center">
							<c:forEach var="mylist" items="${sessionScope.mylist }">
								<div class="col-lg-6 mb-2 pr-lg-1"
									style="background-color: #E4E4E4; width: 70%; height: 400px; margin: auto; margin-bottom: 10px; line-height: 400px; padding: 0;"
									align="center">
									<button
										style="background-color: #E4E4E4; color: black; font-size: 20px; display: block">
										글감: ${mylist.topic }</button>
									<button type="button"
										style="background-color: #E4E4E4; color: black; font-size: 20px;"
										onclick="location.href='${pageContext.request.contextPath}/board/content?bno=${mylist.bno}'">${mylist.content }</button>
								</div>
								<div></div>
							</c:forEach>
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
</div>

<!-- End profile widget -->
</div>
</div>
</form>
</article>

</div>
</div>

<%@include file="../include/footer.jsp"%>