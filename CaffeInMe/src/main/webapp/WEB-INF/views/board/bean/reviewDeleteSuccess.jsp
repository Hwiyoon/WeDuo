<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
				<%@ include file="../../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<%-- <aside id="aside">
				<div id="aside_box">
					<%@ include file="include/aside.jsp" %>
				</div>
			</aside> --%>
		
			<div id="container_box">
				리뷰삭제성공페이지입니당.&nbsp;

			<a href="${cp}/index">MAIN</a>&nbsp;&nbsp;
			<a href="${cp}/board/bean/reviewList?bno=${sbean.BNO}">원두 리뷰 리스트로 이동</a>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</footer>
	</div>

	


</body>
</html>