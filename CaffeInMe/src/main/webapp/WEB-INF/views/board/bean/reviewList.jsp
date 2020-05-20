<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
<script src="${cp}/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${cp}/resources/table/assets/css/bootstrap.min.css">

<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${cp}/resources/table/assets/css/main.css">
<link rel="stylesheet" media="screen" href="${cp}/resources/table/assets/fonts/font-awesome/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${cp}/resources/css/user/shop/default.css">

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

		<section id="pricing-table">
            <div class="container">
                <div class="row">
                    <div class="pricing">
                    <c:forEach items="${beanReviews}" var="review">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="pricing-table">
                                <div class="pricing-header">
                                    <p class="pricing-title">${review.TITLE}</p>
                                    <a href="${cp}/board/bean/reviewRead?RNO=${review.RNO}" class="btn btn-custom">리뷰보기</a>
                                 
                                </div>

                                <div class="pricing-list">
                                    <ul>
                                        <li><i class="fa fa-smile-o"></i>작성자 : ${review.MID}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section> 
        
    <a href="${cp}/">메인 / </a>
	<a href="${cp}/board/bean/reviewWriteForm">해당원두리뷰작성</a>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</footer>
	</div>
	
	
<%-- 	<table>
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
	</table> --%>
	

</body>
</html>