<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>세션 정보 조회</title></head>
<body>

member = <%= session.getAttribute("loginMember") %><br/>

</body>
</html>
