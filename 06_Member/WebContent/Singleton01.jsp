<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="com.member.MariadbConnect" %>
<%
	MariadbConnect db = MariadbConnect.getInstance();
	Connection conn = db.getConnection();
	String sql = "";
	conn.prepareStatement(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>