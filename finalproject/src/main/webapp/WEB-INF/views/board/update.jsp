<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>
<%String secret = (String)session.getAttribute("secret"); %>
<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2 style="font-size: 50px">"${vo.topic }"에 쓴 글 수정</h2>
		</header>
		<form action="updateform" id="updateform" method="post">
			<div>
				<div class="row">
					<div class="col-12">
						<input type="hidden" name="topic" value="${vo.topic }">
						<input type="hidden" name="name" value="name">
						<input type="hidden" name="bno" value="${vo.bno }">
						<%
						// secret이 0이면 공개글, 1이면 비밀글
						if (secret.equals("0")){ %>
							<!-- 공개글 -->
							<input type="checkbox" name="secret" value="1" style="width: 15px; height: 15px">비밀글
						<% } else{%>
							<!-- 비밀글 -->
							<input type="checkbox" checked>비밀글
						<% }%>
						<textarea name="content" style="font-size: 25px" id="content" rows="6">${vo.content }</textarea>
					</div>
					<div class="col-12">
						<button type="button" style = "font-size: 20px; height: 50px; width: 130px; line-height: 25px" onclick=update()>저장</button>
						<button type="button" style = "font-size: 20px; height: 50px; width: 130px; line-height: 25px" onclick="location.href='content?bno=${vo.bno}'">취소</button>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">

	var msg= '${msg}';
	if (msg!=''){
		alert(msg);
	}
	
	function update(){
		if ($("#content").val() == ""){
			alert("수정할 내용을 입력해 주세요.");
		} else{
			$('#updateform').submit();
		}
	}
</script>
<%@include file="../include/footer.jsp"%>