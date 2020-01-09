<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<form method="post" action="File01_ok.jsp" enctype="Multipart/form-data">
<p>이름 : <input type="text" name="name"></p>
<p>제목 : <input type="text" name="subject"></p>
<p>파일 : <input type="file" name="fileName1"></p>
<p><input type="submit" value="전송"></p>
</form>
</body>
</html>