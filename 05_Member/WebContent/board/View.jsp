<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<%
	// 조회수를 증가시키는 쿼리를 추가
	// update board set b_hit = b_hit + 1 where b_idx = ?
	String b_idx = request.getParameter("b_idx");
	// SELECT * FROM board WHERE b_idx = ?
	String b_userid = "";
	String b_name = "";			
	String b_title = "";
	String b_content = "";
	String b_hit = "";
	String b_registdate = "";
	String b_ip = "";
	
	//String r_bidx = "";
	String r_idx = "";
	String r_userid = "";
	String r_content = "";
	String r_regist = "";
	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){
			sql ="update board set b_hit = b_hit + 1 where b_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,b_idx);
			pstmt.executeUpdate();
			
			sql ="SELECT * FROM board WHERE b_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,b_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){					
				b_userid = rs.getString("b_userid");
				b_name = rs.getString("b_name");				
				b_title = rs.getString("b_title");
				b_content = rs.getString("b_content");
				b_hit = rs.getString("b_hit");
				b_registdate = rs.getString("b_registdate");
				b_ip = rs.getString("b_ip");
			}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script src="../js/reply.js">
</script>
</head>
<body>
<h2>글보기</h2>
<p>조회수 : <%=b_hit %></p>
<p>날짜 : <%=b_registdate %></p>
<p>아이피: <%=b_ip %></p>
<p>아이디 : <%=b_userid %></p>
<p>이름 : <%=b_name %></p>
<p>제목 : <%=b_title %></p>
<p>내용</p>
<p><%=b_content %></p>
<p><a href="List.jsp">리스트</a> 
<%
	if(userid.equals(b_userid))	{
%>
 | <a href="Edit.jsp?b_idx=<%=b_idx%>">수정</a> | <a href="Delete.jsp?b_idx=<%=b_idx%>">삭제</a><%	}%></p>	
<%
			sql = "SELECT * FROM reply WHERE r_bidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,b_idx);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				r_idx 	= rs.getString("r_idx");
				r_userid = rs.getString("r_userid");
				r_content = rs.getString("r_content");
				r_regist = rs.getString("r_regist");	
%>					
<p><%=r_userid %> : <%=r_content %> <%=r_regist.substring(0,16) %>
<%
					if(userid.equals(r_userid)){
%>
<input type="button" value="삭제" onclick="del('<%=r_idx%>', '<%=b_idx%>')"><%}%></p>
<%				
					i++;
				}
			}	
		}catch(Exception e){
			out.print(e);
		}				
%>

<%//<form name="rForm" method="post" action="reply_ok.jsp?b_idx=<%= //b_idx%>">-->
<form name="rForm" method="post" action="reply_ok.jsp">
<input type="hidden" name="b_idx" value="<%=b_idx%>">
<p><%=userid %> : <input type="text" name="r_content"> 
<input type="button" value="입력" onclick="sendit()"></p>
</form>
</body>
</html>