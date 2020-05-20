<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>
<html>
<head>
	<title>Join Success</title>
	
<script src="${cp}/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${cp}/resources/table/assets/css/bootstrap.min.css">

<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${cp}/resources/table/assets/css/main.css">
<link rel="stylesheet" media="screen" href="${cp}/resources/table/assets/fonts/font-awesome/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${cp}/resources/css/user/shop/default.css">


</head>
<body>
<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<%-- <aside id="aside">
				<div id="aside_box">
					<%@ include file="include/aside.jsp" %>
				</div>
			</aside> --%>
		
			<div id="container_box">
				<h1> MEMBER JOIN OK </h1>
					NAME : ${member.MNAME} <br />
					ID : ${member.MID} <br />
					PW : ${member.MPW} <br />
					BIRTH : ${member.MBIRTH} <br />
	
				<P> The time on the server is ${serverTime}. </P>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

	<a href="${cp}/member/loginForm"> Login </a>
</body>
</html>
