<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.member.User" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="user" class="com.member.User"/>
<jsp:setProperty property="*" name="user"/>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int rows = 0;
	String msg = "";
	String url = "jdbc:mariadb://127.0.0.1:3306/jsptest";
	String uid = "root";
	String upw = "1234";
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("데이터베이스 연결 시도중");
		conn = DriverManager.getConnection(url, uid, upw);
		System.out.println("데이터베이스 연결 성공");
		String sql = "SELECT * FROM memberex2 where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,user.getId());
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			user.setId(rs.getInt("id"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPass(rs.getString("user_pass"));
			user.setUserName(rs.getString("user_name"));
		}
	}catch(Exception e) {
		e.printStackTrace();
		msg = user.getUserName() + "님 고객센터로 문의 주세요.";
	} finally {
		try{ if(pstmt != null){ pstmt.close();}
		}catch(Exception e){
			e.printStackTrace();
		}
		try{ if(conn != null){conn.close();}
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DTO와 DAO</title>
</head>
<body>
<form method="post" action="DtoDao02_ok.jsp">
	<input type="hidden" name="id" value="<%=user.getId() %>">
	<p><label>아이디 : <input type="text" name="userId" value="<%=user.getUserId() %>"></label></p>
	<p><label>비밀번호 : <input type="password" name="userPass" value="<%=user.getUserPass() %>"></label></p>
	<p><label>이름: <input type="text" name="userName"value="<%=user.getUserName() %>"></label></p>
	<p><input type="submit" value="정보수정"></p>
</form>
</body>
</html>