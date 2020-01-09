<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 배열파라미터</title>
</head>
<body>
<h2>EL 배열파라미터</h2>
<p>이름 : ${param.name}</p>
<p>이름 : ${param['name']}</p>
<p>취미 : ${paramValues.hobby[0]} ${paramValues.hobby[1]} ${paramValues.hobby[2]} </p>
</body>
</html>