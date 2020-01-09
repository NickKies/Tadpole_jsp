<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. Write.jsp에서 입력받은 b_title, b_content 를 가져와서 변수에 저장
	// 2. 세션이 없는 경우 Login.jsp로 이동
	// 3. DB연결 후 테이블에 입력받은 데이터를 Insert 시킴
	// (String ip = request.getRemoteAddr())
%>
<%@ page import = "java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String b_idx		= request.getParameter("b_idx");
	//String b_userid		= request.getParameter("b_userid");
	String b_title		= request.getParameter("b_title");
	String b_content	= request.getParameter("b_content");
	String b_ip 		= request.getRemoteAddr();

	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){
			sql = "SELECT * FROM board WHERE b_userid = ? AND b_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,b_idx);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()){
				sql = "UPDATE board set b_title=?, b_content=?, b_ip=?  WHERE b_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,b_title);
				pstmt.setString(2,b_content);
				pstmt.setString(3,b_ip);
				pstmt.setString(4,b_idx);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();	
%>				
				<script>
					alert("게시물을 업로드 하였습니다.")
					location.href="View.jsp?b_idx=<%=b_idx%>"
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
	}catch(Exception e){
		out.print(e);
	}
%>