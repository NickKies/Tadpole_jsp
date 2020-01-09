<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 배열파라미터</title>
</head>
<body>
<h2>EL 배열 파라미터</h2>
<form action="El06_ok.jsp" method="post">
	<p>이름 : <input type="text" name="name"></p>
	<p>취미 : <label>독서<input type="checkbox" name="hobby" value="독서"></label>
	<label>여행<input type="checkbox" name="hobby" value="여행"></label>
	<label>등산<input type="checkbox" name="hobby" value="등산"></label>
	<label>낚시<input type="checkbox" name="hobby" value="낚시"></label>
	<label>영화<input type="checkbox" name="hobby" value="영화"></label>
	<label>운동<input type="checkbox" name="hobby" value="운동"></label>
	<label>드라이브<input type="checkbox" name="hobby" value="드라이브"></label></p>
	<p><input type="submit" value="전송"></p>
</form>
</body>
</html>