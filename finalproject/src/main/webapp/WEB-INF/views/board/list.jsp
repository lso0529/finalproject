<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<%@include file="../include/header.jsp"%>
<div id="main">
	<!-- Work -->
	<article id="work" class="panel">
		<header>
			<h2 style="font-size: 50px">${topic }</h2>
		</header>
		<p style="font-size: 25px">
			"${topic }"에 대한 다른 사람들의 이야기를 들어보세요.<br> 글을 누르면 상세 페이지로 이동합니다.<br>
			<br>
			<button
				style="font-size: 20px; height: 50px; width: 130px; line-height: 25px"
				onclick="location.href='register?topic=${topic}'">글쓰기</button>
		</p>

		<section>
			<div class="row" align="center">
				<c:forEach var="boardlist" items="${boardlist }">
					<div class="col-lg-6 mb-2 pr-lg-1"
						style="background-color: #E4E4E4; width: 70%; height: 400px; margin: auto; margin-bottom: 10px; line-height: 400px; padding: 0;"
						align="center">
						<button
							style="background-color: #E4E4E4; color: black; font-size: 25px"
							onclick="location.href='listcontent?bno=${boardlist.bno}'">${boardlist.content }</button>

					</div>
					<div align="center" style="padding: 0; line-height: 400px">
						<button type="button"
							style="color: black; background-color: white">
							♡<br>${boardlist.likes }</button>
					</div>
				</c:forEach>
			</div>
		</section>
	</article>
</div>
<%@include file="../include/footer.jsp"%>