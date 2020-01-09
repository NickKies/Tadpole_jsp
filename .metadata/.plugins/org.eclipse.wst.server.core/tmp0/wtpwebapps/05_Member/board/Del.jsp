<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<%
	String b_idx = request.getParameter("bidx");
	String r_idx = request.getParameter("ridx");
	String r_userid = "";
	//out.println("현재글번호 : " + b_idx);
	//out.println("댓글번호 : " + r_idx);
	// 1. 세션 체크 후 세션에 저장된 로그인 아이디와 댓글을 작성한 작성자와 같을 경우만 2번으로 넘어갑니다.
	// (다를 경우 에러메세지 출력 후 다시 View.jsp로 이동합니다.)
	// 2. DB연결 후 DELETE을 이용해서 해당 댓글을 삭제 합니다.
	// 3. b_idx를 이용해서 View.jsp로 이동합니다.
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
			sql ="SELECT r_userid FROM reply WHERE r_bidx = ? AND r_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,b_idx);
			pstmt.setString(2,r_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				r_userid = rs.getString("r_userid");
				
				if(userid.equals(r_userid)){				
					sql = "DELETE FROM reply WHERE r_idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,r_idx);
					pstmt.executeUpdate();
					pstmt.close();
					conn.close();				
%>				
					<script>
						alert("댓글이 성공적으로 지워졌습니다.")
						location.href="View.jsp?b_idx=<%=b_idx%>"
					</script>
<%
				}else{
%>				
					<script>
						alert("잘못된 접속경로입니다.")
						location.href="View.jsp?b_idx=<%=b_idx%>"
					</script>
<%
				}
			}	
		}
	}catch(Exception e){
		out.print(e);
	}
%>	