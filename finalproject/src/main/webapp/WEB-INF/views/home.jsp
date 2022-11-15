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
			<h1>(홈페이지 이름)</h1>
			<!-- 제목 후보: 1일1글, 올림, 울림, ... -->
			<p>하루에 한 줄, 글쓰기</p>
		</header>
		<div style="width: 500.328px; height: 373.328px; background-color: #E4E4E4; line-height: 373.328px;" align="center">
			<!-- <a href="board/register?topic=${topic }">${topic }</a> -->
			<button	style="background-color: #E4E4E4; color: black; font-size: 20px; line-height: 373.328px; padding: 0" onclick="location.href='board/register?topic=${topic }'">${topic }</button>
			<!-- <img src="${pageContext.request.contextPath}/resources/images/pic04.jpg" alt="" style="width: 100%; height: 100%"/> -->
		</div>
		<!-- <a href="#work" class="jumplink pic">
									<span class="arrow icon solid fa-chevron-right"><span>See my work</span></span>
									<img src="${pageContext.request.contextPath}/resources/images/me.jpg" alt="" />
								</a> -->
	</article>

</div>

<%@include file="include/footer.jsp"%>