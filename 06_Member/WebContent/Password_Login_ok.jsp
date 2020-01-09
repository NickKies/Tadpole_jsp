<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mariadb://localhost:3306/jsptest";
	String uid = "root";
	String upw = "1234";
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url,uid,upw);
		if(conn !=null){
			sql = "SELECT m_userid FROM memberex1 WHERE m_userid=? AND m_pwd=password(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,pwd);
			rs = pstmt.executeQuery();			
			if(rs.next()){
				out.println("로그인 되었습니다.");
			}else{
				out.println("로그인 실패");			
			}
		}		
	}catch(Exception e){
		out.print(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password() 함수</title>
</head>
<body>

</body>
</html>