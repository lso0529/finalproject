<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>${topic }에 대해 글쓰기</h2>
		</header>
		<form action="regiform" method="post">
			<!-- 안됨 -->
			<input type="checkbox" name="secret"> 비밀글
			<div>
				<div class="row">
					<div class="col-12">
						<textarea name="content" placeholder="내용을 입력하세요." rows="6"></textarea>
					</div>
					<div class="col-12">
						<input type="submit" value="저장" />
					</div>
				</div>
			</div>
		</form>
	</article>
</div>
<%@include file="../include/footer.jsp"%>