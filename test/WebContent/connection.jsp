<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource"%>
<%
	DataSource dataSource;
	Connection conn = null;
	try{
		Context context = new InitialContext();
		dataSource = (DataSource)context.lookup("java:comp/env/jdbc_mariadb");
		// java : comp/env/ : JNDI에서 자원을 접근하기 위한 로컬리소스 가상 디렉토리
		conn = dataSource.getConnection();
		System.out.println("DB연결 성공");
		
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>