<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	String url = "jdbc:mariadb://localhost:3306/jsptest";
	String uid = "root";
	String upw = "1234";
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url,uid,upw);
		if(conn != null){
			sql = "INSERT INTO memberex1 values(?,PASSWORD(?),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,pwd);
			pstmt.setString(3,name);
			pstmt.setString(4,email);
			//rs = pstmt.executeQuery();
			pstmt.executeUpdate();			
		}
	}catch(Exception e){
		out.print(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password()함수</title>
</head>
<body>
	<p>아이디  : <%=userid %></p>
	<p>패스워드 : <%=pwd %></p>
	<p>이름 : <%=name %></p>
	<p>이메일 : <%=email %></p>
</body>
</html>