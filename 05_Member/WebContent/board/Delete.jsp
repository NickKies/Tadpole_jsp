<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<% 
	// 1. View.jsp에서 넘어온 글번호를 저장합니다.
	// 2. DB접속후 해당하는 데이터를 삭제합니다.
%>
<%
	String b_idx = request.getParameter("b_idx");
	String b_userid = "";
%>
<%	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){
			sql ="SELECT b_userid FROM board WHERE b_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				b_userid = rs.getString("b_userid");
				
				if(userid.equals(b_userid)){				
					sql = "DELETE FROM board WHERE b_idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,b_idx);
					pstmt.executeUpdate();
					pstmt.close();
					conn.close();				
%>				
					<script>
						alert("게시글이 성공적으로 지워졌습니다.")
						location.href="List.jsp"
					</script>
<%
				}else{
%>				
					<script>
						alert("잘못된 접속경로입니다.")
						location.href="List.jsp"
					</script>
<%
				}
			}	
		}
	}catch(Exception e){
		out.print(e);
	}
%>	