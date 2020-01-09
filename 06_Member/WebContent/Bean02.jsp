<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myBean" class="com.bean.PersonBean" scope="page"/>    
<%
	// import가 아닌 jsp  bean으로 선언하고 사용하는 방법
	myBean.setName("김윤성");
	myBean.setJob("프로그래머");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBeans</title>
</head>
<body>
	<p>이름 : <%=myBean.getName() %></p> 
	<p>직업 : <%=myBean.getJob() %></p> 
	<p> ${myBean.getName()}</p>
</body>
</html>