<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>If</title>
</head>
<body>
	<h2>정보 출력 폼</h2>
	<%
		String name = "김윤성";
		String gender = "1";
		String hp = "01011112222";
	%>
	<p>당신의 이름은 <%=name %>입니다.</p>
	<p>
	<%
		if(gender.equals("1")){
	%>
		성별은 남자이며,
	<%
		}else{
	%>
		성별은 여자이며,
	<%
		}
	%>	
	전화번호는 <%=hp %> 입니다.</p>
</body>
</html>