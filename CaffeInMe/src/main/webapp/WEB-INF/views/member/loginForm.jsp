<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="${cp}/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${cp}/resources/css/user/shop/default.css">

<style>
 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 header#header { font-size:30px; padding:20px 0; }
 header#header h1 a { color:#000; font-weight:bold; }
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 
 footer#footer { background:#f9f9f9; padding:20px; margin-top: 50px;}
 footer#footer ul li { display:inline-block; margin-right:10px; }
</style>

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
				<h2>MEMBER LOGIN</h2>
	
				<form:form action="${cp}/member/login" method="post" commandName="member">
					<table>
						<tr>
							<td>ID</td>
							<td><form:input path="MID" /></td>
							<td rowspan="2"><input type="submit" value="Login" ></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><form:password path="MPW" /></td>
						</tr>
						<!-- <tr>
							<td colspan="2"><input type="submit" value="Login" ></td>
						</tr> -->
					</table>
				</form:form>
			</div>
			
			<div id="container_box">
				<a href="${cp}/index">MAIN</a>&nbsp;&nbsp; 
				<a href="${cp}/member/joinForm">JOIN</a>&nbsp;&nbsp; 
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>	
	
</body>
</html>