<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// PassWd.jsp에서 기존 패스워드와 현재 변경할 패스워드를 입력받아 전달받은 다음 DB를 연결하고
	// 기존 패스워드가 맞는지 확인후 현재 패스워드로 변경
%>
<%@ page import="java.sql.*" %> 
<% 
	request.setCharacterEncoding("UTF-8");
	String old_m_pwd	= request.getParameter("old_m_pwd");
	String m_pwd		= request.getParameter("m_pwd");
	
	String userid = "";
	
	if(session.getAttribute("userid") != null){				
		userid = (String)session.getAttribute("userid");	
	}else {
		response.sendRedirect("Login.jsp");
	}
	
	Connection conn = null;
	String sql="";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){		
			sql = "SELECT m_userid FROM member WHERE m_userid = ? AND m_pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,old_m_pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "UPDATE member SET m_pwd = ? WHERE m_userid = ?";				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_pwd);
				pstmt.setString(2,userid);
				pstmt.executeUpdate();
%>				
				<script>
					alert("패스워드가 변경되었습니다.")
					location.href="Login.jsp"
				</script>
<%

			}else{			
%>				
				<script>
					alert("기존 패스워드를 확인해 주세요")
					location.href="PassWd.jsp"
				</script>
<%
			}
		}		
	}catch(Exception e){
		out.print(e);
	}
 %> 
	