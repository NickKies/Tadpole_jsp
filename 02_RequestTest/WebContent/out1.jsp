<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 객체</title>
</head>
<body>
<% for(int cnt =1; cnt <= 10; cnt++){
	if(cnt %2 ==0){
%>
	짝수 = <%= cnt %><br>
<% }else{ %>
	홀수 = <%= cnt %><br>
<% }
	}%>
<br><br>
<%
for(int cnt =1; cnt <= 10; cnt++){
	if(cnt %2 ==0){
		out.println("짝수 = " + cnt + "<br>");
	}else{
		out.println("홀수 = " + cnt + "<br>");
	}
}	
%>

</body>
</html>