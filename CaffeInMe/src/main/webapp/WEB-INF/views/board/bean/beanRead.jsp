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
				<th>�����̸�</th>
				<th>���μ���</th>
			</tr>
		</thead>

		<tbody>
				<tr>
					<td>${sbean.BNAME}</td>
					<td>${sbean.CONTENT}</td>
				</tr>
		</tbody>

	</table>
	
	<a href="${cp}/">�������� �̵�</a>
	<a href="${cp}/board/bean/beanList">���� ����Ʈ�� �̵�</a>
	<a href="${cp}/board/bean/reviewList?bno=${sbean.BNO}">���� ���� ����Ʈ�� �̵�</a>
	<a href="${cp}/board/bean/reviewWriteForm">���� ���� �ۼ��Ϸ�����</a>
	
</body>
</html>