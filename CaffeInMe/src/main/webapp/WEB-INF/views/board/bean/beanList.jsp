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
				<th>��ȣ</th>
				<th>�����̸�</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${beans}" var="list">
				<tr>
					<td>${list.BNO}</td>
					<td><a href="${cp}/board/bean/beanRead?bno=${list.BNO}">${list.BNAME}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="${cp}/">���������̵�</a>
</body>
</html>