<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="com.member.User"/>
<jsp:setProperty property="*" name="user"/>
<%
//<jsp:setProperty property="userId" name="user"/>
//<jsp:setProperty property="userPass" name="user"/>
//<jsp:setProperty property="userName" name="user"/>
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	int rows = 0;
	String msg = "";
	String url = "jdbc:mariadb://localhost:3306/jsptest";
	String uid = "root";
	String upw = "1234";
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("데이터베이스 연결 시도중");
		conn = DriverManager.getConnection(url, uid, upw);
		System.out.println("데이터베이스 연결 성공");
		
		String sql = "INSERT into memberex2 (user_id, user_pass, user_name) VALUES (?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getUserPass());
		pstmt.setString(3, user.getUserName());
		rows = pstmt.executeUpdate();
		if(rows > 0){
			msg = user.getUserName() + "님 회원가입되었습니다.";
		}else {
			msg = user.getUserName() + "님 회원가입 실패하였습니다.";
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
<title>Insert title here</title>
</head>
<body>
<%
	if(rows >0){
%>
		상태 : <%=msg%>
<%
	}else{
%>
		<script>
			alert('<%=msg%>');
			location.href="DtoDao01.jsp";
		</script>
<%
	}
%>
</body>
</html>