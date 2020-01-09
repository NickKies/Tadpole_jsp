<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<String> familyList = new ArrayList<>();
	String[] nameArr = {"김사과","이바나","박수박","최오렌","김구"};
	for(int i=0; i<nameArr.length; i++){
		familyList.add(nameArr[i]);
	}
	pageContext.setAttribute("Family",familyList);
	// arrylist를 쓰는 이유
	// 1. 배열은 크기를 정하면 크기를 변경하지를 못함. (새로 만들어서 옮겨야함)
	// 2. arrylist에서만 사용가능 메소드가 많고, 속도도 빠르다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El ArrayList</title>
</head>
<body>
<h2>El ArrayList</h2>
<p>1. ${Family[0]}</p>
<p>2. ${Family[1]}</p>
<p>3. ${Family[2]}</p>
<p>4. ${Family[3]}</p>
<p>5. ${Family[4]}</p>
</body>
</html>