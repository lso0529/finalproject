<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%
String name= (String)session.getAttribute("user_name"); 

System.out.println(name);%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		
		
		<title>울림 | 일상적 글쓰기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
					<nav id="nav">
						<a href="${pageContext.request.contextPath}/" class="icon solid fa-home"><span style="font-size: 20px">Home</span></a>
						<a href="${pageContext.request.contextPath}/board/topics" class="icon solid fa-folder"><span style="font-size: 20px">topics</span></a>

						<a href="${pageContext.request.contextPath}/board/mypage" class="icon solid fa-envelope"><span style="font-size: 20px">mypage</span></a>
					<c:choose>
					  <c:when test="${sessionScope.name != null}">
						<a href="${pageContext.request.contextPath}/member/userEditPage" class="icon solid fa-user-edit"><span style="font-size: 20px">user_edit</span></a>
						<a href="${pageContext.request.contextPath}/member/logout" class="icon solid fa-sign-out-alt"><span style="font-size: 20px">logout</span></a>
					  </c:when>
					   <c:otherwise>
					    <a href="${pageContext.request.contextPath}/member/loginPage" class="icon solid fa-user"><span style="font-size: 20px">login</span></a>
					   </c:otherwise>
				    </c:choose>
					</nav>
