<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>
<%String secret = (String)session.getAttribute("secret"); %>
<div id="main">
	<!-- Contact -->
	<article id="contact" class="panel">
		<header>
			<h2 style="font-size: 50px">"${vo.topic }"에 대한 ${vo.name}의 생각</h2>
		</header>
		<form action="delete" method="post" id="delete">
			<div>
				<div class="row">
					<div class="col-12">
						<input type="hidden" name="topic" value="${vo.topic }">
						<input type="hidden" name="name" value="${vo.name }">
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
						<textarea name="content" style="font-size: 25px" placeholder="${vo.content }" rows="6" readonly="readonly"></textarea>
					</div>
					<div class="col-12">
						<button type="button" style = "font-size: 20px; height: 50px; width: 130px; line-height: 25px" onclick="location.href='list?topic=${vo.topic}'">목록으로</button>
						<br>
						<button type="button" class="LikeBtn" id="LikeBtn"
							style="color: black; background-color: white">
						♡</button><br>
						<button type="button" class="liketotal" id="liketotal" name="liketotal"
							style="color: black; background-color: white"></button><br>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>

<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">

var likeval = ${like};

let bno = ${vo.bno};
let name = '${user_name}';

if(likeval > 0){
	console.log(likeval + "좋아요 누름");
	$('.LikeBtn').html("♥");
	$('.LikeBtn').click(function() {
		if (name==''){
			alert("로그인해주세요!");
			window.location.replace("/member/loginPage");
		}
		$.ajax({
			type :'post',
			url : '/board/likedown',
			contentType: 'application/json',
			data : JSON.stringify(
					{
						"bno" : bno,
						"name" : name
					}		
				),
			success : function(data) {
				alert('취소 성공');
				window.location.replace("/board/listcontent?bno="+bno);
				//$('.LikeBtn').html("♡");
				//$(".liketotal").text(total-1);
				//likeval = 0;
			}
		})// 아작스 끝
	})

}else{
	console.log(likeval + "좋아요 안누름")
	console.log(bno);
	$('.LikeBtn').click(function() {
		if (name==''){
			alert("로그인해주세요!");
			window.location.replace("/member/loginPage");
		}
		$.ajax({
			type :'post',
			url : '/board/likeup',
			contentType: 'application/json',
			data : JSON.stringify(
					{
						"bno" : bno,
						"name" : name
					}		
				),
			success : function(data) {
				alert('좋아요 성공');
				window.location.replace("/board/listcontent?bno="+bno);
				//$('.LikeBtn').html("♥");
				//$(".liketotal").text(total+1);
				//likeval = 1;
			}
		})// 아작스 끝
	})
}

	$(document).ready(function () {
		var bno = ${vo.bno};
		var checkbno = {"bno":bno};
	    $.ajax ({
	    	method:"get",
	        url : "http://localhost:8080/board/checklike",
	        data : checkbno, //서버에 전송할 데이터 json형식 {key:value}
			datatype : "text", //서버에서 요청후 리턴해 주는 타입
			contentType : "application/json;charset=utf-8",
			error : function(request, error){
				alert(error + "\n" + request.status)
			},
			success : function(total2){
				//ajax통신에 성공했을 때에 호출될 자바스크립트 함수, 결과 여부가
				//result매개변수로 전달됨.
				console.log(total2);
				
				$(".liketotal").text(total2);
				}
	        })
		});
var total = $(".liketotal").text();
</script>
<%@include file="../include/footer.jsp"%>