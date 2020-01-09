<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cook = request.getHeader("Cookie");
	if(cook != null){
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("Userid")){
				Cookie cookie = new Cookie("Userid", "banana");
				// 쿠키값이 존재한다면 해당 이름으로 새로운 쿠키를 만들경우 변경이 됩니다.
				response.addCookie(cookie);
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
	<p><a href="cookie01_1.jsp">변경된 쿠키 확인하러 가기</a></p>
</body>
</html>