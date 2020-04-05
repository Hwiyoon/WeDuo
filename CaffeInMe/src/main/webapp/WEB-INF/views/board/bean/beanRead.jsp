<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>원두이름</th>
				<th>원두설명</th>
			</tr>
		</thead>

		<tbody>
				<tr>
					<td>${sbean.BNAME}</td>
					<td>${sbean.CONTENT}</td>
				</tr>
		</tbody>

	</table>
	
	<a href="${cp}/">메인으로 이동</a>
	<a href="${cp}/board/bean/beanList">원두 리스트로 이동</a>
	<a href="${cp}/board/bean/reviewList?bno=${sbean.BNO}">원두 리뷰 리스트로 이동</a>
	<a href="${cp}/board/bean/reviewWriteForm">원두 리뷰 작성하러가기</a>
	
</body>
</html>