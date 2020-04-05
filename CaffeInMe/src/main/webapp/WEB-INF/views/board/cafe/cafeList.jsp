<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>검색된 카페들</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>카페번호</th>
				<th>카페이름</th>
				<th>카페주소</th>
				<th>영업시간</th>
				<th>홈페이지</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${cafeListByKeyword}" var="list">
				<tr>
					<td>${list.CNO}</td>
					<td>${list.CNAME}</td>
					<td>${list.CADDR}</td>
					<td>${list.CTIME}</td>
					<td>${list.CPAGE}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="${cp}/">메인으로이동</a>
</body>
</html>