<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<%
	String b_idx = request.getParameter("b_idx");
	String b_userid = "";
	String b_name = "";
	String b_title = "";
	String b_content ="";
	String b_hit = "";
	String b_registdate = "";
	String b_ip ="";
	String r_idx = "";
	String r_userid="";
	String r_content ="";
	String r_regist ="";
	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb:localhost:3306/jsptest","root","1234");
		
		if(conn != null){
			
		}
		
	}catch(Exception e){
		out.print(e);
	}
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