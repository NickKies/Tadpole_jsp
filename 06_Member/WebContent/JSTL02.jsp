<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL IF문</title>
</head>
<body>
	<c:set var="num" value="1" scope="session"/>
	
	<c:if test="${num == 1}">
		<p>숫자는 1입니다.</p>
	</c:if>
</body>
</html>