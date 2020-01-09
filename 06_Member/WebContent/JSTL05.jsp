<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP forTokens</title>
</head>
<body>
<ul>
	<c:forTokens var="item" items="사과,딸기,포도,바나나,수박,복숭아" delims=",">
		<li>과일 : ${item}</li>
	</c:forTokens>
</ul>
</body>
</html>