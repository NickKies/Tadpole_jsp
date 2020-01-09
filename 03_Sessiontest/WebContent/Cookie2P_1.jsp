<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = "";
	String pwd = "";
	String cook = request.getHeader("Cookie");
	if(cook != null){
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("userid")){
				userid = cookies[i].getValue();
			}
			if(cookies[i].getName().equals("pwd")){
				pwd = cookies[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<p>아이디 : <%= userid %></p>
	<p>패스워드 : <%= pwd %></p>
</body>
</html>