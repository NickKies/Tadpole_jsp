<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = "";
	String cook = request.getHeader("Cookie");    // 호출한 클라이언트의 Cookie정보를 읽어옵니다.
												  // 단, 현재 서버에서 제공한 쿠키만!
	if(cook != null){
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("userid")){
				userid = cookies[i].getValue();
			}
		}
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
<p><a href="Cookie2_logout.jsp">[로그아웃]</a></p>
<%
	}else{
%>
<form name="LoginForm" method="post" action="Cookie2P.jsp">
	<p><label>아이디 : <input type="text" name="userid"></label></p>
	<p><label>패스워드 : <input type="password" name="pwd"></label></p>
	<p><input type="submit" value="로그인" onclick="sendit()"></p>
</form>
<%
	}
%>
</body>
</html>