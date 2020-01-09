<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	//response.sendRedirect("SessionTest.jsp");  // 아래 동작이 안먹힐 수 있음 대신 빠름
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션값 삭제</title>
</head>
<body>
	<script>
		location.href="SessionTest.jsp"
	</script> 
</body>
</html>