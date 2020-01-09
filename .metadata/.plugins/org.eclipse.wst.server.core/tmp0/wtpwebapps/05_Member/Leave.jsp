<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>회원 탈퇴</title>
<script src="js/leave.js"></script>
</head>
<body>
<h2>회원 탈퇴</h2>
<p>회원 탈퇴를 하시려면 패스워드를 입력 후 탈퇴버튼을 누르면 됩니다.
<form name="leaveForm" method="post" action="leave_ok.jsp">
	<p>아이디 : <%= userid %></p>
	<p><label>패스워드 : <input type="text" name="m_pwd"></label></p> 
	<p><input type="button" value="탈퇴" onclick="sendit()">
	<input type="button" value="돌아가기" onclick="history.back()"></p>
</form>
</body>
</html>
