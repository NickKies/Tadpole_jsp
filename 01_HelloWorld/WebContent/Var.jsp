<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변수</title>
</head>
<body>
	<h2>정보 출력 폼</h2>
	<%
		String name = "김윤성";
		String gender = "남성";
		String hp = "01011112222";
	%>
	<p> 당신의 이름은 <%= name %>입니다 </p>
	<p> 성별은 <%= gender %>이며, 전화번호는 <%=hp%>입니다.</p>
</body>
</html>