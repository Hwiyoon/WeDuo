<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>

<script src="${cp}/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${cp}/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${cp}/resources/css/user/shop/default.css">

<script src="${cp}/resources/bootstrap/bootstrap.min.js"></script>
<style>
 section.reviewForm { padding:30px 0; }
 section.reviewForm div.input_area { margin:10px 0; }
 section.reviewForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.reviewForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.reviewList { padding:30px 0; }
 section.reviewList ol { padding:0; margin:0; }
 section.reviewList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.reviewList div.memberInfo { }
 section.reviewList div.memberInfo .MID { font-size:24px; font-weight:bold; }
 section.reviewList div.memberInfo .reviewDate { color:#999; display:inline-block; margin-left:10px; }
 section.reviewList div.reviewContetn { padding:10px; margin:20px 0; }
</style>

				
<script>
	function reviewList(){
		var CNO = ${scafe.CNO};
		$.getJSON("cafeRead/reviewList" + "?CNO=" + CNO, function(data){
			var str = "";
			
			$(data).each(function(){
				console.log(data);
				
				var reviewDate = new Date(this.reviewdate);
				reviewDate = reviewDate.toLocaleDateString("ko-US");
				
				str += "<li data-CNO='" + this.cno + "'>"
					+ "<div class='memberInfo'>"
					+ "<span class='MID'>" + this.mid + "</span>"
					+ "<span class='reviewDate'>" + reviewDate + "</span>"
					+ "</div>"
					+ "<div class='reviewContent'>" + this.content + "</div>"
					+ "</li>";
			});
							
			$("section.reviewList ol").html(str);
		});	
	}
</script>
				
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

		<section id="container">
		<div id="container_box">
			<table border="1">
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
					<tr>
						<td>${scafe.CNO}</td>
						<td>${scafe.CNAME}</td>
						<td>${scafe.CADDR}</td>
						<td>${scafe.CTIME}</td>
						<td>${scafe.CPAGE}</td>
					</tr>
				</tbody>
			</table>
			<br />
			<br />
			<br />
		</div>

		<div id="review">

			<c:if test="${loginMember == null}">
				<p>
					소감을 남기시려면 <a href="${cp}/member/loginForm">로그인</a>해주세요.
				</p>
			</c:if>

			<c:if test="${loginMember != null}">
				<section class="reviewForm"> 
					<form:form role="form" action="${cp}/board/cafe/writeCafeReview" method="post" commandName="cafeReviewDTO">
							<div class="input_area">
								<form:textarea path="CONTENT" rows="10" cols="100" id="con"/>
							</div>
							<div class="input_area">
									<button type="button" id="reply_btn">소감남기기</button>
									<script>
									const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
										$("#reply_btn").click(function(){
											//var formObj = $(".reviewForm form[role='form']");
											var CONTENT = $("textarea#con").val();
											
											var data = {
													CONTENT : CONTENT
											};
											
											$.ajax({
												url : ctx+"/board/cafe/writeCafeReview",
												type : "post",
												data : data,
												success : function(){
													reviewList();
													$("#con").val("");
												}
											});
										});
									</script>
							</div>
					</form:form>
				</section>
			</c:if>

			<section class="reviewList">
				<ol>
					<%-- <c:forEach items="${cafeReviews}" var="cafeReview">
						<li>
							<div class="memberInfo">
								<span class="MID">${cafeReview.MID}</span>
								<span class="reviewDate"><fmt:formatDate value="${cafeReview.REVIEWDATE}" pattern="yyyy-MM-dd"/></span>
							</div>
							<div class="reviewContetn">
								${cafeReview.CONTENT}
							</div>
						</li>
					</c:forEach> --%>
					
				</ol>
				
				<script type="text/javascript">
					reviewList();
				</script>
				

			</section>

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