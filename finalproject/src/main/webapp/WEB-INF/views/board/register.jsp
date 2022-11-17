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
		<form action="regiform" id="regiform" method="post">
			<div>
				<div class="row">
					<div class="col-12">
						<input type="hidden" name="topic" value="${topic }">
						<input type="hidden" name="name" value="name">
						<input type="checkbox" name="secret" value="1" style="width: 15px; height: 15px"> 비밀글
						<textarea name="content" id="content" placeholder="" rows="6"></textarea>
					</div>
					<div class="col-12">
						<!-- <input type="submit" value="저장" /> -->
						<button type="button" onclick=register()>저장</button>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
	function register(){
		if ($("#content").val() == ""){
			alert("내용을 입력해 주세요.");
		} else{
			$('#regiform').submit();
		}
	}
	
	$(document).ready(
			function(){
				var msg= '${msg}';
				if (msg!=''){
					alert(msg);
				}
			}		
		);
</script>
<%@include file="../include/footer.jsp"%>