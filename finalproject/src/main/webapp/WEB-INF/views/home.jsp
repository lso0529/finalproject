<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="include/header.jsp"%>

</html>
<!-- Main -->
<div id="main">

	<!-- Me -->
	<article id="home" class="panel intro">
		<header>
			<h1 style="font-size: 60px">울림</h1>
			<!-- 제목 후보: 1일1글, 올림, 울림, ... -->
			<p style="font-size: 30px">하루에 한 줄, 글쓰기</p>
		</header>
		<div
			style="width: 500.328px; height: 100%; background-color: #E4E4E4; line-height: 100%;"
			align="center">
			<!-- <a href="board/register?topic=${topic }">${topic }</a> -->
			<button
				style="background-color: #E4E4E4; color: black; font-size: 20px; display: block; height:20%; line-height: 20%">
				추천 글감</button>
			<button
				style="background-color: #E4E4E4; color: black; font-size: 20px;padding: 0; font-size: 30px; height:80%; line-height: 80%"
				onclick="location.href='board/register?topic=${topic }'">${topic }</button>
			<!-- <img src="${pageContext.request.contextPath}/resources/images/pic04.jpg" alt="" style="width: 100%; height: 100%"/> -->
		</div>
		<!-- <a href="#work" class="jumplink pic">
									<span class="arrow icon solid fa-chevron-right"><span>See my work</span></span>
									<img src="${pageContext.request.contextPath}/resources/images/me.jpg" alt="" />
								</a> -->
	</article>

</div>

<%@include file="include/footer.jsp"%>