<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>

<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>마이페이지</h2>
		</header>
		<form action="#" method="post">
			<div>
				<div class="row">
					<div class="col-6 col-12-medium">
						<input type="text" name="name" placeholder="Name" />
					</div>
					<div class="col-6 col-12-medium">
						<input type="text" name="email" placeholder="Email" />
					</div>
					<div class="col-12">
						<input type="text" name="subject" placeholder="Subject" />
					</div>
					<div class="col-12">
						<textarea name="message" placeholder="Message" rows="6"></textarea>
					</div>
					<div class="col-12">
						<input type="submit" value="Send Message" />
					</div>
				</div>
			</div>
		</form>
	</article>

</div>
<%@include file="../include/footer.jsp"%>