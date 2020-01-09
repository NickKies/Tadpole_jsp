<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = "";
	String name = "";

	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");	// 실제 로그인한 아이디가 저장되어 있습니다.
		name = (String)session.getAttribute("name");	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="js/login.js"></script>
</head>
<body>
<%
	if(!userid.equals("")){
%>
	<p><%= userid %>님 환영합니다</p>
	<p>아이디: <%= userid %> </p>
	<p>이름 : <%= name %></p>
	<p><a href="Logout.jsp">[로그아웃]</a> | <a href="Modify.jsp">[정보수정]</a> | 
	<a href="Leave.jsp">[회원탈퇴]</a> | <a href="PassWd.jsp">[비밀번호 수정]</a> </p>
	<p><a href="board/List.jsp">[게시판]</a> | <a href="board/Write.jsp">[게시판 글쓰기]</a></p>
<%
	}else{
%>
	<h2>로그인</h2>
	<form name="LoginForm" method="post" action="login_ok.jsp">
	<p><label>ID : <input type="text" name="m_userid" maxlength="20"></label></p>
	<p><label>PW : <input type="password" name="pwd" maxlength="20"></label></p>
	<p><input type="submit" value="로그인" onclick="sendit()"> | 
	<a href="Regist.jsp">회원가입</a></p>
	</form>
<%
	}
%>	
</body>
</html>