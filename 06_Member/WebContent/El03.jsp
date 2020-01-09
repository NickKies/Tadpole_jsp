<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El의 액션 태그 사용</title>
</head>
<body>
<h2>El의 액션 태그 사용</h2>
<jsp:useBean id="color" class="java.util.ArrayList">
<%
	color.add("red");
	color.add("orange");
	color.add("green");
	color.add("blue");
	color.add("violet");
%>
</jsp:useBean>
<p><font color="${color[0]}">이 색상은 ${color[0]}색 입니다.</font>
<p><font color="${color[1]}">이 색상은 ${color[1]}색 입니다.</font>
<p><font color="${color[2]}">이 색상은 ${color[2]}색 입니다.</font>
<p><font color="${color[3]}">이 색상은 ${color[3]}색 입니다.</font>
<p><font color="${color[4]}">이 색상은 ${color[4]}색 입니다.</font>

</body>
</html>