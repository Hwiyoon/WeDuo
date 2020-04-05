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
	
	<a href="${cp}/">메인으로 이동</a>
	<a href="${cp}/board/bean/beanList">원두 리스트로 이동</a>
	<a href="${cp}/board/bean/reviewList?bno=${sbean.BNO}">원두 리뷰 리스트로 이동</a>
	<a href="${cp}/board/bean/reviewWriteForm">원두 리뷰 작성하러가기</a>
	
</body>
</html>