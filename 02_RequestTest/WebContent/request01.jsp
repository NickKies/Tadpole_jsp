<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 메소드</title>
</head>
<body>
	<%
		out.println("서버 : " + request.getServerName() +"<br>");
		out.println("포트번호 : " + request.getServerPort() +"<br>");
		out.println("요청방식 : " + request.getMethod() +"<br>");
		out.println("프로토콜 : " + request.getProtocol() +"<br>");
		out.println("URL : " + request.getRequestURL() +"<br>");
		out.println("URI : " + request.getRequestURI() +"<br>");
	%>
</body>
</html>