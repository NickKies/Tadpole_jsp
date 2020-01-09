<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bean.PersonBean" %>
<%
	// PersonBean 객체 만들기
	PersonBean p = new PersonBean();
	p.setName("김윤성");
	p.setJob("프로그래머");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBeans</title>
</head>
<body>
	<p>이름 : <%=p.getName() %></p> 
	<p>직업 : <%=p.getJob() %></p> 
</body>
</html>