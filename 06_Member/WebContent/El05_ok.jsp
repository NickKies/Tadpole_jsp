<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="com.db.ELBean"/>    
<jsp:setProperty name="bean" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El Bean Test</title>
</head>
<body>
	<p>id : <jsp:getProperty property="id" name="bean"/></p>
	<p>password : <jsp:getProperty property="passwd" name="bean"/></p>
	<p>siteBean : <jsp:getProperty property="sitename" name="bean"/></p>
	<br><br>
	<p>id : ${bean.id}</p>
	<p>password : ${bean.passwd}</p>
	<p>siteBean : ${bean.sitename}</p>
</body>
</html>