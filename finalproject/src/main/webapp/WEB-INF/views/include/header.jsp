<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%//String name= (String)session.getAttribute("user_name"); 
<<<<<<< HEAD
 // System.out.println(name);%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
=======
//System.out.println(name);%>
<!DOCTYPE html>
>>>>>>> refs/remotes/origin/board
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
						<a href="${pageContext.request.contextPath}/" class="icon solid fa-home"><span>Home</span></a>
						<a href="${pageContext.request.contextPath}/board/topics" class="icon solid fa-folder"><span>topics</span></a>
<<<<<<< HEAD
						<a href="${pageContext.request.contextPath}/member/mypage" class="icon solid fa-envelope"><span>mypage</span></a>
					<c:choose>
					  <c:when test="${sessionScope.user_email != null}">
						<a href="${pageContext.request.contextPath}/member/userEditPage" class="icon solid fa-user-edit"><span>user_edit</span></a>
						<a href="${pageContext.request.contextPath}/member/logout" class="icon solid fa-sign-out-alt"><span>logout</span><a>
					  </c:when>
					   <c:otherwise>
					    <a href="${pageContext.request.contextPath}/member/loginPage" class="icon solid fa-user"><span>login</span></a>
					   </c:otherwise>
				    </c:choose>
					</nav>
					
					
=======
						<a href="${pageContext.request.contextPath}/board/mypage" class="icon solid fa-envelope"><span>mypage</span></a>
						<a href="${pageContext.request.contextPath}/member/loginPage" class="icon brands fa-twitter"><span>login</span></a>
					</nav>
>>>>>>> refs/remotes/origin/board
