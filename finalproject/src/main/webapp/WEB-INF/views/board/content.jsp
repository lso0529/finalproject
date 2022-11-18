<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>
<%String secret = (String)session.getAttribute("secret"); %>
<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2>"${vo.topic }"에 대한 ${vo.name}의 생각</h2>
		</header>
		<form action="delete" method="post" id="delete">
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
							<input type="checkbox" name="secret" value="1" style="width: 15px; height: 15px" onClick="return false;">비밀글
							<!-- <input type="checkbox" name="secret" value="1" style="width: 15px; height: 15px" readonly="readonly"> 비밀글 -->
						<% } else{%>
							<!-- 비밀글 -->
							<input type="checkbox" checked onClick="return false;">비밀글
							<!--  <input type="checkbox" name="secret" value="1" style="width: 15px; height: 15px" readonly="readonly"> 비밀글-->
						<% }%>
						<textarea name="content" placeholder="${vo.content }" rows="6" readonly="readonly"></textarea>
					</div>
					<div class="col-12">
						<button type="button" onclick="location.href='update?bno=${vo.bno}'">수정</button>
						<button type="button" onclick=buttonCheck()>삭제</button>
						<button type="button" onclick="location.href='mypage?name=${vo.name}'">취소</button>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>


<script type="text/javascript">
	function buttonCheck(){
		if (confirm("게시글을 삭제하시겠습니까?")){
			$("#delete").submit();
			return;
		} else {
			return;
		}
	}
	
	$(document).ready(function(){
			var msg= '${msg}';
			if (msg!=''){
				alert(msg);
			}
		});
</script>
<%@include file="../include/footer.jsp"%>