<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = "";
	String value = "";
	String cook = request.getHeader("Cookie");
	if(cook != null){
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("Userid")){
				userid = cookies[i].getName();
				value = cookies[i].getValue();
			}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>쿠키 이름은 : <%= userid %></p>
	<p>쿠키 값은 : <%= value %></p>	
</body>
</html>