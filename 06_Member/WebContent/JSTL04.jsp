<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<% HashMap map = new HashMap();
//키와 값을 가진다.
	map.put("no1","value1");
	map.put("no2","value2");
	map.put("no3","value3");
	map.put("no4","value4");
	map.put("no5","value5");
	map.put("no6","value6");
	request.setAttribute("eachMap",map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<c:forEach var="list" items="${eachMap}" varStatus="ind">
		<p>${ind.index} eachMap의 값은 ${list.value}</p>
	</c:forEach>
</body>
</html>