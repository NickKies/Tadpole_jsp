<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	//String r_userid		= request.getParameter("userid");
	String r_content 	= request.getParameter("r_content");
	String b_idx		= request.getParameter("b_idx");
	String ip			= request.getRemoteAddr();
	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){
			sql = "insert into reply (r_userid,r_content,r_ip,r_bidx) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,r_content);
			pstmt.setString(3,ip);
			pstmt.setString(4,b_idx);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			//out.print("글이 정상적으로 등록되었습니다.")
%>				
			<script>
				alert("댓글을 업로드 하였습니다.")
				location.href="View.jsp?b_idx=<%=b_idx%>"
			</script>
<%
		}
	}catch(Exception e){
		out.print(e);
	}
%>
	
	
