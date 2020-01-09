<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myBean" class="com.bean.PersonBean" scope="page"/>  
<jsp:setProperty property="name" name="myBean" value="김윤성"/>
<jsp:setProperty property="job" name="myBean" value="프로그래머"/>
<%
	//	set, get을 프로퍼티로 사용이 가능합니다.
	//	html 태그 형식스러운 방식
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBeans</title>
</head>
<body>
	<p> 이름: <jsp:getProperty property="name" name="myBean"/></p>
	<p> 직업: <jsp:getProperty property="job" name="myBean"/></p>
</body>
</html>