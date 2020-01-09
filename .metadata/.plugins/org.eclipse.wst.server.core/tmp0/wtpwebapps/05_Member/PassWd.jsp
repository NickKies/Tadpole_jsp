<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //session.invalidate(); %>
<%
	String userid = "";

	if(session.getAttribute("userid") != null){				
		userid = (String)session.getAttribute("userid");	
	}else {
		response.sendRedirect("Login.jsp");
	}
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 수정</title>
<script src="js/passWd.js"></script>
</head>
<body>
<h2>패스워드 수정</h2>
<form name="pwdForm" method="post" action="PassWd_ok.jsp">
	<p>아이디 : <%= userid %></p>
	<p><label>기존 패스워드 : <input type="password" name="old_m_pwd"></label></p> 
	<p><label>변경할 패스워드 : <input type="password" name="m_pwd" onkeyup="ch()"></label></p> 
	<p id="pwch"></p>
	<p><label>패스워드 확인: <input type="password" name="m_pwd_re" onkeyup="ch()"></label></p> 
	<p id ="pwch_re"></p>
	<p><input type="button" value="변경" onclick="sendit()">
	<input type="button" value="돌아가기" onclick="history.back()"></p>
</form>
</body>
</html>