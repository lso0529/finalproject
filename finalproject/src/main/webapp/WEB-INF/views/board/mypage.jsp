<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

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
			<h2>마이페이지</h2>
		</header>
		<form action="#" method="post">
			<div>
				<div class="bg-white shadow rounded overflow-hidden">
					<div class="px-4 pt-0 pb-4 bg-dark">
						<div class="media align-items-end profile-header">
							<div class="profile mr-3"></div>
							<div class="media-body mb-5 text-white">
								<h4 class="mt-0 mb-0">(NAME)</h4>
								<div class="small mb-4">
									<i class="fa fa-map-marker mr-2"></i>(총 게시물 수)
									<ul>
										<li class="list-inline-item"><i class="fa fa-heart-o mr-2"></i>200
										Likes</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="py-4 px-4">
						<div
							class="d-flex align-items-center justify-content-between mb-3">
							<h5 class="mb-0">내가 쓴 글</h5>
							<p>글을 선택하면 수정/삭제 페이지로 넘어갑니다</p>
						</div>
						<br>
						<div class="row" align="center">
							<div class="col-lg-6 mb-2 pr-lg-1" style="background-color: #E4E4E4; width: 70%; height: 400px; margin: auto; line-height:400px; padding: 0;" align="center">
								<button
								style="background-color: #E4E4E4; color: black; font-size: 20px; line-height:400px; padding: 0"
								onclick="location.href='#'">(쓴 글)</button>
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