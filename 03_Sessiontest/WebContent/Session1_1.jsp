<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid =(String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 확인</title>
</head>
<body>
	<p>세션 값은 : <%= userid %></p>
	<p><a href="Session1_2.jsp">세션값 삭제</a></p>
</body>
</html>