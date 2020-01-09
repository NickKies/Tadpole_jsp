<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = "";
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="Login.js"></script>
</head>
<body>
<%
	if(!userid.equals("")){
%>
<p><%= userid %>님 환영합니다</p>
<p>아이디: <%= userid %> </p>
<p><a href="SessionTest_logout.jsp">[로그아웃]</a></p>
<%
	}else{
%>
<form name="LoginForm" method="post" action="SessionTestP.jsp">
	<p><label>아이디 : <input type="text" name="userid"></label></p>
	<p><label>패스워드 : <input type="password" name="pwd"></label></p>
	<p><input type="submit" value="로그인" onclick="sendit()"></p>
</form>
<%
	}
%>
</body>
</html>