<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>${topic }에 쓴 글 수정</h2>
		</header>
		<form action="regiform" method="post">
			<div>
				<div class="row">
					<div class="col-12">
						<textarea name="message" placeholder="내용을 입력하세요." rows="6"></textarea>
					</div>
					<div class="col-12">
						<input type="submit" value="수정" />
						<button>삭제</button>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>
<%@include file="../include/footer.jsp"%>