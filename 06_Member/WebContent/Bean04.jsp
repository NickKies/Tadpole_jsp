<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBeans</title>
</head>
<body>
	<h2>회원가입</h2>
	<form method="post" action="Bean04_ok.jsp">
		<p>이름 : <input type="text" name="name"></p>
		<p>직업 : <input type="text" name="job"></p>
		<p>이메일 : <input type="text" name="email"></p>
		<p>비밀번호 : <input type="password" name="password"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>