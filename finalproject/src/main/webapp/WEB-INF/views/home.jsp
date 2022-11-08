<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@include file="include/header.jsp"%>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="home" class="panel intro">
								<header>
									<h1>(홈페이지 이름)</h1>
									<p>하루에 한 줄, 글쓰기</p>
								</header>
								<div style="width: 500.328px; height: 373.328px; background-color: #E4E4E4; line-height : 373.328px;" align="center" >
									<a>글감1</a>
									<!-- <img src="${pageContext.request.contextPath}/resources/images/pic04.jpg" alt="" style="width: 100%; height: 100%"/> -->
								</div>
								<!-- <a href="#work" class="jumplink pic">
									<span class="arrow icon solid fa-chevron-right"><span>See my work</span></span>
									<img src="${pageContext.request.contextPath}/resources/images/me.jpg" alt="" />
								</a> -->
							</article>

						<!-- Contact -->
							<article id="contact" class="panel">
								<header>
									<h2>Contact Me</h2>
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

<%@include file="include/footer.jsp"%>