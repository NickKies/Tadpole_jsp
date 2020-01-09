<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>      
<%
	String mem_userid = request.getParameter("mem_userid");
	// DB처리
	Connection conn = null;
	String sql="";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		if(conn != null){
			//out.print("DB연결 성공!");
			sql ="SELECT m_userid FROM member WHERE m_userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				out.println("no");
			}else {
				out.println("ok");
			}
		}
	}catch(Exception e){
		out.print(e);
	}
%>