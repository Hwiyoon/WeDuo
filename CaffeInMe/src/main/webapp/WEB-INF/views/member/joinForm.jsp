<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
					<%@ include file="../include/aside.jsp" %>
				</div>
			</aside> --%>
		
			<div id="container_box">
				<h1>MEMBER JOIN</h1>

	<form:form action="${cp}/member/join" method="post"
		commandName="member">
		<table>
			<tr>
				<td>NAME : </td>
				<td><form:input path="MNAME" /></td>
			</tr>
			<tr>
				<td>ID : </td>
				<td><form:input path="MID" id="MID" /></td>
				<td><button type="button" class="idCheck">중복확인</button></td>
				<td><p class="result">
						<span class="msg">아이디를 확인하세요</span>
					</p></td>
			</tr>
			<tr>
				<td>PW : </td>
				<td><form:password path="MPW" /></td>
			</tr>
			<tr>
				<td>BIRTH : </td>
				<td><form:input path="MBIRTH" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Join" disabled="disabled" id="submit"> <input
					type="reset" value="Cancel"></td>
			</tr>
		</table>
	</form:form>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

	<script>
	
		/* function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		}; */
		
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		
		$(".idCheck").click(function() {

			//var data = encodeURIComponent($("#MID").val());
			var data = {'MID' : $("#MID").val()};
			console.log(data)

			$.ajax({
				url : ctx+"/member/idCheck" ,
				type : "post",
				data : data ,
				success : function(result) {
					console.log("joinForm으로 리턴")
					if (result == 1) {	//가입불가
						$(".result .msg").text("사용 불가");
						$(".result .msg").attr("style", "color:#f00");
						$("#submit").attr("disabled", "disabled");
					} else {			//가입가능
						$(".result .msg").text("사용 가능");
						$(".result .msg").attr("style", "color:#00f");
						$("#submit").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
	</script>
</body>
</html>