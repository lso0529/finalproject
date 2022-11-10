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
			<h2>글감</h2>
		</header>
		<p>글감을 클릭하고 (아무튼 그런 얘기)</p>
		<section>
			<div class="row">
				<c:forEach var="list" items="${boardlist }">
					<div class="col-4 col-6-medium col-12-small">
						<div style="width: 233.328px; height: 174.984; background-color: #E4E4E4; line-height: 174.984px" align="center">
							<button	style="background-color: #E4E4E4; color: black; font-size: 20px" onclick="location.href='list?topic=${boardlist.name }'">${boardlist.content }</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</article>
</div>
<%@include file="../include/footer.jsp"%>