<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cook = request.getHeader("Cookie");
	if(cook != null){
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("userid")){
				Cookie cookie = new Cookie("userid", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<script>
		alert("로그아웃 되었습니다!")
		location.href="Cookie2.jsp"
	</script>
</body>
</html>