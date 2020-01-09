<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 변수</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="name" value="김윤성"/>
	<p>이름 : <c:out value="${name}"/></p>
	<!-- 변수 재선언 -->
	<c:set var="name" value="김사과"/>
	<p>변경된 이름 : <c:out value="${name}"/></p>
	<p>변경된 이름: ${name}</p>
	<c:remove var="name"/>
	<p>삭제된 이름 : <c:out value="${name}" default="삭제되었음"/></p>
	
</body>
</html>