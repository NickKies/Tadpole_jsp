<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>      
<%
	String m_userid = request.getParameter("m_userid");
	String m_pwd 	= request.getParameter("pwd");
	
	Connection conn = null;
	String sql="";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		if(conn != null){
			//out.print("DB연결 성공!");
			sql ="SELECT m_userid, m_name FROM member WHERE m_userid = ? AND m_pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_userid);
			pstmt.setString(2, m_pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				session.setAttribute("userid", m_userid);
				session.setAttribute("name", rs.getString("m_name"));
				response.sendRedirect("Login.jsp");
				
			}else {
				%>
				<script>
					alert("아이디 또는 패스워드를 확인해 주세요")
					location.href="Login.jsp"
				</script>
			<%
				}
			pstmt.close();
			conn.close();
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