<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.MemberResult" %>
<%@ page import="com.member.MemberDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="com.member.User"/>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DTO와 DAO</title>
</head>
<body>
<%
	MemberDAO dao = new MemberDAO();
	MemberResult result = dao.updateUser(user);
	if(result.getRows()>0){
%>
	결과 : <%=result.getMsg() %>
<%		
	}else{
%>
		<script>
			alert("<%=result.getMsg()%>")
			history.back();
		</script>		
<% 
	}
%>
</body>
</html>