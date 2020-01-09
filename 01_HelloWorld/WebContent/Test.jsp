<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 문법 연습</title>
</head>
<body>
	<h1>JSP 문법 연습</h1>
	<script>
		var num = 10;
		document.write("num = "+num+"<br>")
	</script>
	<%
		int num = 20;
		out.println("num = "+num);
	%>
	<br>
	<%
		String str = "김윤성";
		out.println("<h2>"+ str + "의 JSP 첫 문법연습 페이지 입니다.</h2>");
	%>
	<br>
	<%
		out.println("현재 날짜 및 시간은");
	%>
	<%= new Date() %>
</body>
</html>