<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String[] MemArr = {"김사과","이바나","박수박","최오렌","김구"};
	pageContext.setAttribute("memeber",MemArr);  
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 배열</title>
</head>
<body>
<h2>EL 배열</h2>
1. ${memeber[0]}
2. ${memeber[1]}
3. ${memeber[2]}
4. ${memeber[3]}
5. ${memeber[4]}
</body>
</html>