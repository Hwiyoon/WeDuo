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
	<table>
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>리뷰제목</th>
				<th>작성자</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${beanReviews}" var="review">
				<tr>
					<td>${review.RNO}</td>
					<td><a href="${cp}/board/bean/reviewRead?RNO=${review.RNO}">${review.TITLE}</a></td>
					<td>${review.MID}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="${cp}/">메인으로이동</a>
	<a href="${cp}/board/bean/reviewWriteForm">원두 리뷰 작성하러가기</a>
</body>
</html>