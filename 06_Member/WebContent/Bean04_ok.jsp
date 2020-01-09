<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Set" %>    
<%@ page import="com.bean.PersonBean" %>
<%@ page import="java.util.HashSet" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="myBean" class="com.bean.PersonBean"/>
<jsp:setProperty property="*" name="myBean"/>
<%
	// set : 순서가 없고, 중복이 되지 않습니다.
	// list : 순서가 있고, 중복을 허용합니다.
	Set<PersonBean> userList = (Set)application.getAttribute("userList");

	if(userList == null){
		userList = new HashSet();
	}
	
	userList.add(myBean);

	application.setAttribute("userList",userList);
	System.out.println("userList");
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBeans</title>
</head>
<body>
	<p>이름 : <jsp:getProperty property="name" name="myBean"/></p>
	<p>직업 : <jsp:getProperty property="job" name="myBean"/></p>
	<p>이메일 : <jsp:getProperty property="email" name="myBean"/></p>
	<p>비밀번호 : <jsp:getProperty property="password" name="myBean"/></p>
</body>
</html>