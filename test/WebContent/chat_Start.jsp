<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
request.setCharacterEncoding("UTF-8");
	String userID = "";
	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}else {
		response.sendRedirect("go.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="chat.jsp" style="margin:20% auto; width:30%;">
<p>상대방 아이디입력  : <input type="text" name="toID"> <input type="submit" value="채팅창으로!"><p>
</form>

</body>
</html>