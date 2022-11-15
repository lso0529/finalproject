<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>"${topic }" 에 대해 글쓰기</h2>
		</header>
		<form action="regiform">
			<!-- 안됨 -->
			<div>
				<div class="row">
					<div class="col-12">
						<input type="hidden" name="topic" value="${topic }">
						<input type="hidden" name="name" value="name">
						<input type="checkbox" name="secret" value="1" style="width: 15px; height: 15px"> 비밀글
						<textarea name="content" placeholder="내용을 입력하세요." rows="6"></textarea>
					</div>
					<div class="col-12">
						<!-- <input type="submit" value="저장" /> -->
						<button type="submit">저장</button>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>
<%@include file="../include/footer.jsp"%>