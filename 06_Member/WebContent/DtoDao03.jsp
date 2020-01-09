<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="java.util.List" %>
<%@ page import="com.member.MariadbConnect" %>
<%@ page import="com.member.User" %>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<User> list = new ArrayList();
	int rows = 0;
	String msg = "";
	try {
		MariadbConnect db = MariadbConnect.getInstance();
		conn = db.getConnection();
		String sql = "SELECT * FROM memberex2 ORDER BY id DESC";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPass(rs.getString("user_pass"));
			user.setUserName(rs.getString("user_name"));
			list.add(user);
		}
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		try {if(rs != null){rs.close();}
		}catch(Exception e){ e.printStackTrace();}
		try {if(pstmt != null){pstmt.close();}
		}catch(Exception e){e.printStackTrace();}
		try {if(conn != null){conn.close();}
		}catch(Exception e){e.printStackTrace();}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 현황</title>
</head>
<body>
	<h2>회원 현황</h2>
	<h3><%=list.size() %>명</h3>
	<table border="1" width="600">
		<tr>
			<th>회원번호</th>
			<th>회원ID</th>
			<th>회원이름</th>
		</tr>	
		<%
			int index = 1 ;
			for(User u : list){
		%>
		<tr>
			<td><%= index++ %></td>
			<td><%= u.getUserId() %></td>			
			<td><%= u.getUserName() %></td>					
		<%}%>
	</table>
</body>
</html>