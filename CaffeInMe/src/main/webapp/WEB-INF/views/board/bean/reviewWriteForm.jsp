<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form:form action="${cp}/board/bean/reviewWrite" method="post"
		commandName="beanReviewDTO">
		<table>
			<tr>
				<td>TITLE</td>
				<td><form:input path="TITLE" /></td>
			</tr>
			<tr>
				<td>CONTENT</td>
				<td><form:input path="CONTENT" /></td>
			</tr>
			<tr>
				<td>SOUR</td>
				<td><form:input path="SOUR" /></td>
			</tr>
			<tr>
				<td>SWEET</td>
				<td><form:input path="SWEET" /></td>
			</tr>
			<tr>
				<td>BITTER</td>
				<td><form:input path="BITTER" /></td>
			</tr>
			<tr>
				<td>BODY</td>
				<td><form:input path="BODY" /></td>
			</tr>
			<tr>
				<td>AROMA</td>
				<td><form:input path="AROMA" /></td>
			</tr>
			<tr>
				<td>FLAVOR</td>
				<td><form:input path="FLAVOR" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="리뷰 작성하기" > 
				<input type="reset" value="Cancel">
				</td>
			</tr>
		</table>
	</form:form>

	<a href="${cp}/index">MAIN</a>&nbsp;&nbsp;
	<a href="${cp}/member/loginForm">LOGIN</a>&nbsp;&nbsp;
</body>
</html>