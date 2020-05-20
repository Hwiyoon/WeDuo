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
			<h1>�� �� </h1><br /><br />
			<br />
			<table border="1">
				<thead>
					<tr>
						<th>�����ȣ</th>
						<th>��������</th>
						<th>�ۼ���</th>
						<th>��������</th>
						<th>�Ÿ�</th>
						<th>�ܸ�</th>
						<th>����</th>
						<th>�ٵ�</th>
						<th>�Ʒθ�</th>
						<th>�÷��̹�</th>
						<th>���䳻��</th>
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
			
	<a href="${cp}/">���� / </a>
	<a href="${cp}/board/bean/beanList">���θ���Ʈ / </a>
	<a href="${cp}/board/bean/reviewList?bno=${sbean.BNO}">�ش���θ����� / </a>
	<a href="${cp}/board/bean/reviewWriteForm">�ش���θ����ۼ�</a>
	
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