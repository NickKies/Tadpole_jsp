<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	if(userid.equals("apple") && pwd.equals("1111")){
		session.setAttribute("userid", userid);
		//session.setAttribute("pwd","1111");
		response.sendRedirect("SessionTest.jsp");
	}else{
%>
	<script>
		alert("아이디 또는 패스워드를 확인해 주세요")
		location.href="SessionTest.jsp"
	</script>
<%
	}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>