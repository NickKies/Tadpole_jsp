<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// request 객체 : client -> server 정보들
	request.setCharacterEncoding("UTF-8");
	String m_userid = request.getParameter("m_userid");
	String m_name = request.getParameter("m_name");
	String m_pwd = request.getParameter("m_pwd");
	String m_gender = request.getParameter("m_gender");
	String m_zipcord = request.getParameter("m_zipcord");
	String m_address1 = request.getParameter("m_address1");
	String m_address2 = request.getParameter("m_address2");
	String m_address3 = request.getParameter("m_address3");
	String m_hp = request.getParameter("m_hp");
	String m_hobby[] = request.getParameterValues("m_hobby");
	
	//DB처리
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 </title>
</head>
<body>
	<%
		response.sendRedirect("Main.jsp");
	%>
</body>
</html>