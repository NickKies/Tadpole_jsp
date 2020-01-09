<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.MemberResult" %>    
<%@ page import="com.member.MemberDAO" %>
<jsp:useBean id="user" class="com.member.User"/>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//http://localhost:8080/06_Member/DaoDto04.jsp?id=1

	MemberDAO dao = new MemberDAO();
	MemberResult result = dao.deleteUser(user);
	if(result.getRows() >0){
		out.println(result.getMsg());
	}else {
%>
	<script>
		alert("<%=result.getMsg()%>")
	</script>
<%		
	}
%>

</body>
</html>