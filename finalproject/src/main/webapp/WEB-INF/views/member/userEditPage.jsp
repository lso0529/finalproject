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
			<h2>회원정보</h2>
		</header>
		<form action="#" method="post">
			<div>
				<div class="bg-white shadow rounded overflow-hidden">
					<div class="px-4 pt-0 pb-4 bg-dark">
						<div class="media align-items-end profile-header">
							<div class="profile mr-3"></div>
							<div class="media-body mb-5 text-white">
								<h4 class="mt-0 mb-0">(닉네임)</h4>
								<div class="small mb-4">
									<i class="fa fa-map-marker mr-2"></i>(이메일)
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="py-4 px-4">
						<div
							class="d-flex align-items-center justify-content-between mb-3">

							<a>회원탈퇴</a>
							<a>비밀번호 변경 </a>
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