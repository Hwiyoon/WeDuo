<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
<script src="${cp}/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="${cp}/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${cp}/resources/table/assets/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${cp}/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="${cp}/resources/table/assets/css/main.css">
<link rel="stylesheet" media="screen"
	href="${cp}/resources/table/assets/fonts/font-awesome/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${cp}/resources/css/user/shop/default.css">

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

		<section id="container"> <%-- <aside id="aside">
				<div id="aside_box">
					<%@ include file="include/aside.jsp" %>
				</div>
			</aside> --%>

		<div id="container_box">
			<h1>리 뷰 </h1><br /><br />
			<br />
			<table border="1">
				<thead>
					<tr>
						<th>리뷰번호</th>
						<th>리뷰제목</th>
						<th>작성자</th>
						<th>원두종류</th>
						<th>신맛</th>
						<th>단맛</th>
						<th>쓴맛</th>
						<th>바디감</th>
						<th>아로마</th>
						<th>플레이버</th>
						<th>리뷰내용</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>${selectedReview.RNO}</td>
						<td>${selectedReview.TITLE}</td>
						<td>${selectedReview.MID}</td>
						<td>${sbean.BNAME}</td>
						<td>${selectedReview.SOUR}</td>
						<td>${selectedReview.SWEET}</td>
						<td>${selectedReview.BITTER}</td>
						<td>${selectedReview.BODY}</td>
						<td>${selectedReview.AROMA}</td>
						<td>${selectedReview.FLAVOR}</td>
						<td>${selectedReview.CONTENT}</td>
					</tr>
				</tbody>

			</table>
			
	<a href="${cp}/">메인 / </a>
	<a href="${cp}/board/bean/beanList">원두리스트 / </a>
	<a href="${cp}/board/bean/reviewList?bno=${sbean.BNO}">해당원두리뷰목록 / </a>
	<a href="${cp}/board/bean/reviewWriteForm">해당원두리뷰작성</a>
	
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