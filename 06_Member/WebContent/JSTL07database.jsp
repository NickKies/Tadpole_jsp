<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="sql" uri = "http://java.sun.com/jsp/jstl/sql"  %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL sql</title>
</head>
<body>
	<h1> JSTL로 db자료 읽기(회원정보)</h1>
	<c:catch var="err">
	<sql:setDataSource
	var = "ds"
	url="jdbc:mysql://localhost:3306/jsptest"
	driver="org.mariadb.jdbc.Driver"
	user="root"
	password="1234"
	/>
<sql:query var="rs" dataSource="${ds}">
	select*from MemberEx1 WHERE m_userid=?
<sql:param value="apple"/>	
</sql:query>

<table border="1" withd="60">
	<tr>
	<th>id</th><th>pwd</th><th>name</th><th>email</th>
	<c:forEach var="s" items="${rs.rows}">
	<tr>
		<th>${s.m_userid}</th>
		<th>${s.m_pwd}</th>
		<th>${s.m_name}</th>
		<th>${s.m_email}</th>
	</tr>
	</c:forEach>
	</tr>
</table>
</c:catch>
<c:if test="${err != null}">
	에러 :${err.massage}
</c:if>		
</body>
</html>