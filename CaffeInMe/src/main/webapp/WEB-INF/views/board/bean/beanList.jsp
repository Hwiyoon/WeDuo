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

<style>
 /* section.reviewForm { padding:30px 0; }
 section.reviewForm div.input_area { margin:10px 0; }
 section.reviewForm textarea { font-size:16px; font-family:'¸¼Àº °íµñ', verdana; padding:10px; width:500px;; height:150px; }
 section.reviewForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.reviewList { padding:30px 0; }
 section.reviewList ol { padding:0; margin:0; }
 section.reviewList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.reviewList div.memberInfo { }
 section.reviewList div.memberInfo .MID { font-size:24px; font-weight:bold; }
 section.reviewList div.memberInfo .reviewDate { color:#999; display:inline-block; margin-left:10px; }
 section.reviewList div.reviewContetn { padding:10px; margin:20px 0; } */
</style>

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
                    <c:forEach items="${beans}" var="list">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="pricing-table">
                                <div class="pricing-header">
                                    <p class="pricing-title">${list.BNAME}</p>
                                    <a href="${cp}/board/bean/beanRead?bno=${list.BNO}" class="btn btn-custom">${list.BNAME}</a>
                                 
                                </div>

                                <div class="pricing-list">
                                    <ul>
                                        <li><i class="fa fa-smile-o"></i>${list.BNO}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section> 
	

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</footer>
	</div>

</body>
</html>