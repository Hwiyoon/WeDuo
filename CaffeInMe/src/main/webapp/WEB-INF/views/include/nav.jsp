<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
<c:if test="${loginMember == null}">
	<li>
		<a href="${cp}/member/loginForm">로그인</a>
	</li>
	<li>
		<a href="${cp}/member/joinForm">회원가입</a>
	</li>
</c:if>
<c:if test="${loginMember != null}">


	<li>
		${loginMember.MNAME}님 환영합니다.
	</li>
	<li>
		<a href="${cp}/board/bean/beanList">원두 리스트</a>
	</li>
	<li>
		<a href="${cp}/">메인페이지</a>
	</li>
	<li>
		<a href="${cp}/member/logout">로그아웃</a>
	</li>
</c:if>

</ul>