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
				<th>�����ȣ</th>
				<th>��������</th>
				<th>�ۼ���</th>
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
	
	<a href="${cp}/">���������̵�</a>
	<a href="${cp}/board/bean/reviewWriteForm">���� ���� �ۼ��Ϸ�����</a>
</body>
</html>