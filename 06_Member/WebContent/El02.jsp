<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("test","el 테스트");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El객체 사용 예제</title>
</head>
<body>
<form action="El02_ok.jsp" method="post">
	<p>이름 : <input type="text" name="name"></p>
	<p><input type="submit" value="입력"></p>
</form>
</body>
</html>