<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 객체</title>
</head>
<body>
<%
	/*
	response.getWriter() 와 out.println()
	출력스트림이 2개 생성
	PrintWriter 갹체 브라우저에 곧바로 전송
	out.println은 출력버퍼에 모아두고 나중에 출력
	
	*/
	PrintWriter out2 = response.getWriter();
	out2.println("for문 시작 전 <br>");
	
	for(int cnt=1; cnt <=10; cnt++){
		if(cnt % 2 == 0){
			out.println("짝수= "+ cnt + "<br>");
		}else{
			out.println("홀수= "+ cnt + "<br>");
		}
	}
	out2.println("for문 종로후<br>");
%>
</body>
</html>