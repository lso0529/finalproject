<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%
// 추가된 부분= session값을 다시 넣어서 밑에 스크립트 태그로 값을 넣어서 controller로 보냈습니다.
String user_email = (String)session.getAttribute("user_email"); 

session.setAttribute("user_email", user_email);
 %>


	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css">
	<script 
  			src="http://code.jquery.com/jquery-3.5.1.js"
  			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  			crossorigin="anonymous"></script>
  
</head>
<body>

	<div class="wrapper">
    <div class="container">
       
      <form class="pwUpdate-form" action="pwUpdate" method="post" id="pwUpdate-form">
          <input type="hidden" class="input" name="email" id="email" value="<%=user_email%>">
          <input type="password" placeholder="새비밀번호" class="input" name="pw" id="pw">
          <input type="password" placeholder="새비밀번호 확인" class="input" name="pw2" id="pw2">
          <input type="button" class="btn large loginBtn" value="변경" onclick="pwUpdate()">
          <input type="button" class="btn large loginBtn" value="취소" onclick="location.href='loginPage'">
       </form>
       
    </div>
  </div>

<script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
<script type="text/javascript">
	

   function pwUpdate() {
   	
           if($("#pw").val()==""){
               alert("새 비밀번호를 입력하세요");
               return;
           }else if($("#pw2").val()==""){
               alert("새 비밀번호 확인을 입력하세요");
               return;
           }else if($("#pw").val() != $("#pw2").val()){
               alert("변경할 비밀번호가 일치하지 않습니다.");
               return;
           }else {
               $("#pwUpdate-form").submit();
           }
       }
   
</script>
<%@include file="../include/footer.jsp"%>
