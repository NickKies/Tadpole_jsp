<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 객체 사용 예제</title>
</head>
<body>
	<h2>기존 request.getParameter 방식 : <%=name %></h2>
	<h2>request.setAttribute로 만든 속성값 : ${reqeustScope.name}</h2>
	<h2>request로 넘어온 값 : ${param.name}</h2>
	<h2>session 변수 값 : ${sessionScope.test}</h2>
</body>
</html>